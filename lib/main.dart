import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What is your favourite color',
      'answers': [
        {'text': 'red', 'score': 2},
        {'text': 'blue', 'score': 5},
        {'text': 'green', 'score': 8},
        {'text': 'black', 'score': 10}
      ]
    },
    {
      'questionText': 'What is your favourite animal',
      'answers': [
        {'text': 'cat', 'score': 5},
        {'text': 'dog', 'score': 7},
        {'text': 'cow', 'score': 8},
        {'text': 'lion', 'score': 10},
      ]
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore = _totalScore + score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print('Answer choosen $_questionIndex');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('My First App'),
      ),
      body: _questionIndex < _questions.length
          ? Quiz(
              answerQuestion: _answerQuestion,
              questionIndex: _questionIndex,
              questions: _questions,
            )
          : Result(_totalScore, _resetQuiz),
    ));
    // Scaffold gives us a base page design for our app.
    // Gives basic design, color, and scheme for the ui.
  }
}
