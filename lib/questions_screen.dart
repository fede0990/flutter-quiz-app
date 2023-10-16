import 'package:exercise1/answer_button.dart';
import 'package:flutter/material.dart';
import 'package:exercise1/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<StatefulWidget> createState() {
    return _QuestionsScreen();
  }
}

class _QuestionsScreen extends State<QuestionsScreen> {
  var currentIndex = 0;

  void answerQuestion(String answer) {
    widget.onSelectAnswer(answer);
    setState(({currenctIndex}) {
      currentIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[currentIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 400),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              question.text,
              style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            ...question.getShuffledAnswers().map(
                  (answer) => AnswerButton(
                      answerText: answer, onTap: () => answerQuestion(answer)),
                ),
          ],
        ),
      ),
    );
  }
}
