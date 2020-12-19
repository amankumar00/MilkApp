import 'package:flutter/material.dart';
import 'package:milk/Views/PayPage.dart';
import 'Views/CartPage.dart';
import 'Views/LoginPage.dart';
import 'Views/SignUpPage.dart';
import 'Views/HomePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Views/PayPage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MilkApp()));
}

class MilkApp extends StatelessWidget {
  // final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        CartPage.id: (context) => CartPage(),
        HomePage.id: (context) => HomePage(),
        LoginPage.id: (context) => LoginPage(),
        SignUpPage.id: (context) => SignUpPage(),
        PayPage.id: (context) => PayPage(),
      },
      initialRoute: '/',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Color(0xFF2766A9),
          textTheme: TextTheme(
            headline6: TextStyle(
              fontFamily: 'Langer',
              fontSize: 25,
            ),
          ),
        ),
      ),
    );
  }
}
