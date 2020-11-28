class Task {
  final String nameTask;
  bool isDone;
  Task({this.nameTask, this.isDone = false});

  void toggleDoneCheck() {
    isDone = !isDone;
    //print(isDone);
  }
}
