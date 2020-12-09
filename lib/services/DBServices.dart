import 'dart:convert';
import 'package:http/http.dart' as http;
import 'file:///C:/Users/ELMOHIT/AndroidStudioProjects/profitilaffaire/lib/Models/Market.dart';

class Services {
  static const ROOT = 'http://localhost/profiti/profiti_actions.php';
  static const _CREATE_TABLE_ACTION = 'CREATE_TABLE';
  static const _GET_ALL_ACTION = 'GET_ALL';
  static const _ADD_MARKET_ACTION = 'ADD_MARKET';

  static Future<String> createTable() async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _CREATE_TABLE_ACTION;
      final response = await http.post(ROOT, body: map);
      print('${response.body}');
      return response.body;
    } catch (e) {
      return "error";
    }
  }
}
