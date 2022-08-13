// ignore_for_file: camel_case_types, use_key_in_widget_constructors, annotate_overrides, prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, avoid_web_libraries_in_flutter, unnecessary_string_interpolations, unnecessary_new, prefer_const_constructors_in_immutables, unused_field, avoid_print, sized_box_for_whitespace, implementation_imports, unused_local_variable, non_constant_identifier_names

//import 'dart:html';

import 'package:burger/checkout.dart';
import 'package:burger/provider.dart';
import 'package:burger/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class cart extends StatefulWidget {
  State<cart> createState() => _cartState();
}

class _cartState extends State<cart> {
  String items = '';
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
              foregroundColor: Colors.yellow[800],
              title: Text("CART"),
              centerTitle: true,
            ),
            body: Container(
                padding: EdgeInsets.all(10),
                child: Center(
                    child: ListView.builder(
                        itemCount: context.watch<Prov>().totalitems,
                        itemBuilder: (context, index) {
                          var item = context.watch<Prov>().productlist[index];

                          //for saving data into userproductlist

                          context.read<user_prov>().user_productlist.add(
                              user_products(
                                  itemname: item.itemname,
                                  itemquantity: item.itemquantity,
                                  itemprice: item.itemprice));
                          items = item.itemquantity.toString() +
                              "x " +
                              item.itemname.toString() +
                              " (Rs" +
                              item.itemprice.toString() +
                              "/item)";
                          context.read<user_prov>().item_list.add(items);
                          //end
                          return Card(
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2),
                              ),
                              child: Container(
                                  color: Colors.grey[300],
                                  child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Column(
                                            children: [
                                              Row(
                                                children: <Widget>[
                                                  Container(
                                                    width: 35,
                                                    height: 30,
                                                    child: FloatingActionButton(
                                                      foregroundColor:
                                                          Colors.black,
                                                      backgroundColor:
                                                          Colors.yellow[800],
                                                      child: Text(item
                                                          .itemquantity
                                                          .toString()),
                                                      onPressed: () {},
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                item.itemname,
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w800),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Text(item.itemprice.toString(),
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w800))
                                            ],
                                          )
                                        ],
                                      ))));
                        }))),
            bottomNavigationBar: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(),
              ),
              child: SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text.rich(
                          TextSpan(
                            text: "Total:\n",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w800),
                            children: [
                              TextSpan(
                                text: context.watch<Prov>().amount.toString(),
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          child: RaisedButton(
                            color: Colors.yellow[800],
                            child: Text(
                              "Proceed to Check Out",
                              style: TextStyle(fontSize: 17),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => checkout()));
                            },
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
