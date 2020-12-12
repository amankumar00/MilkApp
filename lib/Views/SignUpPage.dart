import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  static String id = '/';
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
      ),
      body: Container(),
    );
  }
}
