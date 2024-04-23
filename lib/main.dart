import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
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
  var client = Client();

  @override
  @protected
  @mustCallSuper
  void initState() {
    getQuestions();
    super.initState();
  }

  final List<Map<String, List>> questionsReplies = [];

  getQuestions() async {
    try{
      var response = await client.get(Uri(scheme:'http', host:'192.168.1.76', port:8080, path:'/questions/find-all'),headers: {
      'Accept': 'application/json'
    });
      var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as List;

      questionsReplies.clear();

      decodedResponse.forEach((question) { 
        questionsReplies.add({
          'text' : [question['name']],
          'replies': question['replies']
        });
      });

    } catch (e){
      print('Erro na requisição');
      print(e);
    }
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
