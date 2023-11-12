import 'package:flutter/material.dart';

class QuizButtonWidget extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  final Color color;

  const QuizButtonWidget({
    super.key,
    required this.onPressed,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: MaterialButton(
          color: color,
          onPressed: onPressed,
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
