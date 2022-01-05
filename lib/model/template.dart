import 'package:flutter/material.dart';

abstract class Template extends StatelessWidget {
  const Template({Key? key, required this.title, required this.preview})
      : super(key: key);

  final String title;
  final String preview;
  // Widget? buildBody(BuildContext context);
}
