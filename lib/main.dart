import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/result.dart';

import './questions.dart';
import './answer.dart';
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

final questions = const [
  {
    'questionText': 'What\'s your favorite color',
    'answers': [
      {'text': 'Black', 'score': 10},
      {'text': 'Red', 'score': 8},
      {'text': 'Green', 'score': 7},
      {'text': 'White', 'score': 5},
      {'text': 'Purple', 'score': 3}
    ],
  },
  {
    'questionText': 'What\'s your favorite animal',
    'answers': [
      {'text': 'Rabbit', 'score': 2},
      {'text': 'Lion', 'score': 10},
      {'text': 'Dog', 'score': 8},
      {'text': 'Cat', 'score': 4},
    ],
  },
  {
    'questionText': 'What\'s your opinion on size of your house',
    'answers': [
      {'text': 'Big', 'score': 8},
      {'text': 'Cozy', 'score': 6},
      {'text': 'Small', 'score': 4},
      {'text': 'Extra more place', 'score': 10},
    ],
  },
];

class _MyAppState extends State<MyApp> {
  var questionIndex = 0;
  var _totalScore = 0;

  void resetQuiz() {
    setState(() {
      questionIndex = 0;
      _totalScore = 0;
    });
  }

  void answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      questionIndex = questionIndex + 1;
    });

    print(questionIndex);
    if (questionIndex < questions.length) {
      print('You\'ve done it');
    } else {
      print('No more questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('My first App'),
      ),
      body: questionIndex < questions.length
          ? Quiz(
              answerQuestion: answerQuestion,
              questionIndex: questionIndex,
              questions: questions,
            )
          : Result(_totalScore, resetQuiz),
    ));
  }
}
