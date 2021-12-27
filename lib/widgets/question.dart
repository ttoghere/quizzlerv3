import 'package:flutter/material.dart';
import 'package:quizzlerv3/const.dart';

class Question extends StatelessWidget {
  final String questions;
  Question({required this.questions});

  @override
  Widget build(BuildContext context) {
    return Text(
      questions,
      textAlign: TextAlign.center,
      style: questionStyle,
    );
  }
}
