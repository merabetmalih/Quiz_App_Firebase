
import 'package:tp3/data/model/Question.dart';
import 'package:tp3/data/repositories/QuestionRepository.dart';

class QuestionProvider{
  final QuestionsRepository _repository = QuestionsRepository();

  Future<List<Question>> getAllQuestions() async => await _repository.getQuestions()
        .then(  (value) => value.map( (e) => Question.fromJson( e as Map<String, dynamic> )).toList() )
        .catchError((error) => print("Failed to get questions: $error"));

  Future<void> addQuestion(Question question) async => await _repository.addQuestion(question.toJson());
}