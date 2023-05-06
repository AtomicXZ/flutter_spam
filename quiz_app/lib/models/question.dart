class Question {
  final String question;
  final List<String> options;

  const Question(this.question, this.options);

  List<String> getShuffledOptions() {
    final List<String> shuffledList = List.of(options);
    shuffledList.shuffle();
    return shuffledList;
  }
}
