import 'dart:convert';

import 'package:covid_tracker/models/WorldStatsModel.dart';
import 'package:covid_tracker/services/utilities/app_url.dart';
import 'package:http/http.dart' as http;
class statsService{
  Future<WorldStatsModel> fetch() async {
    var client = http.Client();
    var _headers = {
      'api_key': 'aabbcc345666666',
    };
    var uri = Uri.parse(AppUrl.worldStatsApi);
    var response = await client.get(uri, headers: _headers);

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return WorldStatsModel.fromJson(json);
    }
    else{
      throw Exception("error");
    }
  }

  Future<List<dynamic>> fetchCountries() async {
    var client = http.Client();
    var _headers = {
      'api_key': 'aabbcc345666666',
    };
    var uri = Uri.parse(AppUrl.countriesList);
    var response = await client.get(uri, headers: _headers);

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return json;
    }
    else{
      throw Exception("error");
    }
  }
  }