import 'package:flutter/material.dart';
import 'package:todoey/models/task_data.dart';
import 'package:todoey/screens/task_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskData>(
      create: (BuildContext context) {
        return TaskData();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TaskScreen(),
      ),
    );
  }
}

class Level1 extends StatelessWidget {
  const Level1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(child: Level2());
  }
}

class Level2 extends StatelessWidget {
  const Level2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyTextField(),
        Level3(),
      ],
    );
  }
}

class Level3 extends StatelessWidget {
  const Level3({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(Provider
        .of<Data>(context, listen: false)
        .data);
  }
}

class MyText extends StatelessWidget {
  const MyText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(Provider
        .of<Data>(context)
        .data);
  }
}

class MyTextField extends StatelessWidget {
  const MyTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (newText) {
        Provider.of<Data>(context, listen: false).changeString(newText);
      },
    );
  }
}

class Data extends ChangeNotifier {
  String data = 'Some data';

  void changeString(String newString) {
    data = newString;
    notifyListeners();
  }
}
