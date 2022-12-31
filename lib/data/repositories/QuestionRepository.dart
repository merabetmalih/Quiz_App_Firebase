

import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionsRepository {

  var questionsCollection = FirebaseFirestore.instance.collection("questions");

   CollectionReference get () {
    return questionsCollection;
  }

  Future<List<dynamic>> getQuestions() async {
    late List<dynamic> resultat;
    try {
      QuerySnapshot snapshot = await  questionsCollection.get();
      resultat = snapshot.docs.map((e) => e.data()).toList();
    } catch (error) {
      print(error);
    }
    return resultat;
  }

  Future<DocumentReference> addQuestion(Map<String,dynamic> question) async => questionsCollection.add(question);
}