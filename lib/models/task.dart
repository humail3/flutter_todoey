import 'package:flutter/material.dart';

class Task {
  String name;
  bool isDone = false;

  Task({required this.name});

  void toggleDone() {
    isDone = !isDone;
  }
}
