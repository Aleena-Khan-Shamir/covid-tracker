import 'package:covide_tracker/common/services/api/api_services.dart';
import 'package:covide_tracker/pages/home/model.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final colorList = [
    const Color(0xff4285F4),
    const Color(0xff1aa268),
    const Color(0xffde5246),
  ];

  late final animationController =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();
  Future<WorldStateModel> getData() async {
    return await APIServices.fetchWorldStateRecord();
  }
}
