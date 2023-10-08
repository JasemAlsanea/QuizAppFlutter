import 'package:flutter/material.dart';
import 'package:sample/pages/questions.dart';
import 'package:sample/pages/results.dart';
import 'package:sample/pages/signin.dart';
import 'package:sample/pages/signup.dart';
import 'package:sample/pages/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      initialRoute: '/',
      routes: {
    // When navigating to the "/" route, build the FirstScreen widget.
    '/': (context) => const Welcome(),
    '/Signup': (context) => const Signup(),
    '/Signin': (context) => const Signin(),
    '/Questions': (context) => const Questions(),
    '/Results': (context) => const Results(),
  },
    );
  }
}



