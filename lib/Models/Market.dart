import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Product.dart';

class Market {
  int id;
  String name;
  String description;
  int rating;
  Location location;
  String image;
  List<Product> products;

  Market(
      {@required String name,
      Location location,
      String description,
      @required imageUrl}) {
    this.name = name;

    this.rating = 0;
    image = imageUrl;
    if (description != null) {
      description = 'Produits Alimentaire';
    }
    this.description = description;
  }
}

class Location {
  double latitude;
  double longitude;

  Location({double lat = 0, double long = 0}) {
    this.latitude = lat;
    this.longitude = long;
  }
}
