import 'package:flutter/material.dart';

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
  final List<Icon> scorekeeper = [];

  final List<String> questions = [
    'Microsoft is the developer of Dart language.',
    'Dart is Case Sensitive Programming Language.',
    'Dart has syntax for declaring interface.',
    'A Lambda function is a concise mechanism to represent functions. These functions are known as Arrow functions.',
    'Getters and Setters allow the program to initialize and retrieve the value of class fields. It is also known as accessors and mutators.',
    'The file extension of Dart is .Dart.',
    'Dart have syntax to declare interface',
    'Method Overloading is a technique that child class redefines a method in its parent class.',
    'Pub is a tool for manage Dart packages.',
    'A typedef helps to define pointer to execute code within memory.',
    'Hot reload maintains the app state while updating the UI almost instantaneously.',
    'StatefulWidget is an immutable class that acts as a blueprint for some part of the UI layout.',
    'MaterialApp and the corresponding material library is a layer built on top of WidgetsApp',
    'Dart code runs on a single thread called an isolate.',
    'BuildContext is actually the widget\'s element in the Element tree',
  ];
  int quesNum = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 12,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questions[quesNum],
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
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              child: const Text(
                'True',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                setState(() {
                  quesNum++;
                  scorekeeper.add(
                    const Icon(
                      Icons.check,
                      color: Colors.green,
                    ),
                  );
                });
              },
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              child: const Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                setState(() {
                  quesNum++;
                  scorekeeper.add(
                    const Icon(
                      Icons.,
                      color: Colors.green,
                    ),
                  );
                });
              },
            ),
          ),
        ),
        Row(
          children: scorekeeper,
        ),
      ],
    );
  }
}
