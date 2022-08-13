// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:burger/cart.dart';
import 'package:burger/checkout.dart';
import 'package:burger/initialpage.dart';
import 'package:burger/loginpage.dart';
import 'package:burger/menuwithdescription.dart';
import 'package:burger/provider.dart';
import 'package:burger/signup.dart';
import 'package:burger/user_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyB3WLE_tP_kp1BJkQQodjQ20ic-52m3kPk",
      appId: "1:150468753785:android:cc5b43c65b5e16138d97a8",
      messagingSenderId: "150468753785",
      projectId: "burger-c6ce7",
    ),
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => Prov()),
      ChangeNotifierProvider(create: (_) => user_prov())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/initial',
      routes: {
        '/initial': (context) => initialpage(),
        '/login': (context) => login(),
        '/signup': (context) => signup(),
        '/menu': (context) => menu4(),
        '/checkout': (context) => checkout(),
        '/cart': (context) => cart(),
      },
    );
  }
}
