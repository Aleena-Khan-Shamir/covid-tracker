import 'package:covide_tracker/pages/detail/controller.dart';
import 'package:covide_tracker/pages/home/widget/record_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPage extends GetView<DetailController> {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(Get.arguments['country']),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Card(
                    child: Column(
                      children: [
                        SizedBox(height: size.height * 0.05),
                        RecordCard(
                            title: 'Cases',
                            value: Get.arguments['cases'].toString()),
                        RecordCard(
                            title: 'Deaths',
                            value: Get.arguments['deaths'].toString()),
                        RecordCard(
                            title: 'Recovered',
                            value: Get.arguments['recovered'].toString()),
                        RecordCard(
                            title: 'Critical',
                            value: Get.arguments['critical'].toString()),
                        RecordCard(
                            title: 'Today Recovered',
                            value: Get.arguments['todayRecovered'].toString()),
                        RecordCard(
                            title: 'Today Deaths',
                            value: Get.arguments['todayDeaths'].toString()),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: size.height * 0.12,
              left: size.width / 3,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(Get.arguments['flag']),
              ),
            )
          ],
        ),
      ),
    );
  }
}
