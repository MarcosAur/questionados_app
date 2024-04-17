import 'package:flutter/material.dart';

class Reply extends StatelessWidget {
  final void Function(bool) onPressed;
  final String text;
  final bool isCorrect;

  const Reply(this.onPressed, this.text, this.isCorrect);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width / 2,
        child: ElevatedButton(
          style: ButtonStyle(
              foregroundColor:
                  MaterialStateProperty.all(Colors.white),
              backgroundColor:
                  MaterialStateProperty.all(Color.fromRGBO(23, 40, 50, 20))),
          child: Text(text),
          onPressed: () => onPressed(this.isCorrect),
        ));
  }
}
