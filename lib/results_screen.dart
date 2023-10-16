import 'package:exercise1/data/questions.dart';
import 'package:exercise1/question_summary.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestartClicked,
  });

  final List<String> chosenAnswers;
  final void Function() onRestartClicked;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData
        .where((data) => data['user_answer'] == data['correct_answer'])
        .length;

    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!",
            style: GoogleFonts.lato(color: Colors.white, fontSize: 20),
          ),
          const SizedBox(
            height: 30,
          ),
          QuestionSummary(summaryData: summaryData),
          const SizedBox(
            height: 30,
          ),
          TextButton.icon(
            onPressed: () {
              onRestartClicked();
            },
            icon: const Icon(
              Icons.restart_alt,
              color: Colors.white,
            ),
            label: Text(
              "Restart Quiz!",
              style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
