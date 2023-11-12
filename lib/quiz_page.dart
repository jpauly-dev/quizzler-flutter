import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'question_text_widget.dart';
import 'quiz_button_widget.dart';
import 'quizzler_brain.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final quizBrain = QuizBrain();

  List<bool> scoreKeeper = [];

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getCorrectAnswer();

    setState(() {
      if (quizBrain.isFinished()) {
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz.',
        ).show();

        quizBrain.reset();
        scoreKeeper.clear();
      } else {
        scoreKeeper.add(userPickedAnswer == correctAnswer);
        quizBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        QuestionTextWidget(
          quizBrain.getQuestionText(),
        ),
        QuizButtonWidget(
          onPressed: () => checkAnswer(true),
          text: "True",
          color: Colors.green,
        ),
        QuizButtonWidget(
          onPressed: () => checkAnswer(false),
          text: "False",
          color: Colors.red,
        ),
        Row(
          children: scoreKeeper.map((score) => getIcon(score)).toList(),
        ),
      ],
    );
  }

  Icon getIcon(bool score) {
    return score
        ? const Icon(Icons.check, color: Colors.green)
        : const Icon(Icons.close, color: Colors.red);
  }
}
