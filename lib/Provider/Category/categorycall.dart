import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project/Provider/Category/categorymodel.dart';

class FetchingCategory with ChangeNotifier {
  static var client = http.Client();

  static Future<Category> fetchdata() async {
    var categorymodel;

    final url = Uri.parse('https://remotive.io/api/remote-jobs/categories');
    var reponse = await client.get(url);
    if (reponse.statusCode == 200) {
      var jsonString = reponse.body;
      var data = jsonDecode(jsonString);

      var categorymodel = Category.fromJson(data);

      return categorymodel;
    }

    return categorymodel;
  }
}
