import 'package:covide_tracker/common/services/api/api_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CountriesController extends GetxController {
  TextEditingController searchController = TextEditingController();

  void change(value) {
    // searchController.text = value;
    update();
  }

  // to get country list
  Future<List<dynamic>> getCountryListRecord() async {
    return await APIServices.fetchCountryListRecord();
  }
}
