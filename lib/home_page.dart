import "package:flutter/material.dart";
import 'package:hive/hive.dart';
import 'package:todo/Util/Data/database.dart';
import 'package:todo/Util/dialougeBox.dart';
import 'package:todo/Util/todo_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _mybox = Hive.box('mybox');
  final _controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    if (_mybox.get("TODOLIST") == null) {
      db.createInitialTask();
    } else {
      db.loadDatabase();
    }
    super.initState();
  }

  ToDoDatabase db = ToDoDatabase();

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoTask[index][1] = !db.toDoTask[index][1];
    });
    db.updateDatabase();
  }

  void saveNewTask() {
    setState(() {
      db.toDoTask.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  void addNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialougeBox(
          controller: _controller,
          onCancel: () => Navigator.of(context).pop(),
          onSave: saveNewTask,
        );
      },
    );
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoTask.removeAt(index);
    });
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        title: const Text("TO DO"),
        elevation: 0,
        toolbarHeight: 30,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent)),
        child: FloatingActionButton(
          onPressed: addNewTask,
          child: const Icon(Icons.add),
        ),
      ),
      body: ListView.builder(
        itemCount: db.toDoTask.length,
        itemBuilder: (context, index) {
          return ToDoList(
            taskName: db.toDoTask[index][0],
            taskValue: db.toDoTask[index][1],
            onchanged: (value) => checkBoxChanged(value, index),
            deletFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
