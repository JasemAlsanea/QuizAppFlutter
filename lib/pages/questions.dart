import 'dart:convert';
import 'package:flutter/material.dart';

class Questions extends StatelessWidget {
  const Questions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Questions"),
      ),
      body: QuestionsForm(),
    );
  }
}

class QuestionsForm extends StatefulWidget {
  // Changed to StatefulWidget
  const QuestionsForm({Key? key})
      : super(key: key); // Added 'Key? key' to constructor

  @override
  _QuestionsFormState createState() => _QuestionsFormState();
}

class _QuestionsFormState extends State<QuestionsForm> {
  // New state class
  bool _obscureText = true; // Added to manage password visibility

  // Questions vars
  String _Question = "";
  String answer1 = 'Berlin';
  String answer2 = 'Paris';
  String answer_Correct = 'Berlin';
  String message = '';
  void _showAnswer(String answer) {
    // Display the SnackBar
    String choices = answer;
    if (choices == answer_Correct) {
      message = 'You selected: $choices';
    }else{
      message = 'You not correct';
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            child: Text(
          "Question 1: What is the capital of France?",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        )),
        SizedBox(height: 50),
        _answerButton(answer1),
        SizedBox(height: 5),
        _answerButton(answer2),
      ],
    );
  }

  Widget _answerButton(String answer) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10.0),
      child: TextButton(
        onPressed: () =>
            _showAnswer(answer), // Pass the variable to the function
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.teal,
          padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          elevation: 5.0,
          shadowColor: Colors.teal.withOpacity(0.5),
        ),
        child: Text(
          answer, // Use the variable as the button label
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
