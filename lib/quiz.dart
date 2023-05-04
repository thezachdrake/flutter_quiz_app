import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/data/questions.dart';
import 'package:flutter_quiz_app/questions.dart';
import 'package:flutter_quiz_app/start_screen.dart';
import 'package:flutter_quiz_app/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var activeScreen = "start-screen";
  List<String> selectedAnswers = [];

  void switchScreen() {
    setState(() {
      activeScreen = "questions-screen";
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = "results-screen";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screnWidget = StartScreen(switchScreen);
    if (activeScreen == "questions-screen") {
      screnWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (activeScreen == "results-screen") {
      screnWidget = ResultsScreen(
        chooseAnswers: selectedAnswers,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.deepPurple.shade900, Colors.deepPurpleAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
          ),
          child: screnWidget,
        ),
      ),
    );
  }
}
