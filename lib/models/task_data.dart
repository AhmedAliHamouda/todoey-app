import 'package:flutter/material.dart';
import 'package:todoey_app/models/task.dart';
class TaskData extends ChangeNotifier {

  List<Task> tasksAdded = [
    Task(nameTask: 'buy Milk.'),
    Task(nameTask: 'buy bread.'),
    Task(nameTask: 'buy Egg.'),
  ];
int get tasksCount{
  return tasksAdded.length;
}

void addTask(String taskTitle){
  tasksAdded.add(Task(nameTask: taskTitle));
  notifyListeners();
}

void updateTask(Task task){
  task.toggleDoneCheck();
  notifyListeners();
}

void deleteTask(int index){
  tasksAdded.removeAt(index);
  notifyListeners();
}

}