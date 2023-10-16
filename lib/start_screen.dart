import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/quiz-logo.png",
            width: 250,
            color: const Color.fromARGB(144, 239, 239, 239),
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            "Learn flutter the fun way!",
            style: GoogleFonts.lato(fontSize: 26, color: Colors.white),
          ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
              onPressed: () {
                startQuiz();
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.arrow_right_alt),
              label: Text(
                "Start Quiz",
                style: GoogleFonts.lato(
                  fontSize: 18,
                ),
              ))
        ],
      ),
    );
  }
}
