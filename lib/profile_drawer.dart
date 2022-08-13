// ignore_for_file: use_key_in_widget_constructors, annotate_overrides, camel_case_types, prefer_const_constructors, avoid_print

import 'dart:ui';

import 'package:burger/loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class draw extends StatefulWidget {
  State<draw> createState() => _drawState();
}

class _drawState extends State<draw> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.black,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                '',
                style: TextStyle(color: Color(0xff393E46), fontSize: 25),
              ),
              decoration: BoxDecoration(
                  color: Colors.green,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/logo/logo3.png'))),
            ),
            ListTile(
              leading: Icon(
                Icons.input,
                color: Colors.yellow[800],
              ),
              title: Text(
                'Sign In',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () async {
                var currentUser = FirebaseAuth.instance.currentUser;

                if (currentUser == null) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => login()));
                } else {
                  Fluttertoast.showToast(msg: "Already signed in.");
                }
              },
            ),
            ListTile(
              leading: Icon(
                Icons.verified_user,
                color: Colors.yellow[800],
              ),
              title: Text('Profile', style: TextStyle(color: Colors.white)),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.yellow[800],
              ),
              title: Text('Settings', style: TextStyle(color: Colors.white)),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: Icon(
                Icons.border_color,
                color: Colors.yellow[800],
              ),
              title: Text('Feedback', style: TextStyle(color: Colors.white)),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
                leading: Icon(
                  Icons.exit_to_app,
                  color: Colors.yellow[800],
                ),
                title: Text('Logout', style: TextStyle(color: Colors.white)),
                onTap: () async {
                  var currentUser = FirebaseAuth.instance.currentUser;

                  if (currentUser != null) {
                    await FirebaseAuth.instance.signOut();
                    Fluttertoast.showToast(msg: "User signed out!");
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => login()));
                  } else {
                    Fluttertoast.showToast(msg: "Already signed out.");
                  }
                }),
          ],
        ),
      ),
    );
  }
}
