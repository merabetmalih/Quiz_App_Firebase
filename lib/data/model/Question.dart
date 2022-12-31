class Question {
  late String questionText;
  late String theme;
  late bool isCorrect;
  //late String imgSrcPath = 'assets_dev/';

  Question(
      {required this.questionText,
      required this.theme,
      required this.isCorrect});

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        questionText: json['question'],
        theme: json['theme'],
        isCorrect: json['isCorrect'],
      );

  Map<String, dynamic> toJson() {
    return {
      'question': questionText,
      'theme': theme,
      'isCorrect': isCorrect,
    };
  }
}
