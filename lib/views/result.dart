import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final void Function() _resetApplication;
  final int _points;
  const Result(this._points, this._resetApplication);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            const Text(
            'Parabens!',
            style: TextStyle(fontSize: 25),
          ),
          Text(
            'Sua pontuação final foi: $_points  Pontos',
            style: TextStyle(fontSize: 25),
          ),
          ElevatedButton(
            onPressed: _resetApplication,
            style: ButtonStyle(
                foregroundColor:
                    MaterialStateProperty.all(Colors.white),
                backgroundColor:
                    MaterialStateProperty.all(Color.fromRGBO(23, 40, 50, 20))), child: const Text('Reiniciar Questionario'))
      ],),
    );
  }
}
