import 'package:covide_tracker/pages/home/controller.dart';
import 'package:covide_tracker/pages/home/widget/record_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          SizedBox(
            height: size.height * 0.01,
          ),
          RecordList(size: size, controller: controller),
        ]),
      )),
    );
  }
}
