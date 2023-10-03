import 'package:flutter/material.dart';
class LeadingText extends StatelessWidget {
  final String text;
  const LeadingText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
    style: const TextStyle(
      fontSize: 25,

    ),

    );
  }
}
