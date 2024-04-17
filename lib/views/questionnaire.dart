import 'package:flutter/material.dart';
import 'package:perguntas_app/components/question.dart';
import 'package:perguntas_app/components/reply.dart';

class Questionnaire extends StatelessWidget {
   
  final Map<String, List> questionsReplies;
  final void Function(bool) _replyQuestion;


  Questionnaire(this.questionsReplies, this._replyQuestion);


  List<Widget> generateWidgets() {
    List<Widget> widgetsList = [];

    for (var question in questionsReplies.entries) {
      if (question.key == 'text') {
        widgetsList.add(Question(question.value[0].toString()));
      } else {
        for (var reply in question.value) {

          widgetsList.add(Reply(_replyQuestion, reply[0].toString(), reply[1]));

          // if (reply[1]){
          //   widgetsList.add(Reply(_replyQuestion, reply[0].toString()));
          // }else{
          //   widgetsList.add(Reply(_replyQuestionIncorrect, reply[0].toString()));
          // }

          
        }
      }
    }

    return widgetsList;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: generateWidgets(),
    );
  }
}