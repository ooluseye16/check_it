import 'package:check_it/model/template.dart';
import 'package:check_it/model/this_or_that.dart';
import 'package:check_it/widgets/this_or_that_tile.dart';
import 'package:flutter/material.dart';

class Template1 extends Template {
  const Template1({
    required String preview,
    Key? key,
    required String title,
    required this.thisOrThatvalues,
  }) : super(key: key, preview: preview, title: title);

  final List<ThisOrThat> thisOrThatvalues;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Text(
              title ,
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          const SizedBox(height: 5.0),
          Container(width: 100, height: 2, color: Colors.white),
          const SizedBox(height: 16.0),
          CardBody(thisOrThatvalues: thisOrThatvalues),
        ],
      ),
    );
  }
}

class CardBody extends StatelessWidget {
  const CardBody({Key? key, required this.thisOrThatvalues}) : super(key: key);
  final List<ThisOrThat> thisOrThatvalues;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          children: List.generate(
            thisOrThatvalues.length,
            (index) => ThisOrThatTile(
              thisOrThat: thisOrThatvalues[index],
            ),
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(width: 2, height: 100, color: Colors.white),
            Text("OR", style: Theme.of(context).textTheme.headline4),
            Container(width: 2, height: 100, color: Colors.white),
          ],
        ),
      ],
    );
  }
}
