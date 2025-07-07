import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:todoey/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'i am list tile 1'),
    Task(name: 'i am list tile 2'),
    Task(name: 'i am list tile 3'),
  ];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  void addTask(String newTaskString) {
    final task = Task(name: newTaskString);
    _tasks.add(task);
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  int get taskCount {
    return _tasks.length;
  }
}
