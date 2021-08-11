import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project/Provider/Jobs/jobsmodel.dart';

class FetchingJobs with ChangeNotifier {
  static var client = http.Client();

  static Future<JobElement> fetchdata() async {
    var jobmodel;

    final url =
        Uri.parse('https://remotive.io/api/remote-jobs?category=software-dev');
    var reponse = await client.get(url);
    if (reponse.statusCode == 200) {
      var jsonString = reponse.body;
      var data = jsonDecode(jsonString);

      var jobmodel = JobElement.fromJson(data);

      return jobmodel;
    }

    return jobmodel;
  }
}
