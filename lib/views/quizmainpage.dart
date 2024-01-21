import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp2_exercice01_provider/provider/quizprovider.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key, String? title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _provider = Provider.of<QuizProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          "Quiz",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.asset(_provider.quizzes[_provider.index].getImage()),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              height: 100,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                _provider.quizzes[_provider.index].getQuestion(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.purple, // Customize button color
                          elevation: 0, // Remove elevation
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10), // Round corners
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 30,
                          ),
                        ),
                        onPressed: () {
                          if (_provider.quizzes[_provider.index].answer == "True") {
                            ScaffoldMessenger.of(context).showSnackBar(_provider.correctAnswer());
                            _provider.nextQuiz();
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(_provider.wrongAnswer());
                          }
                        },
                        child: Text(
                          "True",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.purple, // Customize button color
                        elevation: 0, // Remove elevation
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // Round corners
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 30,
                        ),
                      ),
                      onPressed: () {
                        if (_provider.quizzes[_provider.index].answer == "False") {
                          ScaffoldMessenger.of(context).showSnackBar(_provider.correctAnswer());
                          _provider.nextQuiz();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(_provider.wrongAnswer());
                        }
                      },
                      child: Text(
                        "False",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.purple, // Customize button color
                          elevation: 0, // Remove elevation
                          shape: CircleBorder(), // Make it a circle
                          padding: EdgeInsets.all(15),
                        ),
                        onPressed: () {
                          _provider.nextQuiz();
                        },
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 32,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
