import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/util/question_summary.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.retryQuiz, this.selectedAnswers, {super.key});

  final void Function() retryQuiz;
  final List<String> selectedAnswers;

  List<Map<String, String>> getSummaryData() {
    List<Map<String, String>> toReturn = [];
    for (int i = 0; i < questions.length; i++) {
      toReturn.add(
        {
          'question-number': "${i + 1}",
          'question': questions[i].question,
          'answer': questions[i].options[0],
          'chosen-option': selectedAnswers[i],
        },
      );
    }
    return toReturn;
  }

  int getNumCorrectQuestions(summaryData) {
    return summaryData
        .where((data) => data['chosen-option'] == data['answer'])
        .length;
  }

  @override
  Widget build(BuildContext context) {
    var summaryData = getSummaryData();
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'You answered ${getNumCorrectQuestions(summaryData)} out of ${questions.length} questions correctly.',
            style: const TextStyle(
              fontSize: 28,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          QuestionSummary(summaryData),
          const SizedBox(height: 30),
          ElevatedButton(
              onPressed: retryQuiz,
              child: Text(
                'Retry Quiz.',
                style: GoogleFonts.sourceSansPro(
                  color: const Color(0xff1e1f2b),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ))
        ],
      ),
    );
  }
}
