import 'package:flutter/material.dart';

class Gender extends StatelessWidget {
  const Gender({super.key, required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          // FontAwesomeIcons.mars,
          icon,
          size: 80,
        ),
        Text(
          text,
          style: const TextStyle(fontSize: 18),
        )
      ],
    );
  }
}
