import 'package:flutter/material.dart';
import 'package:quiz_app2/result.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final List<Map<String, Object>> _questions = const [
    {
      'questionText': 'What is Flutter?',
      'answers': [
        {'answerText': 'A programming language!', 'isCorrect': false},
        {
          'answerText': 'A mobile application development framework!',
          'isCorrect': true
        },
        {
          'answerText': 'It is a database management system!',
          'isCorrect': false
        },
        {'answerText': 'It is a game platform!', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'What type of programming language is Dart?',
      'answers': [
        {
          'answerText': 'Object oriented programming language',
          'isCorrect': true
        },
        {'answerText': 'Structured programming language', 'isCorrect': false},
        {'answerText': 'Functional programming language', 'isCorrect': false},
        {'answerText': 'Normal programmin language', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'What is the capital of France?',
      'answers': [
        {'answerText': 'Paris', 'isCorrect': true},
        {'answerText': 'Berlin', 'isCorrect': false},
        {'answerText': 'Madrid', 'isCorrect': false},
        {'answerText': 'Rome', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'What is the most popular programming language?',
      'answers': [
        {'answerText': 'Java', 'isCorrect': false},
        {'answerText': 'Python', 'isCorrect': true},
        {'answerText': 'JavaScript', 'isCorrect': false},
        {'answerText': 'C++', 'isCorrect': false},
      ],
    },
  ];

  int _questionIndex = 0;
  int _score = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _score = 0;
    });
  }

  void _answerQuestion(bool isCorrect) {
    if (isCorrect) {
      _score += 10;
    } else {
      _score -= 5;
    }
    setState(() {
      _questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App!'),
        centerTitle: true,
      ),
      body: _questionIndex < _questions.length
          ? Quiz(
              answerQuestion: _answerQuestion,
              questionIndex: _questionIndex,
              questions: _questions,
            )
          : Result(_score, _resetQuiz),
    );
  }
}

Widget _buildResult() {
  return Center(
    child: Text('Done!'),
  );
}

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz({
    required this.questions,
    required this.questionIndex,
    required this.answerQuestion,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[questionIndex]['questionText'].toString()),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(() => answerQuestion(answer['isCorrect']),
              answer['answerText'].toString());
        }).toList()
      ],
    );
  }
}

class Question extends StatelessWidget {
  final String questionText;
  final Color? color;

  Question(this.questionText, {this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(
        questionText,
        style: TextStyle(
          fontSize: 24,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: selectHandler,
        child: Text(answerText),
      ),
    );
  }
}
