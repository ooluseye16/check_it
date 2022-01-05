import 'package:check_it/model/template.dart';
import 'package:flutter/material.dart';

class Template2 extends Template {
  const Template2({
    Key? key,
    required String title,
    required String preview,
    required this.availableOptions,
  }) : super(key: key, title: title, preview: preview);
  final List<String> availableOptions;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.teal,
      ),
      padding: const EdgeInsets.all(8.0),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headline4,
        ),
        const SizedBox(height: 8.0),
        GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            childAspectRatio: 1.5,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 0.0,
            children: availableOptions
                .map<Widget>((e) => CheckItCheckBoxListTile(
                      title: e,
                    ))
                .toList()),
      ]),
    );
  }
}

class CheckItCheckBoxListTile extends StatefulWidget {
  const CheckItCheckBoxListTile({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  State<CheckItCheckBoxListTile> createState() =>
      _CheckItCheckBoxListTileState();
}

class _CheckItCheckBoxListTileState extends State<CheckItCheckBoxListTile> {
  bool _value = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Text(widget.title,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(color: Colors.white)),
        ),
        const SizedBox(width: 10.0),
        InkWell(
          onTap: () {
            setState(() {
              _value = !_value;
            });
          },
          child: Container(
              height: 16,
              width: 16,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 1.0),
                borderRadius: BorderRadius.circular(4),
              ),
              child: _value
                  ? const FittedBox(
                      child: Icon(
                        Icons.check,
                        // size: 30.0,
                        color: Colors.black,
                      ),
                    )
                  : const SizedBox()),
        ),
      ],
    );
  }
}
