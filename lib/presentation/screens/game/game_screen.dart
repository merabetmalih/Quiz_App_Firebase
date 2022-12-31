import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp3/cubit/questions_cubit.dart';
import 'package:tp3/cubit/questions_states.dart';
import 'package:tp3/presentation/screens/game/quiz_screen.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<QuestionsCubit, QuestionsState>(
            listener: (context, state) {
          if (state is QuestionsError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.message),
            ));
          }
        }, builder: (context, state) {
          QuestionsCubit cubit = QuestionsCubit.get(context);
          //cubit.getAllQuestions();
          if (state is QuestionsInitial) {
            buildLoading();
            cubit.getAllQuestions();
          }
          if (state is QuestionsLoading) {
            return buildLoading();
          } else if (state is QuestionsLoaded) {
            //cubit.getAllQuestions();
            return Quiz(questions: state.questions);
          }

          return CircularProgressIndicator();
        }),
      ),
    );
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
