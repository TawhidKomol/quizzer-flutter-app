import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(const Quizzer());

class Quizzer extends StatelessWidget {
  const Quizzer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scorekeeper = [];

  void checkAnswer(bool userPicked) {
    bool correctAnswer = quizBrain.getCorrectAnswer();

    setState(() {
      if (quizBrain.isFinished() == true) {
        Alert(
                context: context,
                title: 'Finished!',
                desc: 'You\'ve reached the end of the Quiz.')
            .show();

        quizBrain.reset();
        scorekeeper = [];
      } else {
        if (userPicked == correctAnswer) {
          scorekeeper.add(
            const Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
        } else {
          scorekeeper.add(
            const Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }

        quizBrain.nextQuestion();
      }
    });
  }

  // final List<String> questions = [
  //   'Microsoft is the developer of Dart language.',
  //   'Dart is Case Sensitive Programming Language.',
  //   'Dart has syntax for declaring interface.',
  //   'A Lambda function is a concise mechanism to represent functions. These functions are known as Arrow functions.',
  //   'Getters and Setters allow the program to initialize and retrieve the value of class fields. It is also known as accessors and mutators.',
  //   'The file extension of Dart is .Drt.',
  //   'Dart have syntax to declare interface',
  //   'Method Overloading is a technique that child class redefines a method in its parent class.',
  //   'Pub is a tool for manage Dart packages.',
  //   'A typedef helps to define pointer to execute code within memory.',
  //   'Hot reload maintains the app state while updating the UI almost instantaneously.',
  //   'StatefulWidget is an immutable class that acts as a blueprint for some part of the UI layout.',
  //   'MaterialApp and the corresponding material library is a layer built on top of WidgetsApp',
  //   'Dart code runs on a single thread called an isolate.',
  //   'BuildContext is actually the widget\'s element in the Element tree',
  // ];

  // List<bool> answers = [
  //   false,
  //   true,
  //   false,
  //   true,
  //   true,
  //   false,
  //   true,
  //   false,
  //   true,
  //   true,
  //   true,
  //   false,
  //   true,
  //   true,
  //   true,
  // ];

  // List<Question> questionBank = [
  //   Question(q: 'Microsoft is the developer of Dart language.', a: false),
  //   Question(q: 'Dart is Case Sensitive Programming Language.', a: true),
  //   Question(q: 'Dart has syntax for declaring interface.', a: false),
  //   Question(
  //       q: 'A Lambda function is a concise mechanism to represent functions. These functions are known as Arrow functions.',
  //       a: true),
  //   Question(
  //       q: 'Getters and Setters allow the program to initialize and retrieve the value of class fields. It is also known as accessors and mutators.',
  //       a: true),
  //   Question(q: 'The file extension of Dart is .Drt.', a: false),
  //   Question(q: 'Dart have syntax to declare interface', a: true),
  //   Question(
  //       q: 'Method Overloading is a technique that child class redefines a method in its parent class.',
  //       a: false),
  //   Question(q: 'Pub is a tool for manage Dart packages.', a: true),
  //   Question(
  //       q: 'A typedef helps to define pointer to execute code within memory.',
  //       a: true),
  //   Question(
  //       q: 'Hot reload maintains the app state while updating the UI almost instantaneously.',
  //       a: true),
  //   Question(
  //       q: 'StatefulWidget is an immutable class that acts as a blueprint for some part of the UI layout.',
  //       a: false),
  //   Question(
  //       q: 'MaterialApp and the corresponding material library is a layer built on top of WidgetsApp',
  //       a: true),
  //   Question(
  //       q: 'Dart code runs on a single thread called an isolate.', a: true),
  //   Question(
  //       q: 'BuildContext is actually the widget\'s element in the Element tree',
  //       a: true),
  // ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 18,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
              child: const Text(
                'True',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
              child: const Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                checkAnswer(false);
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Row(
            children: scorekeeper,
          ),
        ),
      ],
    );
  }
}
