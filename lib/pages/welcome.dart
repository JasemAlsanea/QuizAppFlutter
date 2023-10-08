// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class  Welcome extends StatelessWidget {
  const Welcome ({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Welcom to QuizeTime"),
      ),
        body: Column(
          children: [
            Text("data2"),
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, '/Signin');
            }, child: Text("login")),
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, '/Signup');
            }, child: Text("Sign up")),
              ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, '/Questions');
            }, child: Text("Questions")),
              ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, '/Results');
            }, child: Text("Results")),
          ],
        )
    );
  }
}