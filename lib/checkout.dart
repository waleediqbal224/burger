// ignore_for_file: camel_case_types, use_key_in_widget_constructors, annotate_overrides, prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, avoid_web_libraries_in_flutter, unnecessary_string_interpolations, unnecessary_new, prefer_const_constructors_in_immutables, unused_field, avoid_print, sized_box_for_whitespace, unused_element, implementation_imports, non_constant_identifier_names

import 'package:burger/provider.dart';
import 'package:burger/user_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

import 'menuwithdescription.dart';

class checkout extends StatefulWidget {
  State<checkout> createState() => _checkoutState();
}

class _checkoutState extends State<checkout> {
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final contactController = TextEditingController();
  final instructions_controller = TextEditingController();

  CollectionReference order = FirebaseFirestore.instance.collection('Orders');

  Future<void> add_order() {
    return order
        .doc(nameController.text +
            "_" +
            DateTime.now().millisecondsSinceEpoch.toString())
        .set({
          'Name': nameController.text,
          'Contact': contactController.text,
          'Address': addressController.text,
          'Amount': Provider.of<Prov>(context, listen: false).amount.toString(),
          'items': Provider.of<user_prov>(context, listen: false)
              .item_list
              .toString(),
        })
        .then((value) => print("Order created"))
        .catchError((error) => print("Failed to create order: $error"));
  }

  final _checkoutformKey = GlobalKey<FormState>();

  int paymentstate = 2;
  bool check = false;
  Future<void> _showdialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Order Placed",
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
                    title: Text("Thank You."),
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.orangeAccent),
                      ),
                      onPressed: () {
                        context.read<Prov>().resetamount();
                        context.read<Prov>().setitem1quantity(1);
                        context.read<Prov>().setitem2quantity(1);
                        context.read<Prov>().setitem3quantity(1);
                        context.read<Prov>().setitem4quantity(1);
                        context.read<Prov>().setitem5quantity(1);
                        context.read<Prov>().setitem6quantity(1);
                        context.read<Prov>().setitem7quantity(1);
                        context.read<Prov>().setitem7quantity(1);
                        context.read<Prov>().emptylist();
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => menu4()));
                      },
                      child: Text('OK'))
                ],
              ),
            ),
          );
        });
  }

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
              foregroundColor: Colors.yellow[800],
              backgroundColor: Colors.black,
              title: Text("Checkout"),
              centerTitle: true,
            ),
            body: Container(
              color: Colors.blueGrey[50],
              padding: EdgeInsets.all(20),
              child: Form(
                key: _checkoutformKey,
                child: ListView(
                  children: <Widget>[
                    Container(
                      child: Center(
                        child: Text(
                          "Enter Delivery Details",
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
                          controller: nameController,
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'Name can\'t be empty';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(),
                              labelText: "Your name")),
                    ),
                    ListTile(
                      title: TextFormField(
                          maxLength: 11,
                          keyboardType: TextInputType.number,
                          controller: contactController,
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'Contact can\'t be empty';
                            }
                            if (text.length < 11 || text.length > 11) {
                              return 'Enter 11 digits number';
                            }

                            return null;
                          },
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(),
                              labelText: "Contact Number")),
                    ),
                    ListTile(
                      title: TextFormField(
                          controller: addressController,
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'Address can\'t be empty';
                            }
                            if (text.length < 6) {
                              return 'Enter a proper address';
                            }

                            return null;
                          },
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(),
                              labelText: "Address")),
                    ),
                    ListTile(
                      title: TextFormField(
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(),
                              labelText: "Any Instructions(Optional)")),
                    ),
                    Card(
                      child: Container(
                        child: Column(
                          children: [
                            ListTile(
                              leading: Icon(
                                Icons.account_balance_wallet_outlined,
                                color: Colors.orange,
                              ),
                              title: Text(
                                "Payment Method",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    Radio(
                                        value: 1,
                                        groupValue: paymentstate,
                                        onChanged: (v) {
                                          paymentstate = v as int;
                                          setState(() {
                                            check = false;
                                          });
                                        }),
                                    Text("Via Credit card"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Radio(
                                        value: 2,
                                        groupValue: paymentstate,
                                        onChanged: (v) {
                                          paymentstate = v as int;
                                          setState(() {
                                            check = true;
                                          });
                                        }),
                                    Text("Via Cash"),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      child: Container(
                        child: Column(
                          children: [
                            ListTile(
                              leading: Icon(
                                Icons.receipt_long_rounded,
                                color: Colors.orange,
                              ),
                              title: Text(
                                "Order Summary",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Column(
                              children: [
                                for (int i = 0;
                                    i < context.watch<Prov>().totalitems;
                                    i++)
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Center(
                                        child: Text(context
                                                .watch<user_prov>()
                                                .user_productlist[i]
                                                .itemquantity
                                                .toString() +
                                            "x "),
                                      ),
                                      Center(
                                        child: Text(context
                                                .watch<user_prov>()
                                                .user_productlist[i]
                                                .itemname
                                                .toString() +
                                            " "),
                                      ),
                                      Center(
                                        child: Text(
                                          context
                                              .watch<user_prov>()
                                              .user_productlist[i]
                                              .itemprice
                                              .toString(),
                                        ),
                                      ),
                                    ],
                                  ),
                                SizedBox(
                                  height: 5,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: Container(
              padding:
                  EdgeInsets.only(bottom: 15, right: 10, left: 10, top: 10),
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text.rich(
                          TextSpan(
                            text: "Total ",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w800,
                                color: Colors.white),
                            children: [
                              TextSpan(
                                text: "(incl. VAT)",
                                style: TextStyle(
                                    fontSize: 8,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "Rs." + context.watch<Prov>().amount.toString(),
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          child: SizedBox(
                            height: 40,
                            width: 340,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.yellow[800]),
                              child: Text(
                                "Place Order",
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 17,
                                    color: Colors.black),
                              ),
                              onPressed: () {
                                if (_checkoutformKey.currentState!.validate()) {
                                  add_order();
                                  _showdialog(context);
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )));
  }
}
