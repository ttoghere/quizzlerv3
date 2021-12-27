// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:quizzlerv3/const.dart';
import 'package:quizzlerv3/widgets/quiz.dart';

class ResultPage extends StatelessWidget {
  final int resultScore;
  ResultPage({required this.resultScore});
  String get resultPhrase {
    var resultText = 'Başardın';
    if (resultScore <= 8) {
      resultText = 'Kendini Geliştirmen Lazım';
    } else if (resultScore <= 15) {
      resultText = 'Kötü Değilsin';
    } else if (resultScore > 25) {
      resultText = 'Sen iyisin !!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text('Result Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(resultPhrase, style: sonucStili),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Quiz())),
                child: Text('Re-Start ?')),
          ],
        ),
      ),
    );
  }
}
