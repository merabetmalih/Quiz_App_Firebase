import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tp3/data/model/Question.dart';
import 'package:tp3/presentation/screens/result/result_screen.dart';
import 'package:tp3/presentation/widget/answer_card.dart';
import 'package:tp3/presentation/widget/button.dart';
import 'package:tp3/presentation/widget/progress_bar.dart';
import 'package:tp3/presentation/widget/resulat_card.dart';

class Quiz extends StatefulWidget {
  final List<Question> questions;

  Quiz({required this.questions});

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  static const delayDuration = 2;
  int questionIndex = 0;
  late String questionText;
  late String theme = 'General';
  int numberOfCorrectAnswers = 0;
  late bool? selectedAnswer = null;
  bool isDelayActive = false;
  late bool isTrueCorrectAnswer;

  int get numberOfQuestions => widget.questions.length;

  @override
  void initState() {
    super.initState();

    questionText = widget.questions[questionIndex].questionText;
  }

  void updateQuiz() async {
    if (selectedAnswer == null) {
      return;
    }

    //String correctAnswer = widget.questions[questionIndex].correctAnswer;
    isTrueCorrectAnswer = widget.questions[questionIndex]
        .isCorrect; //correctAnswer.toLowerCase() == 'true';

    bool isPlayerCorrect =
        selectedAnswer == isTrueCorrectAnswer; //correctAnswer.toLowerCase();

    if (isPlayerCorrect) {
      numberOfCorrectAnswers++;
    }

    setState(() {
      isDelayActive = true;
      questionIndex++;
    });

    await Future.delayed(Duration(seconds: delayDuration));

    if (questionIndex < widget.questions.length) {
      setState(() {
        questionText = widget.questions[questionIndex].questionText;
        theme = widget.questions[questionIndex].theme;
        selectedAnswer = null;
        isDelayActive = false;
      });
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
              numberOfCorrectAnswers: numberOfCorrectAnswers,
              numberOfQuestions: numberOfQuestions),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Center(
                child: ProgessBar(
                  numberOfAnsweredQuestion: questionIndex,
                  totalNumberOfQuestions: numberOfQuestions,
                ),
              ),
              Image.asset(
                'assets_dev/' + theme + '.png',
                width: 140.0,
                height: 140.0,
                fit: BoxFit.cover,
              ),
              Text(
                questionText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Column(
                children: <Widget>[
                  isDelayActive
                      ? ResultCard(
                          titleLabel: 'True',
                          isCorrect: isTrueCorrectAnswer,
                        )
                      : AnswerCard(
                          titleLabel: 'True',
                          isSelected: selectedAnswer == true,
                          onTap: () => setSelectedAnswer(true),
                        ),
                  SizedBox(
                    height: 24,
                  ),
                  isDelayActive
                      ? ResultCard(
                          titleLabel: 'False',
                          isCorrect: !isTrueCorrectAnswer,
                        )
                      : AnswerCard(
                          titleLabel: 'False',
                          isSelected: selectedAnswer == false,
                          onTap: () => setSelectedAnswer(false),
                        ),
                ],
              ),
              Center(
                child: Button(
                  buttonLabel: 'Next',
                  onPressed: () => {
                    selectedAnswer != null && !isDelayActive
                        ? updateQuiz()
                        : null
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void setSelectedAnswer(bool text) {
    setState(() {
      selectedAnswer = text;
    });
  }
}
