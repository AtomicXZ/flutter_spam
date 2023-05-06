// ignore_for_file: file_names
import 'package:adv_basics/screens/questions_screen.dart';
import 'package:adv_basics/screens/results_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'data/questions.dart';
import 'package:adv_basics/screens/homescreen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  String activeState = 'home-screen';
  final List<String> selectedAnswers = [];

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeState = 'results-screen';
      });
    }
  }

  void switchToQuestionsScreen() {
    setState(() {
      activeState = 'questions-screen';
    });
  }

  void switchToHomeScreen() {
    setState(() {
      selectedAnswers.clear();
      activeState = 'home-screen';
    });
  }

  Widget switchScreen(String switchTo) {
    return activeState == 'home-screen'
        ? HomeScreen(switchToQuestionsScreen)
        : (activeState == 'questions-screen'
            ? QuestionsScreen(chooseAnswer)
            : ResultScreen(switchToHomeScreen, selectedAnswers));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Advanced Basics',
      theme: ThemeData(
        textTheme: GoogleFonts.sourceCodeProTextTheme().copyWith(
          bodyLarge: const TextStyle(color: Color(0xFFC1BDF0)),
          bodyMedium: const TextStyle(color: Color(0xFFC1BDF0)),
          bodySmall: const TextStyle(color: Color(0xFFC1BDF0)),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 60,
            ),
            backgroundColor: const Color(0xFFC1BDF0),
          ),
        ),
      ),
      home: Scaffold(
        backgroundColor: const Color(0xff1e1f2b),
        body: switchScreen(activeState),
      ),
    );
  }
}
