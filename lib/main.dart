import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:profitilaffaire/components/components.dart';
import 'package:profitilaffaire/services/LocationService.dart';
import 'package:geolocator/geolocator.dart';
import 'services/MarketService.dart';
import 'package:profitilaffaire/Models/Market.dart';
import 'package:http/http.dart' as http;
import 'package:profitilaffaire/Models/Customer.dart';

void main() {
  runApp(MyApp());
}

AvailableMarkets availableMarkets = AvailableMarkets();
List<Market> marketList = availableMarkets.getMarketList();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Completer<GoogleMapController> controller = Completer();
  int latitude = 10, b = 11;
  int index = 0;
  CameraPosition cameraPosition = CameraPosition(
    target: LatLng(
      1.0,
      20.0,
    ),
    zoom: 10,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          LocationSearchBar(),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FlatButton(
                    onPressed: () {
                      setState(() {
                        //mapView(widgetList);
                        index = 0;
                        print('done');
                      });
                    },
                    child: Text('Map')),
                FlatButton(
                    onPressed: () {
                      setState(() {
                        /*index = 1;
                        //listView(widgetList);
                        print('list done');*/
                        var res = fetchAlbum();
                        print(res);
                      });
                    },
                    child: Text('List')),
              ]),
          Expanded(
            child: IndexedStack(
              index: index,
              children: [
                GoogleMapWidget(
                  controller: controller,
                  cameraPosition: cameraPosition,
                ),
                ListView.builder(
                    itemCount: marketList.length,
                    itemBuilder: (context, _index) {
                      return MarketCard(
                        marketList: marketList,
                        index: _index,
                      );
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void mapView(List<Widget> widgetList) {
  final temp = widgetList[0];

  widgetList[0] = widgetList[1];
  widgetList[1] = temp;
}

Future<dynamic> fetchAlbum() async {
  var res = await http.get('http://192.168.1.22:8000/subscribers');
  var Jsonres = parsePhotos(res.body.toString());
  print(Jsonres);
  return Jsonres;
}

List<Customer> parsePhotos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Customer>((parsed) => Customer.fromJson(parsed)).toList();
}
