import 'package:flutter/material.dart';

class CheckItRadioListTile extends StatelessWidget {
  const CheckItRadioListTile({
    Key? key,
    required this.title,
    required this.selectorValue,
    required this.groupValue,
    required this.onChanged,
  }) : super(key: key);

  final String title;
  final String selectorValue;
  final String? groupValue;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        
        Selector(
          value: selectorValue,
          groupValue: groupValue,
          onChanged: onChanged,
        ),
        const SizedBox(width: 8),
        Flexible(
            child: Text(title, style: Theme.of(context).textTheme.bodyText1)),
      ],
    );
  }
}

class Selector extends StatelessWidget {
  const Selector({
    Key? key,
    this.value,
    this.groupValue,
    this.onChanged,
  }) : super(key: key);

  final String? value;
  final String? groupValue;
  final ValueChanged<String?>? onChanged;

  bool get isSelected => value == groupValue;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (isSelected) {
          onChanged?.call(null);
        } else {
          onChanged?.call(value);
        }
      },
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          border: Border.all(
            width: isSelected ? 1.0 : 0.8,
            color: Colors.white,
          ),
          shape: BoxShape.circle,
        ),
        child: isSelected
            ? Center(
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
              )
            : const SizedBox(),
      ),
    );
  }
}
