// ignore_for_file: prefer_final_fields, unused_field, camel_case_types, prefer_collection_literals, avoid_print, non_constant_identifier_names, unnecessary_this

import 'package:flutter/material.dart';

class user_products {
  String itemname;
  int itemquantity;
  int itemprice;
  user_products(
      {required this.itemname,
      required this.itemquantity,
      required this.itemprice});
}

class user_prov with ChangeNotifier {
  var user_productlist = <user_products>[];
  var item_list = [];
}
