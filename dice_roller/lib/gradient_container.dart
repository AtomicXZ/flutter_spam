import 'package:flutter/material.dart';
import 'package:first_app/dice.dart';

class GradientContainer extends StatelessWidget {
  GradientContainer({
    super.key,
    required this.message,
    this.color = const [
      Color.fromARGB(255, 255, 152, 152),
      Color.fromARGB(255, 147, 80, 255),
    ],
  });

  final String message;
  final List<Color> color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: color,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: const Center(
        child: Dice(),
      ),
    );
  }
}
