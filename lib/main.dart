import 'package:flutter/material.dart';
import 'quizBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(QuizApp());

// Main App structure
class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizAppPage(),
          ),
        ),
      ),
    );
  }
}

class QuizAppPage extends StatefulWidget {
  @override
  _QuizAppPageState createState() => _QuizAppPageState();
}

// Quiz Page
class _QuizAppPageState extends State<QuizAppPage> {
  QuizBrain quizbrain = QuizBrain();
  List<Icon> answersTracker = [];
  int correctAnswers = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Text(
                // question display
                quizbrain.getQuestion(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: RaisedButton(
              onPressed: () {
                checkAnswer(true);
              },
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              color: Colors.green,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: RaisedButton(
              onPressed: () {
                checkAnswer(false);
              },
              child: Text(
                'False',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              color: Colors.red,
            ),
          ),
        ),
        Row(
          children: answersTracker,
        ),
      ],
    );
  }

  // check the answers
  void checkAnswer(bool answer) {
    setState(() {
      if (quizbrain.isFinished() == false) {
        quizbrain.num += 1;
        if (quizbrain.getAnswer() == answer) {
          correctAnswers++;
          answersTracker.add(
            Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
        } else {
          answersTracker.add(
            Icon(
              Icons.clear,
              color: Colors.red,
            ),
          );
        }
      } else {
        Alert(
          context: context,
          type: AlertType.info,
          title: 'Quiz finished!',
          desc: 'Score: $correctAnswers/${answersTracker.length}',
          buttons: [
            DialogButton(
              child: Text(
                "Reset",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 120,
            )
          ],
        ).show();
        quizbrain.resetQuiz();
        answersTracker = [];
        correctAnswers = 0;
      }
      quizbrain.setQuestion();
    });
  }
}
