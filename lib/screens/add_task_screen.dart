import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  String newTaskTitle = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30.0), topLeft: Radius.circular(30.0))),
      padding:
          EdgeInsets.only(left: 50.0, right: 50.0, top: 30.0, bottom: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Add Task',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.lightBlueAccent,
                fontWeight: FontWeight.w600,
                fontSize: 25.0),
          ),
          TextField(
            cursorColor: Colors.lightBlueAccent,
            autofocus: true,
            onChanged: (String value) {
              newTaskTitle = value;
            },
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.lightBlueAccent,
                    width: 3.0), // Change underline color when focused
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color:
                        Colors.grey), // Change underline color when not focused
              ),
            ),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Colors.lightBlueAccent),
              ),
              onPressed: () {
                if (newTaskTitle.isEmpty) {
                  return; // Avoid adding empty tasks
                }
                // Add task to your task list
                Provider.of<TaskData>(context, listen: false)
                    .addTask(newTaskTitle);
                Navigator.pop(context);
              },
              child: Text('Add Task', style: TextStyle(color: Colors.white))),
        ],
      ),
    );
  }
}
