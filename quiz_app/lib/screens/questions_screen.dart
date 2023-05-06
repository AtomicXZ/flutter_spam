import 'package:flutter/material.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/util/answer_button.dart';
import 'package:adv_basics/models/question.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.chooseAnswer, {super.key});

  final void Function(String) chooseAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int questionNumber = 0;

  void nextQuestion() {
    setState(() {
      questionNumber++;
    });
  }

  @override
  Widget build(BuildContext context) {
    Question currentQuestion = questions[questionNumber];

    return Container(
      margin: const EdgeInsets.all(50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            currentQuestion.question,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 40,
          ),
          ...currentQuestion.getShuffledOptions().map(
                (option) => Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AnswerButton(
                      message: option,
                      onTap: () {
                        widget.chooseAnswer(option);
                        nextQuestion();
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
        ],
      ),
    );
  }
}
