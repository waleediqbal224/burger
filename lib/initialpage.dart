// ignore_for_file: camel_case_types, prefer_const_constructors, use_key_in_widget_constructors, annotate_overrides, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:burger/loginpage.dart';
import 'package:burger/signup.dart';
import 'package:flutter/material.dart';
import 'menuwithdescription.dart';

class initialpage extends StatefulWidget {
  State<initialpage> createState() => _initialpageState();
}

class _initialpageState extends State<initialpage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          color: Colors.white,
          child: ListView(
            padding: const EdgeInsets.only(top: 5),
            children: [
              Container(
                child: Image.asset(
                  'assets/logo/logo3.png',
                  height: 450,
                ),
              ),
              ListTile(
                  title: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  border: Border.all(
                    color: Colors.red.shade900,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => signup()),
                    );
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.red[900]),
                  ),
                ),
              )),
              ListTile(
                  title: Container(
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.red.shade900,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red[900]),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => login()),
                    );
                  },
                  child: Text("Login"),
                ),
              )),
              SizedBox(
                height: 10,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => menu4()));
                  },
                  child: Text(
                    "Continue as Guest",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
