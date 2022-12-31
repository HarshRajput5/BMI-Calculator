import 'package:flutter/material.dart';

class Reuse extends StatelessWidget {
  const Reuse({super.key, required this.cardchild, required this.colour});

  final Color colour;
  final cardchild;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: colour,
      ),
      child: cardchild,
    );
  }
}
