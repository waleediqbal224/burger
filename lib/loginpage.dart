// ignore_for_file: camel_case_types, use_key_in_widget_constructors, annotate_overrides, prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, unused_field, unused_import, avoid_print

import 'package:burger/menuwithdescription.dart';
import 'package:burger/provider.dart';
import 'package:burger/signup.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';

class login extends StatefulWidget {
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final emailController = TextEditingController();
  final passController = TextEditingController();

  final _auth = FirebaseAuth.instance;
  String? errorMessage;

  void signin(String email, String password) async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
                Fluttertoast.showToast(msg: 'Signed In'),
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => menu4()))
              });
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case "invalid-email":
          errorMessage = "You have entered an invalid email.";
          break;
        case "wrong-password":
          errorMessage = "Your password is wrong.";
          break;
        case "user-not-found":
          errorMessage = "User with this email doesn't exist.";
          break;
        case "user-disabled":
          errorMessage = "User with this email has been disabled.";
          break;
        case "too-many-requests":
          errorMessage = "Too many requests";
          break;
        case "operation-not-allowed":
          errorMessage = "Signing in with Email and Password is not enabled.";
          break;
        default:
          errorMessage = "An undefined Error happened.";
      }
      Fluttertoast.showToast(msg: errorMessage!);
      print(error);
    }
  }

  final signinkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back_ios_sharp),
              ),
              backgroundColor: Colors.black,
              foregroundColor: Colors.orangeAccent,
              title: Text("BURGER JUNCTION"),
              centerTitle: true,
            ),
            body: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
                child: Form(
                  key: signinkey,
                  child: ListView(
                    padding: const EdgeInsets.only(top: 200),
                    children: <Widget>[
                      Container(
                        child: Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ListTile(
                        title: TextFormField(
                            controller: emailController,
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return 'email can\'t be empty';
                              }
                              if (!text.contains('@') ||
                                  !text.contains('gmail') ||
                                  !text.endsWith('.com')) {
                                return 'Enter a valid e-mail';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Enter your email")),
                      ),
                      ListTile(
                          title: TextFormField(
                              controller: passController,
                              obscureText: true,
                              validator: (text) {
                                if (text == null || text.isEmpty) {
                                  return 'can\'t be empty';
                                }

                                return null;
                              },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "Enter your password"))),
                      Container(
                        padding: EdgeInsets.only(right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Text("Forgot Password?"),
                            )
                          ],
                        ),
                      ),
                      ListTile(
                        title: Container(
                          padding:
                              EdgeInsets.only(left: 50, right: 50, top: 10),
                          height: 50,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              border: Border.all(
                                color: Colors.black,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: RaisedButton(
                              color: Colors.red[900],
                              onPressed: () {
                                if (signinkey.currentState!.validate()) {
                                  signin(emailController.text,
                                      passController.text);
                                }
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account? "),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => signup()),
                              );
                            },
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                  color: Colors.blueAccent,
                                  decoration: TextDecoration.underline),
                            ),
                          )
                        ],
                      ))
                    ],
                  ),
                ))));
  }
}
