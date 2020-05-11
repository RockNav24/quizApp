import 'question.dart';

class QuizBrain {
  int _questionNum = 0;
  int num = 0;

  List<Question> _questions = [
    Question(question: 'In space it is impossible to cry?', answer: true),
    Question(
        question:
            '"Copyrightable" is the longest word in the English language that can be written without repeating a letter?',
        answer: false),
    Question(question: 'Slug\'s don\'t have any noses?', answer: false),
    Question(question: 'Most Eskimoes have fridges?', answer: true),
    Question(
        question: 'An Ostrich\'s eye is bigger than it\'s brain?',
        answer: true),
    Question(
        question:
            'Thomas Edison, who invented the lightbulb, was afraid of the dark?',
        answer: true),
    Question(
        question: 'There are no anagrams of the word "stationed"?',
        answer: false),
    Question(
        question: 'Taphephobia is the fear of losing your teeth?',
        answer: false),
    Question(
        question:
            'Over 80,000 photographs are taken around the world every second?',
        answer: false),
    Question(
        question:
            'The letter "t" is the second most common letter used in the English language?',
        answer: true),
  ];

  String getQuestion() {
    return _questions[_questionNum].question;
  }

  bool getAnswer() {
    return _questions[_questionNum].answer;
  }

  void setQuestion() {
    if (_questionNum < _questions.length - 1) {
      _questionNum++;
    }
  }

  bool isFinished() {
    if (num >= _questions.length) {
      return true;
    } else {
      return false;
    }
  }

  void resetQuiz() {
    _questionNum = -1;
    num = 0;
  }
}
