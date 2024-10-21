import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  @override
  State<TaskTile> createState() => _TaskTileState();
}
class _TaskTileState extends State<TaskTile> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('i am list tile',style: TextStyle(color: Colors.black,decoration: isChecked ? TextDecoration.overline : null,),),
      trailing: TaskCheckBox(checkBoxState: isChecked,toggleCheckBoxState: (bool checkBoxState) {setState(() {isChecked = checkBoxState;});},),
    );
  }
}

class TaskCheckBox extends StatelessWidget {
  const TaskCheckBox({super.key,required this.checkBoxState,required this.toggleCheckBoxState});
  final bool checkBoxState;
  final Function toggleCheckBoxState;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: checkBoxState,
      activeColor: Colors.lightBlueAccent,
      onChanged: (bool? newValue) {toggleCheckBoxState(newValue);},
    );
  }
}
