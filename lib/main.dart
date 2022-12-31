import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:tp3/presentation/screens/start/start_screen.dart';

import 'cubit/questions_cubit.dart';
import 'data/repositories/QuestionRepository.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuestionsRepository repository = new QuestionsRepository();
    return MaterialApp(
      title: 'Programming Culture Quiz',
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
          create: (BuildContext context) => QuestionsCubit(repository),
          child: StartScreen()),
    );
  }
}
