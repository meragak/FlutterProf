import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../Models/Market.dart';
import '../Models/Product.dart';

class AvailableMarkets {
  List<Market> availables = List<Market>();
  List<String> marketNames;
  AvailableMarkets() {
    //for (int i = 0; i < 3; i++) {
    Market market = Market(
      name: "Eddi",
      imageUrl:
          "https://lh3.googleusercontent.com/p/AF1QipN8run_-Ek2v0Z4Qp8HWRlZ82QjvcS_SgXLEqRc=s1600-w400",
    );
    AvailableProducts availableProducts = AvailableProducts();
    List<Product> products = availableProducts.availableProducts;
    market.products = products;
    availables.add(market);
  }
  List<Market> getMarketList() {
    return availables;
  }

  int getMarketNum() {
    return this.availables.length.toInt();
  }
}

class AvailableProducts {
  List<Product> availableProducts = List<Product>();

  AvailableProducts() {
    Product product = Product(name: "Savon", quantity: 4, price: 1.2);
    availableProducts.add(Product(
        name: "Savon",
        quantity: 4,
        price: 1.2,
        imageUrl:
            'https://www.theophile-berthon.com/wp-content/uploads/2016/10/Theophile-Berthon-savon-cuvbe-300g.jpg'));
    availableProducts.add(Product(
        name: "Tomate",
        quantity: 12,
        price: 0.99,
        imageUrl:
            "https://www.google.com/url?sa=i&url=https%3A%2F%2Fdrive.intermarche.com%2Fdrive-catalogue%2Fproduit%2F59745-mutti-tomates-pelees&psig=AOvVaw1He9jfj616D-qMrYdV1BxR&ust=1606047366410000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCMCpqOjOk-0CFQAAAAAdAAAAABAE"));
  }
}
