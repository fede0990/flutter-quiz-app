import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnswerSummary extends StatelessWidget {
  const AnswerSummary(this.summary, {super.key});

  final Map<String, Object> summary;

  @override
  Widget build(BuildContext context) {
    final index = ((summary['question_index'] as int) + 1).toString();
    final question = summary['question'] as String;
    final userAnswer = summary['user_answer'] as String;
    final correctAnswer = summary['correct_answer'] as String;
    final matched = userAnswer == correctAnswer;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: (matched ? Colors.cyanAccent : Colors.pinkAccent),
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(8),
          child: Text(
            index,
            style: GoogleFonts.lato(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                question,
                style: GoogleFonts.lato(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                userAnswer,
                style: GoogleFonts.lato(
                    color: const Color.fromARGB(153, 255, 255, 255),
                    fontSize: 13),
              ),
              const SizedBox(
                height: 1,
              ),
              Text(correctAnswer,
                  style: GoogleFonts.lato(
                      color: const Color.fromARGB(255, 127, 204, 255),
                      fontSize: 13)),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
