// ignore_for_file: annotate_overrides, use_key_in_widget_constructors, camel_case_types, prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, unused_field, prefer_final_fields, unused_element, unnecessary_this, avoid_print, non_constant_identifier_names, unused_local_variable, unused_import

//import 'dart:html';

import 'dart:io';
import 'package:path/path.dart' as path;

import 'package:burger/loginpage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class signup extends StatefulWidget {
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  File? imageFile;

  var name = "";
  var email = "";
  var password = "";

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();
  bool _validate = false;

  final _auth = FirebaseAuth.instance;
  String? errorMessage;

  CollectionReference user = FirebaseFirestore.instance.collection('users');

  Future<void> add_user() {
    return user
        .doc(nameController.text +
            DateTime.now().millisecondsSinceEpoch.toString())
        .set({
          'Name': nameController.text,
          'Email': emailController.text,
          'Password': passController.text
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  void setNewUser() {
    Fluttertoast.showToast(msg: "User created Successfully! Login now.");

    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => login()));
  }

  void signupfunc(String email, String password) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
                setNewUser(),
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

  final _signupformKey = GlobalKey<FormState>();

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
              color: Colors.white,
              child: Form(
                key: _signupformKey,
                child: ListView(
                  children: <Widget>[
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      child: Center(
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        _uploadPic(context);
                      },
                      child: CircleAvatar(
                        child: (imageFile == null)
                            ? Icon(
                                Icons.person_outline_outlined,
                                color: Colors.orangeAccent,
                                size: 50,
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.file(imageFile!,
                                    width: 100, height: 100, fit: BoxFit.fill),
                              ),
                        radius: 52.0,
                        backgroundColor: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ListTile(
                      title: TextFormField(
                          controller: nameController,
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'Name can\'t be empty';
                            }
                            if (text.length < 4) {
                              return 'Too short';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Enter your name")),
                    ),
                    ListTile(
                      title: TextFormField(
                          controller: emailController,
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'Email can\'t be empty';
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
                              return 'Can\'t be empty';
                            }
                            if (text.length < 5) {
                              return 'Minimum 5 characters';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Enter your password")),
                    ),
                    ListTile(
                      title: TextFormField(
                          controller: confirmPassController,
                          obscureText: true,
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'Enter password';
                            }
                            if (passController.text != text) {
                              return 'Password does\'n match';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Confirm password")),
                    ),
                    ListTile(
                      title: Container(
                        padding: EdgeInsets.only(left: 50, right: 50, top: 10),
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
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.red[900]),
                            ),
                            onPressed: () async {
                              if (_signupformKey.currentState!.validate()) {
                                signupfunc(
                                    emailController.text, passController.text);
                                add_user();

                                String storefile =
                                    DateTime.now().minute.toString() +
                                        DateTime.now().second.toString() +
                                        '-' +
                                        path.basename(imageFile!.path);

                                firebase_storage.Reference firebaseStorageRef =
                                    firebase_storage.FirebaseStorage.instance
                                        .ref()
                                        .child(storefile);
                                firebase_storage.UploadTask uploadTask =
                                    firebaseStorageRef.putFile(imageFile!);
                              }
                            },
                            child: Text("Register"),
                          ),
                        ),
                      ),
                    ),
                    Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account? "),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => login()),
                            );
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.blueAccent,
                                decoration: TextDecoration.underline),
                          ),
                        )
                      ],
                    ))
                  ],
                ),
              )),
        ));
  }

  Future<void> _uploadPic(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Select Source",
              style: TextStyle(color: Colors.orangeAccent),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Divider(
                    height: 1,
                    color: Colors.orangeAccent,
                  ),
                  ListTile(
                    onTap: () {
                      _openGallery(context);
                    },
                    title: Text("Gallery"),
                    leading: Icon(
                      Icons.account_box,
                      color: Colors.orangeAccent,
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: Colors.orangeAccent,
                  ),
                  ListTile(
                    onTap: () {
                      _openCamera(context);
                    },
                    title: Text("Camera"),
                    leading: Icon(
                      Icons.camera,
                      color: Colors.orangeAccent,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void _openGallery(BuildContext context) async {
    final path = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (path == null) return;
    setState(() {
      final img = File(path.path);
      this.imageFile = img;
    });

    Navigator.pop(context);
  }

  void _openCamera(BuildContext context) async {
    final path = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 60);
    if (path == null) return;
    setState(() {
      final img = File(path.path);
      this.imageFile = img;
    });
    Navigator.pop(context);
  }
}
