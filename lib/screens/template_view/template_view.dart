import 'dart:io';
import 'dart:typed_data';
import 'package:check_it/model/template.dart';
import 'package:check_it/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:ui' as ui;

class TemplateView extends StatefulWidget {
  const TemplateView({Key? key, required this.template}) : super(key: key);
  final Template template;
  @override
  State<TemplateView> createState() => _TemplateViewState();
}

class _TemplateViewState extends State<TemplateView> {
  final GlobalKey _globalKey = GlobalKey();

  String? fileName;

  Future<Uint8List?> _capturePng() async {
    try {
      RenderRepaintBoundary? boundary = _globalKey.currentContext
          ?.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      var pngBytes = byteData!.buffer.asUint8List();
      setState(() {});
      return pngBytes;
    } catch (e) {
      //print(e);
    }
  }

  Future<Directory?> _createPath() async {
    final dirPath = (await getExternalStorageDirectory())!.path;
    List<String> externalPathList = dirPath.split('/');
    int positionOfRootDir = externalPathList.indexOf('0');
    String rootPath =
        externalPathList.sublist(0, positionOfRootDir + 1).join('/');
    final dir = Directory("$rootPath/Check It");

    var storageStatus = await Permission.storage.status;
    var externalStorageStatus = await Permission.manageExternalStorage.status;
    if (!storageStatus.isGranted) {
      await Permission.storage.request();
    }
    if (!externalStorageStatus.isGranted) {
      await Permission.manageExternalStorage.request();
    }
    if ((await dir.exists())) {
      return dir;
    } else {
      await dir.create();
      return dir;
    } // final myImagePath = dir!.first.path;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 27.0, 24.0, 24.0),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child:
                      RepaintBoundary(key: _globalKey, child: widget.template),
                ),
              ),
              const SizedBox(height: 24.0),
              CheckItDefaultButton(
                label: "Save to Device",
                onTap: () {
                  _capturePng().then((image) => _createPath().then(
                        (dir) => showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextField(
                                      decoration: const InputDecoration(
                                        hintText: 'Enter file name',
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          fileName = value;
                                        });
                                      },
                                    ),
                                    const SizedBox(height: 10),
                                    CheckItDefaultButton(
                                      label: 'Save',
                                      onTap: () async {
                                        if (!await File(
                                                '${dir!.path}/$fileName.png')
                                            .exists()) {
                                          final file =
                                              File('${dir.path}/$fileName.png');
                                          file.writeAsBytes(image!);
                                          Navigator.pop(context);
                                        } else {
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  title: const Text(
                                                      'File already exists'),
                                                  content: const Text(
                                                      'Do you want to overwrite the file?'),
                                                  actions: [
                                                    TextButton(
                                                      child: const Text('Yes'),
                                                      onPressed: () {
                                                        final file = File(
                                                            '${dir.path}/$fileName.png');
                                                        file.writeAsBytes(
                                                            image!);
                                                        Navigator.pop(context);
                                                      },
                                                    ),
                                                    TextButton(
                                                      child: const Text('No'),
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                    ),
                                                  ],
                                                );
                                              });
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
