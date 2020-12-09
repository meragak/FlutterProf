import 'package:flutter/material.dart';
import 'package:profitilaffaire/Models/Market.dart';
import 'package:profitilaffaire/Models/Product.dart';
import 'package:profitilaffaire/components/components.dart';

class ProductList extends StatelessWidget {
  const ProductList({
    Key key,
    @required this.marketList,
    @required this.marketIndex,
  }) : super(key: key);
  final List<Market> marketList;

  final int marketIndex;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: ListView.builder(
          itemCount: marketList[marketIndex].products.length,
          itemBuilder: (context, _index) {
            return ProductCard(
              productList: marketList[marketIndex].products,
              marketIndex: marketIndex,
              productIndex: _index,
            );
          }),
    ));
  }
}
