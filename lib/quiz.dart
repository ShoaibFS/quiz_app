import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/models/quiz_questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
 List<String> selectedAns = [];
  var active_screen = 'start-screen';



  void switchScreen() {
    setState(() {
      active_screen = 'questions-screen';
    });
  }

  void chooseAns(String answer){
    selectedAns.add(answer);

    if(selectedAns.length==questions.length){
      setState(() {
        active_screen='result-screen';
      });
    }


  }

  @override
  Widget build(context) {

    Widget screenWidget = StartScreen(switchScreen);

    if (active_screen=='questions-screen'){
      screenWidget=  QuestionScreen(onSelectAns: chooseAns,);
    }

    if(active_screen=='result-screen'){
      screenWidget=ResultScreen(choosenAns: selectedAns,);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.purpleAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
