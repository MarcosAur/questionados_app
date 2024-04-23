import 'dart:convert';

import 'package:http/http.dart';

class QuestionService {

  QuestionService();

  var client = Client();

  run() async {
    List<Map<String, List>> questionsReplies = [];
    try{
      var response = await client.get(Uri(scheme:'http', host:'192.168.1.76', port:8080, path:'/questions/find-all'),headers: {
      'Accept': 'application/json'
    });
      var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as List;

      decodedResponse.forEach((question) { 
        questionsReplies.add({
          'text' : [question['name']],
          'replies': question['replies']
        });
      });

      // print(questionsReplies);

      return questionsReplies;

    } catch (e){
      print('erro');
      print(e);
      return 'Erro na requisição';
    }
  }

}