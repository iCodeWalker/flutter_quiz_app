import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int finalScore;

  final VoidCallback resetHanlder;

  Result(this.finalScore, this.resetHanlder);

  String get resultPhrase {
    var resultText = 'The final result is : ';

    if (finalScore < 8) {
      String resultText;
    } else if (finalScore <= 12) {
      resultText = 'You are likeable';
    } else if (finalScore <= 16) {
      resultText = 'You are quite strange';
    } else {
      resultText = 'You are bad';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: <Widget>[
        Text(
          resultPhrase,
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        FlatButton(
            onPressed: resetHanlder,
            child: Text('Restart Quiz'),
            textColor: Colors.blue),
      ],
    ));
  }
}
