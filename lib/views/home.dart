import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final void Function() startGame;

  Home(this.startGame);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network('https://portal.estacio.br/media/4252/logo-estacio.png'),
          const Text(
            'Simualdo Estácio ENADE',
            style: TextStyle(fontSize: 25),
          ),
          ElevatedButton(
            onPressed: startGame,
            style: ButtonStyle(
                foregroundColor:
                    MaterialStateProperty.all(Colors.white),
                backgroundColor:
                    MaterialStateProperty.all(Color.fromRGBO(23, 40, 50, 20))), child: const Text('Iniciar Questionario'))
        ],
      ),
    );
  }
}