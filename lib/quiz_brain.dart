import 'question.dart';

class QuizBrain {
  int _quesNum = 0;
  final List<Question> _questionBank = [
    Question(q: 'Microsoft is the developer of Dart language.', a: false),
    Question(q: 'Dart is Case Sensitive Programming Language.', a: true),
    Question(q: 'Dart has syntax for declaring interface.', a: false),
    Question(
        q: 'A Lambda function is a concise mechanism to represent functions. These functions are known as Arrow functions.',
        a: true),
    Question(
        q: 'Getters and Setters allow the program to initialize and retrieve the value of class fields. It is also known as accessors and mutators.',
        a: true),
    Question(q: 'The file extension of Dart is .Drt.', a: false),
    Question(q: 'Dart have syntax to declare interface', a: true),
    Question(
        q: 'Method Overloading is a technique that child class redefines a method in its parent class.',
        a: false),
    Question(q: 'Pub is a tool for manage Dart packages.', a: true),
    Question(
        q: 'A typedef helps to define pointer to execute code within memory.',
        a: true),
    Question(
        q: 'Hot reload maintains the app state while updating the UI almost instantaneously.',
        a: true),
    Question(
        q: 'StatefulWidget is an immutable class that acts as a blueprint for some part of the UI layout.',
        a: false),
    Question(
        q: 'MaterialApp and the corresponding material library is a layer built on top of WidgetsApp',
        a: true),
    Question(
        q: 'Dart code runs on a single thread called an isolate.', a: true),
  ];

  void nextQuestion() {
    if (_quesNum < _questionBank.length - 1) {
      _quesNum++;
    }
  }

  String getQuestionText() {
    return _questionBank[_quesNum].questionText;
  }

  bool getCorrectAnswer() {
    return _questionBank[_quesNum].questionAnswer;
  }

  bool isFinished() {
    if (_quesNum >= _questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _quesNum = 0;
  }
}
