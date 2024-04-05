import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';



class QuestionSummary extends StatelessWidget {
  QuestionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {

    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              children: [
                /*Text(((data['question_index'] as int)+1).toString()),*/
                Expanded(
                  child: Column(
                    children: [
                      const SizedBox(height: 5,),
                      Text(data['Question'] as String, style: TextStyle(color: Colors.yellowAccent,fontWeight: FontWeight.bold),),
                      const SizedBox(height: 5,),
                      Text(data['User Answer'] as String, style: TextStyle(color: Colors.white70,fontWeight: FontWeight.bold),),
                      const SizedBox(height: 5,),
                      Text(data['Correct Answer'] as String, style: TextStyle(color: Colors.greenAccent,fontWeight: FontWeight.bold),),
                      const SizedBox(height: 5,),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
