import 'package:flutter/material.dart';

class MYButton extends StatelessWidget {
    final String Name;
    VoidCallback onPressed;

  MYButton({super.key,required this.Name,required this.onPressed});


  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      
      onPressed: onPressed,
      color: const Color.fromARGB(255, 229, 226, 83),
      child: Text(Name),
      

      
    );
  }
}
