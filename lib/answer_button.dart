import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(
      {required this.buttonText, required this.onTap, super.key});
  final String buttonText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 1, 19, 39),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 40,
          )),
      child: Text(
        buttonText,
        textAlign: TextAlign.center,
      ),
    );
  }
}
