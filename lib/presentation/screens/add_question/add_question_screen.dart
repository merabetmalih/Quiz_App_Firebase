import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tp3/configs/AppColors.dart';
import 'package:tp3/cubit/questions_cubit.dart';
import 'package:tp3/data/model/Question.dart';

class AddQuestionScreen extends StatefulWidget {
  @override
  _AddQuestionScreenState createState() => _AddQuestionScreenState();
}

class _AddQuestionScreenState extends State<AddQuestionScreen> {
  String _name = '';
  bool _isCorrect = false;
  String theme = 'General';

  List<String> items = [
    'General',
    'Science',
    'Geography',
    'Countries',
    'Philosophic'
  ];
  bool _value = false;
  int val = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Question'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                print(_name);
                print(_isCorrect);
                print(theme);
                final snackBar =
                    SnackBar(content: Text('Yay! A You added a Question!'));
                addQuestion(context, _name, _isCorrect, theme);
                ScaffoldMessenger.of(context).showSnackBar(snackBar);

                Navigator.pop(context);
              },
              icon: Icon(Icons.check))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              style: TextStyle(color: AppColors.dodgerBlue),
              decoration: InputDecoration(
                labelText: 'Name',
                fillColor: AppColors.dodgerBlue,
                hintText: 'Name',
                contentPadding:
                    const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.dodgerBlue),
                  borderRadius: BorderRadius.circular(25.7),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.dodgerBlue),
                  borderRadius: BorderRadius.circular(25.7),
                ),
              ),
              onChanged: (name) {
                _name = name;
              },
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ListTile(
                  title: Text("True"),
                  leading: Radio(
                    value: 1,
                    focusColor: AppColors.dodgerBlue,
                    groupValue: "same",
                    onChanged: (value) {
                      _isCorrect = true;
                    },
                    activeColor: AppColors.tomato,
                  ),
                ),
                ListTile(
                  title: Text("False"),
                  leading: Radio(
                    value: 2,
                    groupValue: "same",
                    onChanged: (value) {
                      _isCorrect = false;
                    },
                    activeColor: AppColors.tomato,
                  ),
                ),
              ],
            ),
            DropdownButtonFormField(
                value: "General",
                items: [
                  DropdownMenuItem(
                    child: Text("General"),
                    value: "General",
                  ),
                  DropdownMenuItem(
                    child: Text("Philosophic"),
                    value: "Philosophic",
                  ),
                  DropdownMenuItem(
                    child: Text("Countries"),
                    value: "Countries",
                  ),
                  DropdownMenuItem(child: Text("Science"), value: "Science"),
                  DropdownMenuItem(child: Text("Geography"), value: "Geography")
                ],
                onChanged: (value) {
                  theme = value as String;
                  theme = theme.toLowerCase();
                }),
          ],
        ),
      ),
    );
  }

  addQuestion(BuildContext context, String text, bool isCorrect, String theme) {
    QuestionsCubit cubit = QuestionsCubit.get(context);
    Question question =
        Question(questionText: text, theme: theme, isCorrect: isCorrect);
    cubit.addQuestion(question);
  }
}
