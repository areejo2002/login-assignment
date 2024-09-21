import 'package:flutter/material.dart';
import 'signup.dart';
import 'profilepage.dart';
  import 'login.dart';
void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Title',
      home: login(), // or the initial page you want to show
    );
  }
}

