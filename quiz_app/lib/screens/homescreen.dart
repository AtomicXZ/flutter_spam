import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            height: 300,
            color: const Color(0xFFC1BDF0),
          ),
          const SizedBox(
            height: 40,
          ),
          const Text(
            'Learning Flutter the Fun Way!',
            style: TextStyle(
              fontSize: 26,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton.icon(
            onPressed: startQuiz,
            icon: const Icon(
              Icons.play_arrow_outlined,
              color: Color(0xff1e1f2b),
            ),
            label: Text(
              'Start Quiz',
              style: GoogleFonts.sourceSansPro(
                color: const Color(0xff1e1f2b),
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          )
        ],
      ),
    );
  }
}
