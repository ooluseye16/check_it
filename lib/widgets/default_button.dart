import 'package:flutter/material.dart';

class CheckItDefaultButton extends StatelessWidget {
  const CheckItDefaultButton({
    Key? key,
    this.onTap,
    required this.label,
  }) : super(key: key);
  final VoidCallback? onTap;
  final String label;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: Text(
            label,
            style: Theme.of(context).textTheme.button,
          ),
        ),
      ),
    );
  }
}
