import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './quiz.dart';
import './result.dart';

// void main(){
// runApp(MyApp());
// }
void main() => runApp(MyApp());
class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
   final questions= const[
         {'questionText': 'What\'s your favorite color?',
         'answers':[
           {'text':'Black', 'score':10} ,
          {'text':'Red', 'score':5},
          {'text':'Green','score':3},
          {'text':'White','score':1},
          ],
        },

         {
           'questionText': 'What\'s your favorite animal?',
           'answers':[
            
             
          {'text':'Rabbit', 'score':3},
          {'text':'Snake','score':11},
          {'text':'Elephant ','score':5},
           {'text':'Lion', 'score':9} ,
          ],
        },
         {
            'questionText': 'Who\'s your favorite?',
           'answers':[
              {'text':'Anushruti', 'score':1} ,
          {'text':'Anushruti', 'score':1},
          {'text':'Anushruti','score':1},
          {'text':'Anushruti','score':1},
           ],
        },
       
       ];
 
 
    var questionIndex = 0;
    var totalScore = 0;
    void resetQuiz(){
     setState(() {
        questionIndex =0;
      totalScore = 0;
    }
     );
    }
    void answerQuestion(int score){

      totalScore += score;

      setState((){
        questionIndex= questionIndex+1;
      });
      print(questionIndex);
      
      
    }
    @override
    Widget build(BuildContext context){
      
  // questions=[]; //doesn't work if questions is a const

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
      ),
      body: questionIndex < questions.length ? Quiz(answerQuestion: answerQuestion,
       questionIndex: questionIndex,
        questions: questions): Result(totalScore,resetQuiz)
    ));
  }
}
