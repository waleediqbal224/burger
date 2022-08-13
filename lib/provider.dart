// ignore_for_file: prefer_final_fields, unused_field, camel_case_types, prefer_collection_literals, avoid_print, non_constant_identifier_names, unnecessary_this

import 'package:flutter/material.dart';

class products {
  String itemname;
  int itemquantity;
  int itemprice;
  products(
      {required this.itemname,
      required this.itemquantity,
      required this.itemprice});
}

class Prov with ChangeNotifier {
  var productlist = <products>[];

  int _amount = 0;
  int get amount => _amount;

  int _totalitems = 0;
  int get totalitems => _totalitems;

  int _item1quantity = 1;
  int get item1quantity => _item1quantity;
  int _item2quantity = 1;
  int get item2quantity => _item2quantity;
  int _item3quantity = 1;
  int get item3quantity => _item3quantity;
  int _item4quantity = 1;
  int get item4quantity => _item4quantity;
  int _item5quantity = 1;
  int get item5quantity => _item5quantity;
  int _item6quantity = 1;
  int get item6quantity => _item6quantity;
  int _item7quantity = 1;
  int get item7quantity => _item7quantity;
  int _item8quantity = 1;
  int get item8quantity => _item8quantity;

  void setitem1(String name, int quantity, int price) {
    productlist.add(
        products(itemname: name, itemquantity: quantity, itemprice: price));
    _amount = _amount + (quantity * price);

    notifyListeners();
  }

  void setitem1quantity(int quantity) {
    _item1quantity = quantity;
  }

  void setitem2(String name, int quantity, int price) {
    productlist.add(
        products(itemname: name, itemquantity: quantity, itemprice: price));
    _amount = _amount + (quantity * price);
    notifyListeners();
  }

  void setitem2quantity(int quantity) {
    _item2quantity = quantity;
  }

  void setitem3(String name, int quantity, int price) {
    productlist.add(
        products(itemname: name, itemquantity: quantity, itemprice: price));
    _amount = _amount + (quantity * price);
    notifyListeners();
  }

  void setitem3quantity(int quantity) {
    _item3quantity = quantity;
  }

  void setitem4(String name, int quantity, int price) {
    productlist.add(
        products(itemname: name, itemquantity: quantity, itemprice: price));
    _amount = _amount + (quantity * price);
    notifyListeners();
  }

  void setitem4quantity(int quantity) {
    _item4quantity = quantity;
  }

  void setitem5(String name, int quantity, int price) {
    productlist.add(
        products(itemname: name, itemquantity: quantity, itemprice: price));
    _amount = _amount + (quantity * price);
    notifyListeners();
  }

  void setitem5quantity(int quantity) {
    _item5quantity = quantity;
  }

  void setitem6(String name, int quantity, int price) {
    productlist.add(
        products(itemname: name, itemquantity: quantity, itemprice: price));
    _amount = _amount + (quantity * price);
    notifyListeners();
  }

  void setitem6quantity(int quantity) {
    _item6quantity = quantity;
  }

  void setitem7(String name, int quantity, int price) {
    productlist.add(
        products(itemname: name, itemquantity: quantity, itemprice: price));
    _amount = _amount + (quantity * price);
    notifyListeners();
  }

  void setitem7quantity(int quantity) {
    _item7quantity = quantity;
  }

  void setitem8(String name, int quantity, int price) {
    productlist.add(
        products(itemname: name, itemquantity: quantity, itemprice: price));
    _amount = _amount + (quantity * price);
    notifyListeners();
  }

  void setitem8quantity(int quantity) {
    _item8quantity = quantity;
  }

  void settotalitems(int totalitemsselected) {
    _totalitems = totalitemsselected;
  }

  void resetamount() {
    _amount = 0;
  }

  void emptylist() {
    print(productlist);
    productlist = [];
    print(productlist);
  }
}
