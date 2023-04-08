import 'package:flutter/material.dart';
import 'package:quiz_app2/quiz.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final redColor = MaterialColor(0xFFFF3021, {
      50: Color(0xFFFFEBEE),
      100: Color(0xFFFFCDD2),
      200: Color(0xFFEF9A9A),
      300: Color(0xFFE57373),
      400: Color(0xFFEF5350),
      500: Color(0xFFF44336),
      600: Color(0xFFE53935),
      700: Color(0xFFD32F2F),
      800: Color(0xFFC62828),
      900: Color(0xFFB71C1C),
    });

    return MaterialApp(
      title: 'Flutter Quiz App!',
      theme: ThemeData(
        primarySwatch: redColor,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: QuizPage(),
    );
  }
}