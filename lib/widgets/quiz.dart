// ignore_for_file: prefer_final_fields, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:quizzlerv3/screens/resultpage.dart';
import 'package:quizzlerv3/widgets/answer_button.dart';
import 'package:quizzlerv3/widgets/question.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var _questions = [
    {
      'soruMetni': 'Favori renk seçimin nedir?',
      'cevaplar': [
        {'metin': 'Siyah', 'puan': 3},
        {'metin': 'Kırmızı', 'puan': 10},
        {'metin': 'Mavi', 'puan': 7},
        {'metin': 'Turuncu', 'puan': 5},
      ],
    },
    {
      'soruMetni': 'Favori hayvan seçimin nedir?',
      'cevaplar': [
        {'metin': 'Kedi', 'puan': 3},
        {'metin': 'Köpek', 'puan': 10},
        {'metin': 'Ejderha', 'puan': 7},
        {'metin': 'Kuş', 'puan': 5},
      ],
    },
    {
      'soruMetni': 'Favori müzik türün nedir?',
      'cevaplar': [
        {'metin': 'R&B', 'puan': 3},
        {'metin': 'Rock', 'puan': 10},
        {'metin': 'Jazz', 'puan': 7},
        {'metin': 'Blues', 'puan': 5},
      ],
    },
  ];

  var _index = 0;
  var _totalScore = 0;
  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _index++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return (_index <= _questions.length - 1)
        ? Scaffold(
            backgroundColor: Colors.blueGrey,
            appBar: AppBar(
              title: const Text('Quiz App Bar'),
            ),
            body: Center(
              //Özelleştirilebilen mükemmel kapsayıcı widget
              child: Container(
                margin: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Bağımsız hale gelen widget gösterim şekli,
                    //parametreli yada parametresiz olarak değişebilir
                    Question(
                      questions: _questions[_index]["soruMetni"].toString(),
                    ),
                    //Boş alan oluşturmayı sağlayan kutu
                    SizedBox(
                      height: 10.0,
                    ),
                    //Bağımsız hale gelen widget gösterim şekli,
                    //parametreli yada parametresiz olarak değişebilir
                    // AnswerButton(
                    //   buttonFunc: answerQuestion,
                    //   cevapMetni: _questions[_index]['cevaplar'].toString(),
                    // ),
                    /*-------------------------------------------------------*/
                    //Spread operatörü kullanımı ile çoklu olan cevapları bölüp yayılması sağlandı "..."
                    //Map kullanımı söz konusu olduğu için onu en başında listeye çevirdik
                    //Listeye çevirmek için "as" operatörü kullandık
                    ...(_questions[_index]["cevaplar"]
                            as List<Map<String, Object>>)
                        .map((cevaplar) {
                      return AnswerButton(
                          buttonFunc: () =>
                              _answerQuestion(cevaplar["puan"] as int),
                          cevapMetni: cevaplar["metin"].toString());
                    }).toList(),
                  ],
                ),
              ),
            ),
          )
        : ResultPage(
            resultScore: _totalScore,
          );
  }
}
