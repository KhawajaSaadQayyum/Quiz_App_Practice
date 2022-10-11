import 'package:flutter/material.dart';
import 'quiz_brain.dart';
void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return (MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black26,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Welcome"),
        ),
        body: SafeArea(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: QuizPage()),
        ),
      ),
    ));
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}


class _QuizPageState extends State<QuizPage> {
  List <Widget> scoreKeeper= [];
 QuizBrain quizBrain= QuizBrain();
  int questionNumber=0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [

        Expanded(

          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Center(

              child: Text(
                QuizBrain().questionBank[questionNumber].questionText,
                  style: TextStyle(
                     color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
              ),
            ),

          ),
        ),
        Expanded(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                child: Text(
                  "True",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: ()
                {

                  setState(() {

                    bool correctAnswer= QuizBrain().questionBank[questionNumber].questionAnswer;
                    if(correctAnswer==true) {
                      scoreKeeper.add(Icon(Icons.check,
                        color: Colors.green,
                      ),
                      );
                    }
                    else{
                      scoreKeeper.add(Icon(Icons.close,
                        color: Colors.red,
                      ),
                      );
                    }
                  },
                  );
                  questionNumber +=1;

                },
              ),
            ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: Text(
                "False",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: ()
              {

                setState(() {
                  bool correctAnswer= QuizBrain().questionBank[questionNumber].questionAnswer;
                  if(correctAnswer==false) {
                    scoreKeeper.add(Icon(Icons.check,
                      color: Colors.green,
                    ),
                    );
                  }
                  else{
                    scoreKeeper.add(Icon(Icons.close,
                      color: Colors.red,
                    ),
                    );
                  }
                },
                );
                questionNumber +=1;
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
          ),

      ],

    );
  }
}
