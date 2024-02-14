import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  List toDoTask = [];
  final _mybox = Hive.box('mybox');


// run only once when the app is opend
  void createInitialTask() {
    toDoTask = [
      ["Click on the add button to add a task", false],
      ["slide on the todo task to delete them", false]
    ];
  }

  // load the database to the app
  void loadDatabase() {
    toDoTask = _mybox.get("TODOLIST");
  }

  void updateDatabase() {
    _mybox.put("TODOLIST", toDoTask);
  }
}
