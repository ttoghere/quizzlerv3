// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:quizzlerv3/widgets/quiz.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Quiz(),
    );
  }
}
