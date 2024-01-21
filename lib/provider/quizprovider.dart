import 'package:flutter/material.dart';
import 'package:tp2_exercice01_provider/models/quizmodel.dart';

class QuizProvider with ChangeNotifier {
  List<Quiz> _quizzes = [];
  int _index;

  QuizProvider(this._index, this._quizzes);

  void nextQuiz() {
    index = (index + 1) % quizzes.length;
    notifyListeners();
  }

  int get index => _index;

  set index(int value) {
    _index = value;
    notifyListeners();
  }

  List<Quiz> get quizzes => _quizzes;

  set quizzes(List<Quiz> value) {
    _quizzes = value;
    notifyListeners();
  }

  SnackBar correctAnswer(){
    var snackMessage = "Correct answer :)";
    return SnackBar(
        content: Text(snackMessage), backgroundColor: Colors.green
    );
  }
  SnackBar wrongAnswer(){
    var snackMessage = "Wrong answer :(";
    return SnackBar(
        content: Text(snackMessage), backgroundColor: Colors.red
    );
  }

}
