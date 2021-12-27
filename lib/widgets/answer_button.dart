// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final VoidCallback buttonFunc;
  final String cevapMetni;
  AnswerButton({required this.buttonFunc, required this.cevapMetni});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: buttonFunc,
      icon: const Icon(Icons.question_answer),
      label: Text(cevapMetni),
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(10.0),
          primary: Colors.red[900],
          onPrimary: Colors.white),
    );
  }
}
