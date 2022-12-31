import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp3/cubit/questions_states.dart';
import 'package:tp3/data/model/Question.dart';
import 'package:tp3/data/repositories/QuestionRepository.dart';

class QuestionsCubit extends Cubit<QuestionsState>{

  final QuestionsRepository repository;
  List<Question> questions = [];
  int score = 0 ;


  QuestionsCubit(this.repository) : super(QuestionsInitial());

  static QuestionsCubit get (BuildContext context) {
      return BlocProvider.of(context);
  }

  Future<void> getAllQuestions() async {
    try {
      emit(QuestionsLoading());
      List<dynamic> questionsFromRepo = await repository.getQuestions();
      questionsFromRepo.forEach((element) { print(element); questions.add(Question.fromJson(element));});
      emit(QuestionsLoaded(this.questions));
      this.questions = [];
      questionsFromRepo = [];
    } on Exception {
      emit(QuestionsError("Couldn't fetch questions. Is the device online?"));
    }

  }

  Future<void> addQuestion(Question q) async {
    emit(QuestionToBeAdd());
    await repository.get().add(q.toJson()).then((value) => print("Question Added"))
        .catchError((error) => print("Failed to add question: $error"));
    emit(QuestionAdded(q));
    emit(QuestionsInitial());
  }
}