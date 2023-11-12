import 'package:flutter/material.dart';

class QuestionTextWidget extends StatelessWidget {
  final String questionText;

  const QuestionTextWidget(this.questionText, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Text(
            questionText,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 25.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
