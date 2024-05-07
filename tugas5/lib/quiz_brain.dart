import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;

  final List<Question> _questionBank = [
    Question(
        questionText:
            "Paimon adalah karakter yang bisa dimainkan secara aktif dalam tim",
        questionAnswer: false),
    Question(
        questionText:
            "Arlecchino adalah salah satu dari Eleven Harbingers yang setia kepada Tsaritsa",
        questionAnswer: true),
    Question(
        questionText: "Thoma adalah karakter yang berasal dari Mondstadt",
        questionAnswer: true),
    Question(
        questionText:
            "Lantern Rite adalah acara yang diadakan setahun sekali di Inazuma",
        questionAnswer: false),
    Question(
        questionText:
            "Domain of Guyun adalah domain petualangan di wilayah Liyue",
        questionAnswer: true),
    Question(
        questionText:
            "Di alam terbuka, karakter-karakter dengan elemen Cryo dapat membekukan air",
        questionAnswer: true),
    Question(
        questionText: "Dendro adalah elemen yang dikuasai oleh Archon Fontaine",
        questionAnswer: false),
    Question(
        questionText:
            "Barbara adalah saudara kandung dari Jean dalam cerita Genshin Impact",
        questionAnswer: true),
    Question(
        questionText:
            "Selain karakter, senjata juga memiliki elemen dalam Genshin Impact",
        questionAnswer: false),
    Question(
        questionText:
            "Timur Tengah adalah inspirasi bagi desain arsitektur kota Liyue",
        questionAnswer: false),
    Question(
        questionText:
            "Gliding Champion adalah gelar yang diberikan kepada karakter Amber di kota Mondstadt",
        questionAnswer: true),
    Question(
        questionText:
            "Steak Tartare adalah makanan khas Fontaine yang dapat meningkatkan HP karakter",
        questionAnswer: true)
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getCorrectAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  //TODO: Step 3 Part A - create isFinished method that checks the last questions.
  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      print('returning true');
      return true;
    } else {
      return false;
    }
  }

  //TODO: Menghitung jumlah pertanyaan
  int getTotalQuestions() {
    return _questionBank.length;
  }

  //TODO: Step 4 Part B - Create a reset() method that sets the questionNumber back to 0
  void reset() {
    _questionNumber = 0;
  }
}
