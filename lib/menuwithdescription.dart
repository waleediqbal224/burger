// ignore_for_file: annotate_overrides, camel_case_types, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new, avoid_unnecessary_containers, sized_box_for_whitespace, curly_braces_in_flow_control_structures, implementation_imports, unused_field, prefer_final_fields, avoid_print, prefer_interpolation_to_compose_strings

import 'package:burger/cart.dart';
import 'package:burger/profile_drawer.dart';
import 'package:burger/provider.dart';
import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';

class menu4 extends StatefulWidget {
  State<menu4> createState() => _menuState();
}

class _menuState extends State<menu4> {
  int totalitems = 0;

  Color color1 = Colors.amber;
  IconData icon1 = Icons.shopping_cart;
  String text1 = "Add";
  Color color2 = Colors.amber;
  IconData icon2 = Icons.shopping_cart;
  String text2 = "Add";
  Color color3 = Colors.amber;
  IconData icon3 = Icons.shopping_cart;
  String text3 = "Add";
  Color color4 = Colors.amber;
  IconData icon4 = Icons.shopping_cart;
  String text4 = "Add";
  Color color5 = Colors.amber;
  IconData icon5 = Icons.shopping_cart;
  String text5 = "Add";
  Color color6 = Colors.amber;
  IconData icon6 = Icons.shopping_cart;
  String text6 = "Add";
  Color color7 = Colors.amber;
  IconData icon7 = Icons.shopping_cart;
  String text7 = "Add";
  Color color8 = Colors.amber;
  IconData icon8 = Icons.shopping_cart;
  String text8 = "Add";

  String firehouse = 'Fire House';
  int item1selected = 0;
  int item1quantity = 1;
  int price1 = 550;

  String zinger = 'Zinger';
  int item2selected = 0;
  int item2quantity = 1;
  int price2 = 400;

  String extreme = 'EXtreme';
  int item3selected = 0;
  int item3quantity = 1;
  int price3 = 650;

  String delicosta = 'Delicosta';
  int item4selected = 0;
  int item4quantity = 1;
  int price4 = 350;

  String bbqhunt = 'B.B.Q Hunt';
  int item5selected = 0;
  int item5quantity = 1;
  int price5 = 420;

  String tango = 'Tango';
  int item6selected = 0;
  int item6quantity = 1;
  int price6 = 750;

  String thunder = 'Thunder';
  int item7selected = 0;
  int item7quantity = 1;
  int price7 = 550;

  String firemac = 'Fire Mac';
  int item8selected = 0;
  int item8quantity = 1;
  int price8 = 250;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          drawer: draw(),
          appBar: AppBar(
            backgroundColor: Colors.black,
            foregroundColor: Colors.yellow[800],
            title: Text("MENU"),
            centerTitle: true,
            actions: <Widget>[
              Badge(
                position: BadgePosition.topStart(),
                badgeContent: Text('$totalitems'),
                child: Container(
                    padding: EdgeInsets.only(right: 10),
                    child: GestureDetector(
                      onTap: () {
                        {
                          totalitems = item1selected +
                              item2selected +
                              item3selected +
                              item4selected +
                              item5selected +
                              item6selected +
                              item7selected +
                              item8selected;
                          context.read<Prov>().settotalitems(totalitems);
                          if (totalitems > 0) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => cart()));
                          }
                          if (totalitems == 0) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: Text('Empty Cart'),
                                content: Text('Add items in cart'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'OK'),
                                    child: Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          }
                        }
                      },
                      child: Icon(
                        Icons.shopping_bag_outlined,
                        size: 35.0,
                      ),
                    )),
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
          body: Container(
            color: Colors.white,
            padding: EdgeInsets.all(10),
            child: Center(
              child: ListView(
                children: <Widget>[
                  CarouselSlider(
                    items: [
                      Container(
                        margin: EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: AssetImage('assets/images/burger6.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: AssetImage('assets/images/burger2.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: AssetImage('assets/images/burger3.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: AssetImage('assets/images/burger4.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                    options: CarouselOptions(
                      height: 200.0,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      viewportFraction: 0.8,
                    ),
                  ),
                  Card(
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Image.asset(
                                'assets/images/burger1.jpg',
                                height: 50,
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "Fire House",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      SizedBox(
                                        width: 22,
                                      ),
                                      Card(
                                        color: Colors.red[900],
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Container(
                                          width: 70,
                                          child: Center(
                                            child: Text(
                                              "Rs 550",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w800),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ]),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Container(
                                    width: 35,
                                    height: 25,
                                    child: FloatingActionButton(
                                      backgroundColor: Colors.yellow[800],
                                      child: Icon(Icons.remove),
                                      onPressed: () {
                                        setState(() {
                                          if (item1quantity > 1) {
                                            item1quantity--;
                                            context
                                                .read<Prov>()
                                                .setitem1quantity(
                                                    item1quantity);
                                          }
                                        });
                                      },
                                    ),
                                  ),
                                  Container(
                                    width: 35,
                                    height: 30,
                                    child: FloatingActionButton(
                                      backgroundColor: Colors.yellow[800],
                                      child: Text(
                                        context
                                            .watch<Prov>()
                                            .item1quantity
                                            .toString(),
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                  Container(
                                    width: 35,
                                    height: 25,
                                    child: FloatingActionButton(
                                      backgroundColor: Colors.yellow[800],
                                      child: Icon(Icons.add),
                                      onPressed: () {
                                        setState(() {
                                          item1quantity++;
                                          context
                                              .read<Prov>()
                                              .setitem1quantity(item1quantity);
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Divider(),
                              Row(
                                children: <Widget>[
                                  Container(
                                    height: 25,
                                    child: ElevatedButton.icon(
                                        style: ElevatedButton.styleFrom(
                                          primary: color1,
                                        ),
                                        onPressed: () {
                                          if (Provider.of<Prov>(context,
                                                      listen: false)
                                                  .item1quantity >
                                              0) {
                                            setState(() {
                                              color1 = Colors.lightBlueAccent;
                                              icon1 = Icons.check_sharp;
                                              text1 = 'Added';
                                            });
                                            context.read<Prov>().setitem1(
                                                firehouse,
                                                item1quantity,
                                                price1);

                                            item1selected = 1;
                                            totalitems = item1selected +
                                                item2selected +
                                                item3selected +
                                                item4selected +
                                                item5selected +
                                                item6selected +
                                                item7selected +
                                                item8selected;
                                            context
                                                .read<Prov>()
                                                .settotalitems(totalitems);
                                          }
                                        },
                                        // },
                                        icon: Icon(icon1),
                                        label: Text(text1)),
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(),
                  Card(
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Image.asset(
                                  'assets/images/burger2.jpg',
                                  height: 50,
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          "Zinger",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        SizedBox(
                                          width: 22,
                                        ),
                                        Card(
                                          color: Colors.red[900],
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Container(
                                            width: 70,
                                            child: Center(
                                              child: Text(
                                                "Rs 400",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w800),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ]),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: 35,
                                      height: 25,
                                      child: FloatingActionButton(
                                        backgroundColor: Colors.yellow[800],
                                        child: Icon(Icons.remove),
                                        onPressed: () {
                                          setState(() {
                                            if (item2quantity > 1) {
                                              item2quantity--;
                                              context
                                                  .read<Prov>()
                                                  .setitem2quantity(
                                                      item2quantity);
                                            }
                                          });
                                        },
                                      ),
                                    ),
                                    Container(
                                      width: 35,
                                      height: 30,
                                      child: FloatingActionButton(
                                        backgroundColor: Colors.yellow[800],
                                        child: Text(context
                                            .watch<Prov>()
                                            .item2quantity
                                            .toString()),
                                        onPressed: () {},
                                      ),
                                    ),
                                    Container(
                                      width: 35,
                                      height: 25,
                                      child: FloatingActionButton(
                                        backgroundColor: Colors.yellow[800],
                                        child: Icon(Icons.add),
                                        onPressed: () {
                                          setState(() {
                                            item2quantity++;
                                            context
                                                .read<Prov>()
                                                .setitem2quantity(
                                                    item2quantity);
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      height: 25,
                                      child: ElevatedButton.icon(
                                          style: ElevatedButton.styleFrom(
                                            primary: color2,
                                          ),
                                          onPressed: () {
                                            if (Provider.of<Prov>(context,
                                                        listen: false)
                                                    .item2quantity >
                                                0) {
                                              setState(() {
                                                color2 = Colors.lightBlueAccent;
                                                icon2 = Icons.check_sharp;
                                                text2 = 'Added';
                                              });
                                              context.read<Prov>().setitem2(
                                                  zinger,
                                                  item2quantity,
                                                  price2);
                                              item2selected = 1;
                                              totalitems = item1selected +
                                                  item2selected +
                                                  item3selected +
                                                  item4selected +
                                                  item5selected +
                                                  item6selected +
                                                  item7selected +
                                                  item8selected;
                                              context
                                                  .read<Prov>()
                                                  .settotalitems(totalitems);
                                            }
                                          },
                                          // },
                                          icon: Icon(icon2),
                                          label: Text(text2)),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Divider(),
                  Card(
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Image.asset(
                                  'assets/images/burger3.jpg',
                                  height: 50,
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          "EXtreme ",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        SizedBox(
                                          width: 22,
                                        ),
                                        Card(
                                          color: Colors.red[900],
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Container(
                                            width: 70,
                                            child: Center(
                                              child: Text(
                                                "Rs 650",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w800),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ]),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: 35,
                                      height: 25,
                                      child: FloatingActionButton(
                                        backgroundColor: Colors.yellow[800],
                                        child: Icon(Icons.remove),
                                        onPressed: () {
                                          setState(() {
                                            if (item3quantity > 1) {
                                              item3quantity--;
                                              context
                                                  .read<Prov>()
                                                  .setitem3quantity(
                                                      item3quantity);
                                            }
                                          });
                                        },
                                      ),
                                    ),
                                    Container(
                                      width: 35,
                                      height: 30,
                                      child: FloatingActionButton(
                                        backgroundColor: Colors.yellow[800],
                                        child: Text(context
                                            .watch<Prov>()
                                            .item3quantity
                                            .toString()),
                                        onPressed: () {},
                                      ),
                                    ),
                                    Container(
                                      width: 35,
                                      height: 25,
                                      child: FloatingActionButton(
                                        backgroundColor: Colors.yellow[800],
                                        child: Icon(Icons.add),
                                        onPressed: () {
                                          setState(() {
                                            item3quantity++;
                                            context
                                                .read<Prov>()
                                                .setitem3quantity(
                                                    item3quantity);
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      height: 25,
                                      child: ElevatedButton.icon(
                                          style: ElevatedButton.styleFrom(
                                            primary: color3,
                                          ),
                                          onPressed: () {
                                            if (Provider.of<Prov>(context,
                                                        listen: false)
                                                    .item3quantity >
                                                0) {
                                              setState(() {
                                                color3 = Colors.lightBlueAccent;
                                                icon3 = Icons.check_sharp;
                                                text3 = 'Added';
                                              });
                                              context.read<Prov>().setitem3(
                                                  extreme,
                                                  item3quantity,
                                                  price3);
                                              item3selected = 1;
                                              totalitems = item1selected +
                                                  item2selected +
                                                  item3selected +
                                                  item4selected +
                                                  item5selected +
                                                  item6selected +
                                                  item7selected +
                                                  item8selected;
                                              context
                                                  .read<Prov>()
                                                  .settotalitems(totalitems);
                                            }
                                          },
                                          // },
                                          icon: Icon(icon3),
                                          label: Text(text3)),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Divider(),
                  Card(
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Image.asset(
                                  'assets/images/burger4.jpg',
                                  height: 50,
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          "Delicosta",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        SizedBox(
                                          width: 22,
                                        ),
                                        Card(
                                          color: Colors.red[900],
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Container(
                                            width: 70,
                                            child: Center(
                                              child: Text(
                                                "Rs 350",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w800),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ]),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: 35,
                                      height: 25,
                                      child: FloatingActionButton(
                                        backgroundColor: Colors.yellow[800],
                                        child: Icon(Icons.remove),
                                        onPressed: () {
                                          setState(() {
                                            if (item4quantity > 1) {
                                              item4quantity--;
                                              context
                                                  .read<Prov>()
                                                  .setitem4quantity(
                                                      item4quantity);
                                            }
                                          });
                                        },
                                      ),
                                    ),
                                    Container(
                                      width: 35,
                                      height: 30,
                                      child: FloatingActionButton(
                                        backgroundColor: Colors.yellow[800],
                                        child: Text(context
                                            .watch<Prov>()
                                            .item4quantity
                                            .toString()),
                                        onPressed: () {},
                                      ),
                                    ),
                                    Container(
                                      width: 35,
                                      height: 25,
                                      child: FloatingActionButton(
                                        backgroundColor: Colors.yellow[800],
                                        child: Icon(Icons.add),
                                        onPressed: () {
                                          setState(() {
                                            item4quantity++;
                                            context
                                                .read<Prov>()
                                                .setitem4quantity(
                                                    item4quantity);
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      height: 25,
                                      child: ElevatedButton.icon(
                                          style: ElevatedButton.styleFrom(
                                            primary: color4,
                                          ),
                                          onPressed: () {
                                            if (Provider.of<Prov>(context,
                                                        listen: false)
                                                    .item4quantity >
                                                0) {
                                              setState(() {
                                                color4 = Colors.lightBlueAccent;
                                                icon4 = Icons.check_sharp;
                                                text4 = 'Added';
                                              });
                                              context.read<Prov>().setitem4(
                                                  delicosta,
                                                  item4quantity,
                                                  price4);
                                              item4selected = 1;
                                              totalitems = item1selected +
                                                  item2selected +
                                                  item3selected +
                                                  item4selected +
                                                  item5selected +
                                                  item6selected +
                                                  item7selected +
                                                  item8selected;
                                              context
                                                  .read<Prov>()
                                                  .settotalitems(totalitems);
                                            }
                                          },
                                          // },
                                          icon: Icon(icon4),
                                          label: Text(text4)),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Divider(),
                  Card(
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Image.asset(
                                  'assets/images/burger5.jpg',
                                  height: 50,
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          "B.B.Q Hunt",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        SizedBox(
                                          width: 22,
                                        ),
                                        Card(
                                          color: Colors.red[900],
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Container(
                                            width: 70,
                                            child: Center(
                                              child: Text(
                                                "Rs 420",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w800),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ]),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: 35,
                                      height: 25,
                                      child: FloatingActionButton(
                                        backgroundColor: Colors.yellow[800],
                                        child: Icon(Icons.remove),
                                        onPressed: () {
                                          setState(() {
                                            if (item5quantity > 1) {
                                              item5quantity--;
                                              context
                                                  .read<Prov>()
                                                  .setitem5quantity(
                                                      item5quantity);
                                            }
                                          });
                                        },
                                      ),
                                    ),
                                    Container(
                                      width: 35,
                                      height: 30,
                                      child: FloatingActionButton(
                                        backgroundColor: Colors.yellow[800],
                                        child: Text(context
                                            .watch<Prov>()
                                            .item5quantity
                                            .toString()),
                                        onPressed: () {},
                                      ),
                                    ),
                                    Container(
                                      width: 35,
                                      height: 25,
                                      child: FloatingActionButton(
                                        backgroundColor: Colors.yellow[800],
                                        child: Icon(Icons.add),
                                        onPressed: () {
                                          setState(() {
                                            item5quantity++;
                                            context
                                                .read<Prov>()
                                                .setitem5quantity(
                                                    item5quantity);
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      height: 25,
                                      child: ElevatedButton.icon(
                                          style: ElevatedButton.styleFrom(
                                            primary: color5,
                                          ),
                                          onPressed: () {
                                            if (Provider.of<Prov>(context,
                                                        listen: false)
                                                    .item5quantity >
                                                0) {
                                              setState(() {
                                                color5 = Colors.lightBlueAccent;
                                                icon5 = Icons.check_sharp;
                                                text5 = 'Added';
                                              });
                                              context.read<Prov>().setitem5(
                                                  bbqhunt,
                                                  item5quantity,
                                                  price5);
                                              item5selected = 1;
                                              totalitems = item1selected +
                                                  item2selected +
                                                  item3selected +
                                                  item4selected +
                                                  item5selected +
                                                  item6selected +
                                                  item7selected +
                                                  item8selected;
                                              context
                                                  .read<Prov>()
                                                  .settotalitems(totalitems);
                                            }
                                          },
                                          // },
                                          icon: Icon(icon5),
                                          label: Text(text5)),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Divider(),
                  Card(
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Image.asset(
                                  'assets/images/burger6.jpg',
                                  height: 50,
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          "Tango",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        SizedBox(
                                          width: 22,
                                        ),
                                        Card(
                                          color: Colors.red[900],
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Container(
                                            width: 70,
                                            child: Center(
                                              child: Text(
                                                "Rs 750",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w800),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ]),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: 35,
                                      height: 25,
                                      child: FloatingActionButton(
                                        backgroundColor: Colors.yellow[800],
                                        child: Icon(Icons.remove),
                                        onPressed: () {
                                          setState(() {
                                            if (item6quantity > 1) {
                                              item6quantity--;
                                              context
                                                  .read<Prov>()
                                                  .setitem6quantity(
                                                      item6quantity);
                                            }
                                          });
                                        },
                                      ),
                                    ),
                                    Container(
                                      width: 35,
                                      height: 30,
                                      child: FloatingActionButton(
                                        backgroundColor: Colors.yellow[800],
                                        child: Text(context
                                            .watch<Prov>()
                                            .item6quantity
                                            .toString()),
                                        onPressed: () {},
                                      ),
                                    ),
                                    Container(
                                      width: 35,
                                      height: 25,
                                      child: FloatingActionButton(
                                        backgroundColor: Colors.yellow[800],
                                        child: Icon(Icons.add),
                                        onPressed: () {
                                          setState(() {
                                            item6quantity++;
                                            context
                                                .read<Prov>()
                                                .setitem6quantity(
                                                    item6quantity);
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      height: 25,
                                      child: ElevatedButton.icon(
                                          style: ElevatedButton.styleFrom(
                                            primary: color6,
                                          ),
                                          onPressed: () {
                                            if (Provider.of<Prov>(context,
                                                        listen: false)
                                                    .item6quantity >
                                                0) {
                                              setState(() {
                                                color6 = Colors.lightBlueAccent;
                                                icon6 = Icons.check_sharp;
                                                text6 = 'Added';
                                              });
                                              context.read<Prov>().setitem6(
                                                  tango, item6quantity, price6);
                                              item6selected = 1;
                                              totalitems = item1selected +
                                                  item2selected +
                                                  item3selected +
                                                  item4selected +
                                                  item5selected +
                                                  item6selected +
                                                  item7selected +
                                                  item8selected;
                                              context
                                                  .read<Prov>()
                                                  .settotalitems(totalitems);
                                            }
                                          },
                                          // },
                                          icon: Icon(icon6),
                                          label: Text(text6)),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Divider(),
                  Card(
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Image.asset(
                                  'assets/images/burger7.jpg',
                                  height: 50,
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          "Thunder",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        SizedBox(
                                          width: 22,
                                        ),
                                        Card(
                                          color: Colors.red[900],
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Container(
                                            width: 70,
                                            child: Center(
                                              child: Text(
                                                "Rs 550",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w800),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ]),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: 35,
                                      height: 25,
                                      child: FloatingActionButton(
                                        backgroundColor: Colors.yellow[800],
                                        child: Icon(Icons.remove),
                                        onPressed: () {
                                          setState(() {
                                            if (item7quantity > 1) {
                                              item7quantity--;
                                              context
                                                  .read<Prov>()
                                                  .setitem7quantity(
                                                      item7quantity);
                                            }
                                          });
                                        },
                                      ),
                                    ),
                                    Container(
                                      width: 35,
                                      height: 30,
                                      child: FloatingActionButton(
                                        backgroundColor: Colors.yellow[800],
                                        child: Text(context
                                            .watch<Prov>()
                                            .item7quantity
                                            .toString()),
                                        onPressed: () {},
                                      ),
                                    ),
                                    Container(
                                      width: 35,
                                      height: 25,
                                      child: FloatingActionButton(
                                        backgroundColor: Colors.yellow[800],
                                        child: Icon(Icons.add),
                                        onPressed: () {
                                          setState(() {
                                            item7quantity++;
                                            context
                                                .read<Prov>()
                                                .setitem7quantity(
                                                    item7quantity);
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      height: 25,
                                      child: ElevatedButton.icon(
                                          style: ElevatedButton.styleFrom(
                                            primary: color7,
                                          ),
                                          onPressed: () {
                                            if (Provider.of<Prov>(context,
                                                        listen: false)
                                                    .item7quantity >
                                                0) {
                                              setState(() {
                                                color7 = Colors.lightBlueAccent;
                                                icon7 = Icons.check_sharp;
                                                text7 = 'Added';
                                              });
                                              context.read<Prov>().setitem7(
                                                  thunder,
                                                  item7quantity,
                                                  price7);
                                              item7selected = 1;
                                              totalitems = item1selected +
                                                  item2selected +
                                                  item3selected +
                                                  item4selected +
                                                  item5selected +
                                                  item6selected +
                                                  item7selected +
                                                  item8selected;
                                              context
                                                  .read<Prov>()
                                                  .settotalitems(totalitems);
                                            }
                                          },
                                          // },
                                          icon: Icon(icon7),
                                          label: Text(text7)),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Divider(),
                  Card(
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Image.asset(
                                  'assets/images/burger1.jpg',
                                  height: 50,
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          "Fire Mac",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        SizedBox(
                                          width: 22,
                                        ),
                                        Card(
                                          color: Colors.red[900],
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Container(
                                            width: 70,
                                            child: Center(
                                              child: Text(
                                                "Rs 250",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w800),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ]),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: 35,
                                      height: 25,
                                      child: FloatingActionButton(
                                        backgroundColor: Colors.yellow[800],
                                        child: Icon(Icons.remove),
                                        onPressed: () {
                                          setState(() {
                                            if (item8quantity > 1) {
                                              item8quantity--;
                                              context
                                                  .read<Prov>()
                                                  .setitem8quantity(
                                                      item8quantity);
                                            }
                                          });
                                        },
                                      ),
                                    ),
                                    Container(
                                      width: 35,
                                      height: 30,
                                      child: FloatingActionButton(
                                        backgroundColor: Colors.yellow[800],
                                        child: Text(context
                                            .watch<Prov>()
                                            .item8quantity
                                            .toString()),
                                        onPressed: () {},
                                      ),
                                    ),
                                    Container(
                                      width: 35,
                                      height: 25,
                                      child: FloatingActionButton(
                                        backgroundColor: Colors.yellow[800],
                                        child: Icon(Icons.add),
                                        onPressed: () {
                                          setState(() {
                                            item8quantity++;
                                            context
                                                .read<Prov>()
                                                .setitem8quantity(
                                                    item8quantity);
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      height: 25,
                                      child: ElevatedButton.icon(
                                          style: ElevatedButton.styleFrom(
                                            primary: color8,
                                          ),
                                          onPressed: () {
                                            if (Provider.of<Prov>(context,
                                                        listen: false)
                                                    .item8quantity >
                                                0) {
                                              setState(() {
                                                color8 = Colors.lightBlueAccent;
                                                icon8 = Icons.check_sharp;
                                                text8 = 'Added';
                                              });
                                              context.read<Prov>().setitem8(
                                                  firemac,
                                                  item8quantity,
                                                  price8);
                                              item8selected = 1;
                                              totalitems = item1selected +
                                                  item2selected +
                                                  item3selected +
                                                  item4selected +
                                                  item5selected +
                                                  item6selected +
                                                  item7selected +
                                                  item8selected;
                                              context
                                                  .read<Prov>()
                                                  .settotalitems(totalitems);
                                            }
                                          },
                                          // },
                                          icon: Icon(icon8),
                                          label: Text(text8)),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Divider(),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Container(
            padding: EdgeInsets.only(bottom: 15, right: 10, left: 10, top: 10),
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
                              "Go to Cart",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 17,
                                  color: Colors.black),
                            ),
                            onPressed: () {
                              totalitems = item1selected +
                                  item2selected +
                                  item3selected +
                                  item4selected +
                                  item5selected +
                                  item6selected +
                                  item7selected +
                                  item8selected;
                              context.read<Prov>().settotalitems(totalitems);
                              if (totalitems > 0) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => cart()));
                              }
                              if (totalitems == 0) {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    title: Text('Empty Cart'),
                                    content: Text('Add items in cart'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, 'OK'),
                                        child: Text('OK'),
                                      ),
                                    ],
                                  ),
                                );
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
          )),
    );
  }
}
