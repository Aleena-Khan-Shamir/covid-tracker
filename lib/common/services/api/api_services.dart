import 'dart:convert';

import 'package:covide_tracker/common/services/api/endpoints.dart';
import 'package:covide_tracker/pages/home/model.dart';
import 'package:http/http.dart' as http;

class APIServices {
  static Future<WorldStateModel> fetchWorldStateRecord() async {
    final response =
        await http.get(Uri.parse(EndPoints.baseUrl + EndPoints.worldStateApi));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      return WorldStateModel.fromJson(data);
    } else {
      throw Exception('failed');
    }
  }

  static Future fetchCountryListRecord() async {
    var data;
    final response = await http
        .get(Uri.parse(EndPoints.baseUrl + EndPoints.countryStateApi));
    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
      return data;
    } else {
      throw Exception('failed');
    }
  }
}
