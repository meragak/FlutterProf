import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:profitilaffaire/Models/Market.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:profitilaffaire/Models/Product.dart';
import '../services/LocationService.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:geocoder/geocoder.dart';
import '../Screens/ProductList.dart';

Marker MarketMarker(Market market) {
  Marker marker = new Marker(
      markerId: MarkerId(market.name),
      position: LatLng(market.location.latitude, market.location.longitude),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueBlue,
      ));
  return marker;
}

class LocationSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 25),
        child: Row(
          children: [
            ButtonTheme(
              padding: EdgeInsets.symmetric(
                  vertical: 4.0,
                  horizontal: 8.0), //adds padding inside the button
              materialTapTargetSize: MaterialTapTargetSize
                  .shrinkWrap, //limits the touch area to the button area
              minWidth: 0, //wraps child's width
              height: 0, //wraps child's height
              child: FlatButton(
                onPressed: () {
                  getLocation();
                },
                child: Icon(Icons.near_me),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                height: 50,
                padding: EdgeInsets.all(5.0),
                child: TextField(
                  onTap: () {
                    /* Prediction p = await PlacesAutocomplete.show(
                        context: context,
                        apiKey: "AIzaSyCkjBzoYIPpp2vIe3bz6VB-DyvMyd6qmPw",
                        language: "fr",
                        components: [Component(Component.country, "fr")]);*/
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: FlatButton(
                onPressed: () {},
                child: Icon(
                  Icons.search,
                ),
              ),
            )
          ],
        ));
  }
}

class GoogleMapWidget extends StatelessWidget {
  const GoogleMapWidget({
    Key key,
    @required this.controller,
    this.cameraPosition,
  }) : super(key: key);

  final Completer<GoogleMapController> controller;
  final CameraPosition cameraPosition;

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: cameraPosition,
      onMapCreated: (GoogleMapController _controller) {
        controller.complete(_controller);
      },
    );
  }
}

class MarketCard extends StatelessWidget {
  const MarketCard(
      {Key key,
      @required this.marketList,
      @required this.index,
      @required int marketIndex})
      : super(key: key);
  final List<Market> marketList;
  final int index;
  @override
  Widget build(BuildContext context) {
    return FlatButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ProductList(marketList: marketList, marketIndex: index)),
          );
        },
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.network(
                  marketList[index].image,
                  width: 100,
                ),
                Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        marketList[index].name,
                        style: TextStyle(
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        'Rating',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ]),
                Text('6.5 Km')
              ],
            ),
          ),
        ));
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard(
      {Key key,
      @required this.productList,
      @required this.productIndex,
      @required this.marketIndex})
      : super(key: key);
  final List<Product> productList;
  final int productIndex;
  final int marketIndex;
  @override
  Widget build(BuildContext context) {
    return FlatButton(
        onPressed: () {},
        child: Padding(
          padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
          child: Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.network(
                  productList[productIndex].image,
                  width: 100,
                ),
                Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        productList[productIndex].name,
                        style: TextStyle(
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        '',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ]),
                Text('${productList[productIndex].price}')
              ],
            ),
          ),
        ));
  }
}
