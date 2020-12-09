import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';

void getLocation() async {
  Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.low);
  print(position);
}
