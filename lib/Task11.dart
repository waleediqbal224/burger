// // ignore_for_file: unused_import

// import 'package:appproject/cart.dart';
// import 'package:appproject/checkout.dart';
// import 'package:appproject/initialpage.dart';
// import 'package:appproject/loginpage.dart';
// import 'package:appproject/menuwithdescription.dart';
// import 'package:appproject/provider.dart';
// import 'package:appproject/signup.dart';
// import 'package:appproject/user_provider.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:provider/provider.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: FirebaseOptions(
//       apiKey: "AIzaSyB3WLE_tP_kp1BJkQQodjQ20ic-52m3kPk",
//       appId: "1:150468753785:android:cc5b43c65b5e16138d97a8",
//       messagingSenderId: "150468753785",
//       projectId: "burger-c6ce7",
//     ),
//   );
//   runApp(MultiProvider(
//     providers: [
//       ChangeNotifierProvider(create: (_) => Prov()),
//       ChangeNotifierProvider(create: (_) => user_prov())
//     ],
//     child: myapp(),
//   ));
// }

// class myapp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       initialRoute: '/home',
//       routes: {
//         '/home': (context) => Home(),
//         '/add': (context) => add(),
//         '/search': (context) => search(),
//         '/edit': (context) => edit(),
//       },
//     );
//   }
// }

// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Center(
//       child: ListView(
//         children: <Widget>[
//           SizedBox(
//             height: 80,
//           ),
//           ListTile(
//             title: Center(
//               child: SizedBox(
//                 height: 40,
//                 child: Text(
//                   "Welcome",
//                   style: TextStyle(
//                     fontSize: 29,
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Divider(),
//           Container(
//             padding: EdgeInsets.only(left: 50, right: 50, top: 10),
//             height: 60,
//             child: Material(
//               elevation: 5,
//               borderRadius: BorderRadius.circular(30),
//               color: Colors.red,
//               child: MaterialButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/add');
//                 },
//                 child: Text(
//                   "Add New User",
//                   style: TextStyle(
//                       fontSize: 15,
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),
//           ),
//           Divider(),
//           Container(
//             padding: EdgeInsets.only(left: 50, right: 50, top: 10),
//             height: 60,
//             child: Material(
//               elevation: 5,
//               borderRadius: BorderRadius.circular(30),
//               color: Colors.red,
//               child: MaterialButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/search');
//                 },
//                 child: Text(
//                   "Search A User ",
//                   style: TextStyle(
//                       fontSize: 15,
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     ));
//   }
// }

// class add extends StatefulWidget {
//   @override
//   State<add> createState() => _addState();
// }

// class _addState extends State<add> {
//   TextEditingController firstName = TextEditingController();
//   TextEditingController lastName = TextEditingController();
//   TextEditingController email = TextEditingController();
//   TextEditingController phone = TextEditingController();

//   int genderState = 0;
//   String gender = 'Not Specified';
//   bool check = false;

//   void setUser() async {
//     CollectionReference users = FirebaseFirestore.instance.collection("users");

//     //when adding in database with specifying document
//     await users.doc(email.text).set({
//       'name': firstName.text + ' ' + lastName.text,
//       'email': email.text,
//       'phone': phone.text,
//       'gender': gender,
//     }).then((value) => print('User added'));

//     Fluttertoast.showToast(msg: "User created successfully.");
//   }

//   final _signupkey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(''),
//           backgroundColor: Colors.red,
//         ),
//         body: Center(
//           child: Form(
//             key: _signupkey,
//             child: ListView(
//               padding: const EdgeInsets.only(top: 25),
//               children: <Widget>[
//                 ListTile(
//                     title: Center(
//                   child: SizedBox(
//                     height: 40,
//                     child: Text(
//                       "Add New User",
//                       style: TextStyle(
//                           fontSize: 35,
//                           color: Colors.black54,
//                           fontWeight: FontWeight.w600),
//                     ),
//                   ),
//                 )),
//                 Divider(),
//                 ListTile(
//                   title: TextFormField(
//                     textInputAction: TextInputAction.next,
//                     controller: firstName,
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(15)),
//                       labelText: 'First Name',
//                     ),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please Enter First Name!';
//                       }
//                       return null;
//                     },
//                   ),
//                 ),
//                 Divider(),
//                 ListTile(
//                   title: TextFormField(
//                     textInputAction: TextInputAction.next,
//                     controller: lastName,
//                     decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(15)),
//                         labelText: 'Last Name'),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please Enter Last Name!';
//                       }
//                       return null;
//                     },
//                   ),
//                 ),
//                 Divider(),
//                 ListTile(
//                   title: TextFormField(
//                       keyboardType: TextInputType.emailAddress,
//                       textInputAction: TextInputAction.next,
//                       controller: email,
//                       decoration: InputDecoration(
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(15)),
//                           labelText: 'Email'),
//                       validator: (value) {
//                         if (value == null ||
//                             value.isEmpty ||
//                             !(value.contains('@'))) {
//                           return 'Please Enter Valid Email!';
//                         }
//                       }),
//                 ),
//                 Divider(),
//                 ListTile(
//                   title: TextFormField(
//                     keyboardType: TextInputType.number,
//                     textInputAction: TextInputAction.done,
//                     controller: phone,
//                     decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(15)),
//                         labelText: 'Phone No.'),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Phone cannot be empty!';
//                       }
//                       return null;
//                     },
//                   ),
//                 ),
//                 Divider(),
//                 ListTile(
//                   title: Column(children: <Widget>[
//                     Text("Please select Gender:",
//                         style: TextStyle(
//                             fontSize: 15, fontWeight: FontWeight.bold)),
//                     Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//                       Text("Male"),
//                       Radio(
//                           value: 1,
//                           groupValue: genderState,
//                           onChanged: (val) {
//                             genderState = val as int;
//                             setState(() {
//                               check = true;
//                               if (val == 1) {
//                                 gender = "Male";
//                               }
//                             });
//                           }),
//                       SizedBox(width: 25),
//                       Text("Female"),
//                       Radio(
//                           value: 2,
//                           groupValue: genderState,
//                           onChanged: (val) {
//                             genderState = val as int;
//                             setState(() {
//                               check = false;
//                               if (val == 2) {
//                                 gender = "Female";
//                               }
//                             });
//                           }),
//                     ])
//                   ]),
//                 ),
//                 Divider(),
//                 Container(
//                   padding: EdgeInsets.only(left: 50, right: 50),
//                   height: 50,
//                   child: Material(
//                     elevation: 5,
//                     borderRadius: BorderRadius.circular(30),
//                     color: Colors.red,
//                     child: MaterialButton(
//                       onPressed: () async {
//                         if (_signupkey.currentState!.validate()) {
//                           setUser();
//                         }
//                       },
//                       child: Text(
//                         "Add User",
//                         style: TextStyle(
//                             fontSize: 15,
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ));
//   }
// }

// class UserModel {
//   String? dp;
//   String? email;
//   String? name;
//   String? phone;
//   String? gender;

//   UserModel({this.dp, this.email, this.name, this.phone, this.gender});

//   factory UserModel.fromMap(map) {
//     return UserModel(
//         dp: map['dpImage'],
//         email: map['email'],
//         name: map['name'],
//         phone: map['phone'],
//         gender: map['gender']);
//   }
// }

// class search extends StatefulWidget {
//   @override
//   State<search> createState() => _searchState();
// }

// class _searchState extends State<search> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   UserModel loggedInUser = UserModel();

//   Future<void> search(String mail) async {
//     setState(() {
//       FirebaseFirestore.instance
//           .collection("users")
//           .doc(mail)
//           .get()
//           .then((value) {
//         this.loggedInUser = UserModel.fromMap(value.data());
//       });
//     });
//   }

//   TextEditingController email = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.red,
//         ),
//         body: Center(
//           child: ListView(
//             padding: const EdgeInsets.only(top: 25),
//             children: <Widget>[
//               ListTile(
//                 title: Center(child: Text('Search Records with email')),
//               ),
//               ListTile(
//                 title: TextFormField(
//                     keyboardType: TextInputType.emailAddress,
//                     textInputAction: TextInputAction.next,
//                     controller: email,
//                     decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(15)),
//                         labelText: 'Email'),
//                     validator: (value) {
//                       if (value == null ||
//                           value.isEmpty ||
//                           !(value.contains('@'))) {
//                         return 'Please Enter Valid Email!';
//                       }
//                     }),
//               ),
//               Container(
//                 padding: EdgeInsets.only(left: 50, right: 50, top: 10),
//                 height: 60,
//                 child: Material(
//                   elevation: 5,
//                   borderRadius: BorderRadius.circular(30),
//                   color: Colors.red,
//                   child: MaterialButton(
//                     onPressed: () {
//                       search(email.text);
//                       showDialog(
//                         context: context,
//                         builder: (context) {
//                           return AlertDialog(
//                             // Retrieve the text the that user has entered by using the
//                             // TextEditingController.
//                             content: Center(
//                                 child: Column(
//                               children: [
//                                 ListTile(
//                                   title: Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Column(
//                                         children: [
//                                           Row(
//                                             children: [
//                                               Text(
//                                                 'Name: ',
//                                                 style: TextStyle(
//                                                     fontWeight:
//                                                         FontWeight.bold),
//                                               ),
//                                               Text("${loggedInUser.name}",
//                                                   style: TextStyle(
//                                                     color: Colors.black54,
//                                                     fontWeight: FontWeight.w500,
//                                                   )),
//                                             ],
//                                           ),
//                                           Divider(
//                                             height: 5,
//                                           ),
//                                           Row(
//                                             children: [
//                                               Text(
//                                                 'Email: ',
//                                                 style: TextStyle(
//                                                     fontWeight:
//                                                         FontWeight.bold),
//                                               ),
//                                               Text("${loggedInUser.email}",
//                                                   style: TextStyle(
//                                                     color: Colors.black54,
//                                                     fontWeight: FontWeight.w500,
//                                                   )),
//                                             ],
//                                           ),
//                                           Divider(
//                                             height: 5,
//                                           ),
//                                           Row(
//                                             children: [
//                                               Text(
//                                                 'Gender: ',
//                                                 style: TextStyle(
//                                                     fontWeight:
//                                                         FontWeight.bold),
//                                               ),
//                                               Text("${loggedInUser.gender}",
//                                                   style: TextStyle(
//                                                     color: Colors.black54,
//                                                     fontWeight: FontWeight.w500,
//                                                   )),
//                                             ],
//                                           ),
//                                           Divider(
//                                             height: 5,
//                                           ),
//                                           Row(
//                                             children: [
//                                               Text(
//                                                 'Phone: ',
//                                                 style: TextStyle(
//                                                     fontWeight:
//                                                         FontWeight.bold),
//                                               ),
//                                               Text("${loggedInUser.phone}",
//                                                   style: TextStyle(
//                                                     color: Colors.black54,
//                                                     fontWeight: FontWeight.w500,
//                                                   )),
//                                             ],
//                                           ),
//                                           Divider(
//                                             height: 10,
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceEvenly,
//                                   children: [
//                                     Material(
//                                       elevation: 5,
//                                       borderRadius: BorderRadius.circular(30),
//                                       color: Colors.red,
//                                       child: MaterialButton(
//                                         onPressed: () {
//                                           context
//                                               .read<prov>()
//                                               .SetEmail(email.text);
//                                           Navigator.pushNamed(context, '/edit');
//                                         },
//                                         child: Text(
//                                           "Edit User",
//                                           style: TextStyle(
//                                               fontSize: 15,
//                                               color: Colors.white,
//                                               fontWeight: FontWeight.bold),
//                                         ),
//                                       ),
//                                     ),
//                                     Material(
//                                       elevation: 5,
//                                       borderRadius: BorderRadius.circular(30),
//                                       color: Colors.red,
//                                       child: MaterialButton(
//                                         onPressed: () {
//                                           FirebaseFirestore.instance
//                                               .collection("users")
//                                               .doc(email.text)
//                                               .delete();
//                                           Fluttertoast.showToast(
//                                               msg:
//                                                   "User deleted successfully.");
//                                         },
//                                         child: Text(
//                                           "Delete User",
//                                           style: TextStyle(
//                                               fontSize: 15,
//                                               color: Colors.white,
//                                               fontWeight: FontWeight.bold),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             )),
//                           );
//                         },
//                       );
//                     },
//                     child: Text(
//                       "Search",
//                       style: TextStyle(
//                           fontSize: 15,
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ));
//   }
// }

// class edit extends StatefulWidget {
//   @override
//   State<edit> createState() => _editState();
// }

// class _editState extends State<edit> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   TextEditingController firstName = TextEditingController();
//   TextEditingController lastName = TextEditingController();
//   TextEditingController email = TextEditingController();
//   TextEditingController phone = TextEditingController();

//   int genderState = 0;
//   String gender = 'Not Specified';
//   bool check = false;

//   void UpdateUser() async {
//     CollectionReference users = FirebaseFirestore.instance.collection("users");
//     await users.doc(context.watch<prov>()._Email).update({
//       'name': firstName.text + ' ' + lastName.text,
//       'email': email.text,
//       'phone': phone.text,
//       'gender': gender,
//     }).then((value) => print('User added'));

//     Fluttertoast.showToast(msg: "Account has been created successfully.");
//   }

//   final _signupkey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(''),
//           backgroundColor: Colors.red,
//         ),
//         body: Center(
//           child: Form(
//             key: _signupkey,
//             child: ListView(
//               padding: const EdgeInsets.only(top: 25),
//               children: <Widget>[
//                 ListTile(
//                     title: Center(
//                   child: SizedBox(
//                     height: 40,
//                     child: Text(
//                       "Edit User",
//                       style: TextStyle(
//                           fontSize: 35,
//                           color: Colors.black54,
//                           fontWeight: FontWeight.w600),
//                     ),
//                   ),
//                 )),
//                 Divider(),
//                 ListTile(
//                   title: TextFormField(
//                     textInputAction: TextInputAction.next,
//                     controller: firstName,
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(15)),
//                       labelText: 'First Name',
//                     ),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please Enter First Name!';
//                       }
//                       return null;
//                     },
//                   ),
//                 ),
//                 Divider(),
//                 ListTile(
//                   title: TextFormField(
//                     textInputAction: TextInputAction.next,
//                     controller: lastName,
//                     decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(15)),
//                         labelText: 'Last Name'),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please Enter Last Name!';
//                       }
//                       return null;
//                     },
//                   ),
//                 ),
//                 Divider(),
//                 ListTile(
//                   title: TextFormField(
//                       keyboardType: TextInputType.emailAddress,
//                       textInputAction: TextInputAction.next,
//                       controller: email,
//                       decoration: InputDecoration(
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(15)),
//                           labelText: 'Email'),
//                       validator: (value) {
//                         if (value == null ||
//                             value.isEmpty ||
//                             !(value.contains('@'))) {
//                           return 'Please Enter Valid Email!';
//                         }
//                       }),
//                 ),
//                 Divider(),
//                 ListTile(
//                   title: TextFormField(
//                     keyboardType: TextInputType.number,
//                     textInputAction: TextInputAction.done,
//                     controller: phone,
//                     decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(15)),
//                         labelText: 'Phone No.'),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Phone cannot be empty!';
//                       }
//                       return null;
//                     },
//                   ),
//                 ),
//                 Divider(),
//                 ListTile(
//                   title: Column(children: <Widget>[
//                     Text("Please select Gender:",
//                         style: TextStyle(
//                             fontSize: 15, fontWeight: FontWeight.bold)),
//                     Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//                       Text("Male"),
//                       Radio(
//                           value: 1,
//                           groupValue: genderState,
//                           onChanged: (val) {
//                             genderState = val as int;
//                             setState(() {
//                               check = true;
//                               if (val == 1) {
//                                 gender = "Male";
//                               }
//                             });
//                           }),
//                       SizedBox(width: 25),
//                       Text("Female"),
//                       Radio(
//                           value: 2,
//                           groupValue: genderState,
//                           onChanged: (val) {
//                             genderState = val as int;
//                             setState(() {
//                               check = false;
//                               if (val == 2) {
//                                 gender = "Female";
//                               }
//                             });
//                           }),
//                     ])
//                   ]),
//                 ),
//                 Divider(),
//                 Container(
//                   padding: EdgeInsets.only(left: 50, right: 50),
//                   height: 50,
//                   child: Material(
//                     elevation: 5,
//                     borderRadius: BorderRadius.circular(30),
//                     color: Colors.red,
//                     child: MaterialButton(
//                       onPressed: () async {
//                         if (_signupkey.currentState!.validate()) {
//                           UpdateUser();
//                         }
//                       },
//                       child: Text(
//                         "Update",
//                         style: TextStyle(
//                             fontSize: 15,
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ));
//   }
// }
