import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:perguntas_app/services/questionService.dart';
import 'package:perguntas_app/views/home.dart';
import 'package:perguntas_app/views/questionnaire.dart';
import 'package:perguntas_app/views/result.dart';

void main() {
  runApp(const _PerguntaApp());
}

class _PerguntaAppState extends State<_PerguntaApp> {
  
  int counter = 0;
  int totalScore = 0;
  bool startedGame = false;


  @override
  @protected
  @mustCallSuper
  void initState() {
    getQuestions();
    super.initState();
  }

  List<Map<String, List>> questionsReplies = [];

  getQuestions() async {
    questionsReplies = await QuestionService().run();
  }

  void startGame(){
    setState(() {
      startedGame = true;
    });
  }

   void resetApplication() {
    setState((){
      totalScore = 0;
      counter = 0; 
      startedGame = false;
      getQuestions();
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
    print(questionsReplies);
    return MaterialApp(
        title: 'Projeto Simulado ENADE',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Projeto Simulado ENADE'),
          ),
          body: Center(
          child: startedGame
              ? hasNextQuestion() ? Questionnaire(questionsReplies[counter], replyQuestion) : Result(totalScore, resetApplication)
              : Home(startGame)
          )
              
        ));
  }
}

class _PerguntaApp extends StatefulWidget {
  const _PerguntaApp({super.key});

  @override
  State<_PerguntaApp> createState() => _PerguntaAppState();
}
