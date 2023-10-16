import 'package:exercise1/data/questions.dart';
import 'package:exercise1/questions_screen.dart';
import 'package:exercise1/results_screen.dart';
import 'package:exercise1/start_screen.dart';
import 'package:flutter/material.dart';

enum ScreenView { starting, questions, results }

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  final List<String> selectedAnswers = [];
  var activeScreen = ScreenView.starting;

  void changeActiveScreen() {
    setState(() {
      activeScreen = ScreenView.questions;
    });
  }

  void selectAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = ScreenView.results;
      });
    }
  }

  void restartQuiz() {
    selectedAnswers.clear();
    setState(() {
      activeScreen = ScreenView.starting;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget widget = StartScreen(changeActiveScreen);
    if (activeScreen == ScreenView.questions) {
      widget = QuestionsScreen(
        onSelectAnswer: selectAnswer,
      );
    }
    if (activeScreen == ScreenView.results) {
      widget = ResultsScreen(
        chosenAnswers: selectedAnswers,
        onRestartClicked: restartQuiz,
      );
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 125, 70, 221),
                Color.fromARGB(255, 72, 41, 127)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: widget),
      ),
    );
  }
}
