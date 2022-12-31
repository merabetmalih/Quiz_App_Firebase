import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp3/configs/AppColors.dart';
import 'package:tp3/presentation/screens/add_question/add_question_screen.dart';
import 'package:tp3/presentation/screens/game/game_screen.dart';
import 'package:tp3/presentation/widget/button.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 500,
          decoration: BoxDecoration(
            color: AppColors.dodgerBlue,
            borderRadius: BorderRadius.circular(150),
          ),
          child: Center(
            child: const Text('Programming Culture Quiz',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )),
          ),
        ),

        SizedBox(height: 300), // give it width
        Flexible(
            child: Button(
          buttonLabel: 'Start Answering Questions',
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GameScreen(),
            ),
          ),
        )),
        SizedBox(height: 20), // give it width

        Flexible(
            child: Button(
          buttonLabel: 'Add a new questions',
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddQuestionScreen(),
            ),
          ),
        )),

        SizedBox(height: 20)
      ],
    )));
  }
}
