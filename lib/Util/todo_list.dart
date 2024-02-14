// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoList extends StatelessWidget {
  final String taskName;
  final bool taskValue;
  Function(bool?)? onchanged;
  Function(BuildContext)? deletFunction;
  ToDoList({
    super.key,
    required this.taskName,
    required this.taskValue,
    required this.onchanged,
    required this.deletFunction
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 25, 25, 0),
      child: Slidable(
        endActionPane: ActionPane(
          children: [
            SlidableAction(
              onPressed: deletFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(5),
              
            )
          ],
          motion: const StretchMotion(),
        ),
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              // the checkbox
              Checkbox(value: taskValue, onChanged: onchanged),
              // the task to be done
              Text(
                taskName,
                style: TextStyle(
                    decoration: taskValue
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ],
          ),
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 197, 187, 151),
              borderRadius: BorderRadius.circular(5)),
        ),
      ),
    );
  }
}
