import 'package:exercise1/answer_summary.dart';
import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 400,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
        child: Column(
          children: summaryData.map((e) {
            return AnswerSummary(e);
          }).toList(),
        ),
      ),
    );
  }
}
