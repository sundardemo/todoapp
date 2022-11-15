import 'package:flutter/material.dart';
import 'package:todoapp/model/task.dart';

class TodoProvider extends ChangeNotifier {
  List<Task> tasks = [];
  //int dummyNumber = 0;

  void addTask(title, desc) {
    Task task = Task(title: title, description: desc, isCompleted: false);
    tasks.add(task);
    notifyListeners();
  }

  // getTaskCount() {
  //   return tasks.length;
  // }

  get getTaskCount => tasks.length;

  // set setDummy(n) => dummyNumber = n;
  // setDummy(n){
  //   dummyNumber = n;
  // }

  int getCompletedTaskCount() {
    var completdTasks = tasks.where((task) => task.isCompleted == true);
    return completdTasks.length;
  }

  void deleteTask(index) {
    tasks.removeAt(index);
    notifyListeners();
  }

  void markAsComplete(index) {
    tasks[index].isCompleted = true;
    notifyListeners();
  }

  void markAsInComplete(index) {
    tasks[index].isCompleted = false;
    notifyListeners();
  }
}
