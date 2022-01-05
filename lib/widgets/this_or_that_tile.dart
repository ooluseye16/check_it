import 'package:check_it/model/this_or_that.dart';
import 'package:check_it/widgets/check_box_list_tile.dart';
import 'package:flutter/material.dart';

class ThisOrThatTile extends StatefulWidget {
  const ThisOrThatTile({
    Key? key,
    required this.thisOrThat,
  }) : super(key: key);
  final ThisOrThat thisOrThat;

  @override
  State<ThisOrThatTile> createState() => _ThisOrThatTileState();
}

class _ThisOrThatTileState extends State<ThisOrThatTile> {
  String? groupValue;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          Expanded(
            child: CheckItRadioListTile(
                title: widget.thisOrThat.thisText!,
                selectorValue: widget.thisOrThat.thisText!,
                groupValue: groupValue,
                onChanged: (value) {
                  setState(() {
                    groupValue = value;
                  });
                }),
          ),
          const SizedBox(width: 30),
          Expanded(
            child: CheckItRadioListTile(
                title: widget.thisOrThat.thatText!,
                selectorValue: widget.thisOrThat.thatText!,
                groupValue: groupValue,
                onChanged: (value) {
                  setState(() {
                    groupValue = value;
                  });
                }),
          ),
        ],
      ),
    );
  }
}
