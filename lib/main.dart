import 'package:flutter/material.dart';
import 'package:perguntas_app/views/questionnaire.dart';
import 'package:perguntas_app/views/result.dart';

void main() {
  runApp(const _PerguntaApp());
}

class _PerguntaAppState extends State<_PerguntaApp> {
  
  int counter = 0;
  int totalScore = 0;

  final List<Map<String, List>> questionsReplies = [
    {
      'text': ['Qual sua cor favorita?'],
      'replies': [
        ['Azul', true], 
        ['Amarelo', false], 
        ['Verde', false]
      ]
    },
    {
      'text': ['Qual sua comida favorita?'],
      'replies': [
        ['Lasanha', false],
        ['Hamburguer', true],
        ['Cuscuz', false],
        ]
    },
    {
      'text': ['Qual sue filme favorito?'],
      'replies': [
        ['Ironman', true],
        ['Capitão América', false],
        ['Para todos os garotos que já amei', false],
      ]
    },
  ];

  void resetApplication(){
    setState(() {
      totalScore = 0;
      counter = 0; 
    });
  }

  void replyQuestion(bool isCorrect) {
    setState(() {

      if (isCorrect){
        totalScore += 1;
      }
      
      counter += 1;
    });
  }
 
  bool hasNextQuestion() {
    return counter < questionsReplies.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Perguntados',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Aplicativo de Perguntas'),
          ),
          body: hasNextQuestion()
              ? Questionnaire(questionsReplies[counter], replyQuestion)
              : Result(totalScore, resetApplication),
        ));
  }
}

class _PerguntaApp extends StatefulWidget {
  const _PerguntaApp({super.key});

  @override
  State<_PerguntaApp> createState() => _PerguntaAppState();
}
