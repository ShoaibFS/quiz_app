import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_summary.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/quiz.dart';
import 'package:quiz_app/start_screen.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({Key? key, required this.choosenAns}) : super(key: key);

  final List<String> choosenAns;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenAns.length; i++) {
      summary.add({
        'Question_index': i,
        'Question': questions[i].text,
        'Correct Answer': questions[i].answers[0],
        'User Answer': choosenAns[i]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryD = getSummaryData();
    final numTotalQues = questions.length;
    final numCorrectQues = summaryD.where((data) {
      return data['User Answer'] == data['Correct Answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQues out of $numTotalQues answers correctly!',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary(summaryD),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Quiz()),
                );
              },
              child: const Text('Restart Quiz'),
            )
          ],
        ),
      ),
    );
  }
}
