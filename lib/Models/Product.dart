import 'package:flutter/material.dart';

class Product {
  int id;
  String name;
  int quantity;
  double price;
  int serialNumber;
  String image;
  Product(
      {@required String name,
      int quantity,
      @required double price,
      String imageUrl}) {
    this.name = name;
    this.quantity = quantity;
    this.price = price;
    this.serialNumber = 0;
    this.image = imageUrl;
  }
}
