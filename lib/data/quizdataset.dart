import 'package:tp2_exercice01_provider/models/quizmodel.dart';

List<Quiz> getQuizzes() {
  List<Quiz> quizzes = [];

  Quiz quiz = new Quiz(image: '', question: '', answer: '');
  quiz.setImage("images/U+200B.jpg");
  quiz.setQuestion("U+200B is used to create empty post or comment in facebook.");
  quiz.setAnswer("True");
  quizzes.add(quiz);

  quiz = new Quiz(image: '', question: '', answer: '');
  quiz.setImage("images/BAT.jpg");
  quiz.setQuestion("Basic-Attention-Token is security blockchain token.");
  quiz.setAnswer("False");
  quizzes.add(quiz);

  quiz = new Quiz(image: '', question: '', answer: '');
  quiz.setImage("images/Rust.jpg");
  quiz.setQuestion("Rust language enforces memory safety.");
  quiz.setAnswer("True");
  quizzes.add(quiz);

  return quizzes;
}
