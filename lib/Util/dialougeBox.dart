
import 'package:flutter/material.dart';
import 'package:todo/Util/MYButton.dart';

class DialougeBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialougeBox({super.key,required this.controller
  ,required this.onCancel,
  required this.onSave
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 0,
      backgroundColor: const Color.fromARGB(255, 197, 187, 151),
      content: Container(
        color: const Color.fromARGB(255, 197, 187, 151),
        height: 120,
        child: Column(
          children: [
            // get the user input
            TextField(
              controller:controller ,
              
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(3)),
                hintText: "Add a new Task",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                
                MYButton(Name: "Save", onPressed: onSave),
                const SizedBox(width: 20),
                MYButton(Name: "Cancel", onPressed: onCancel),

                //save button
                // cancel button
              ],
            )
          ],
        ),
      ),
    );
  }
}
