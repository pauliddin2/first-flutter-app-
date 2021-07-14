import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get TextPhrase {
    var resultText = 'You have done it';
    if (resultScore <= 30 && resultScore >= 26) {
      resultText = 'You are more like bad-tempered person.';
    }
    else if (resultScore >= 15 && resultScore <=25) {
      resultText = 'It seems like you are calm person.';
    }
     else if (resultScore == 9 || resultScore <=14) {
      resultText = 'You are too naive person.';
    } 
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            TextPhrase,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text('Reset the quiz!'),
            textColor: Colors.blue,
            onPressed: resetHandler,
          )
        ],
      ),
    );
  }
}
