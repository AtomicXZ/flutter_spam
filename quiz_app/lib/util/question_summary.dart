import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});

  final List<Map<String, String>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: 325,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData
              .map((data) => Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: data['answer'] == data['chosen-option']
                                  ? const Color.fromARGB(255, 150, 241, 162)
                                  : const Color.fromARGB(255, 255, 194, 219),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Center(
                              child: Text(
                                '${data['question-number']}.',
                                style: const TextStyle(
                                  color: Color(0xff1e1f2b),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data['question'].toString(),
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  'Correct Answer: ${data['answer'].toString()}',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Color.fromARGB(255, 255, 194, 219),
                                  ),
                                ),
                                Text(
                                  'Selected Answer: ${data['chosen-option'].toString()}',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Color.fromARGB(255, 150, 241, 162),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  ))
              .toList(),
        ),
      ),
    );
  }
}
