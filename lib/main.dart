import 'package:flutter/material.dart';
import 'Views/CartPage.dart';
import 'Views/DeliveryTrackingPage.dart';
import 'Views/LoginPage.dart';
import 'Views/SubscriptionPage.dart';
import 'Views/SignUpPage.dart';
import 'Views/HomePage.dart';
import 'package:firebase_core/firebase_core.dart';


void main(){
  WidgetsFlutterBinding.ensureInitialized(); Firebase.initializeApp();
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MilkApp()));
}

class MilkApp extends StatelessWidget {
 // final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        CartPage.id: (context) => CartPage(),
        DeliveryTrackingPage.id: (context) => DeliveryTrackingPage(),
        HomePage.id: (context) => HomePage(),
        LoginPage.id: (context) => LoginPage(),
        SignUpPage.id: (context) => SignUpPage(),
        SubscriptionPage.id: (context) => SubscriptionPage(),
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
