import 'package:covide_tracker/pages/home/controller.dart';
import 'package:covide_tracker/pages/home/model.dart';
import 'package:covide_tracker/pages/home/widget/record_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../../common/routes/app_routes.dart';

class RecordList extends StatelessWidget {
  const RecordList({
    super.key,
    required this.controller,
    required this.size,
  });

  final HomeController controller;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: controller.getData(),
        builder: (_, AsyncSnapshot<WorldStateModel> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Expanded(
                child: SpinKitFadingCircle(
              controller: controller.animationController,
              color: Colors.white,
              size: 50,
            ));
          } else {
            return Column(
              children: [
                PieChart(
                  dataMap: {
                    'Total': double.parse(snapshot.data!.cases!.toString()),
                    "Recovered":
                        double.parse(snapshot.data!.recovered!.toString()),
                    'Death': double.parse(snapshot.data!.deaths!.toString()),
                  },
                  chartValuesOptions: const ChartValuesOptions(
                      showChartValuesInPercentage: true),
                  chartRadius: size.width / 3.2,
                  chartType: ChartType.ring,
                  animationDuration: const Duration(milliseconds: 1200),
                  colorList: controller.colorList,
                  legendOptions:
                      const LegendOptions(legendPosition: LegendPosition.left),
                ),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: size.height * 0.08),
                    child: Card(
                      child: Column(
                        children: [
                          RecordCard(
                              title: 'Total',
                              value: snapshot.data!.cases!.toString()),
                          RecordCard(
                              title: 'Deaths',
                              value: snapshot.data!.deaths!.toString()),
                          RecordCard(
                              title: 'Recovered',
                              value: snapshot.data!.recovered!.toString()),
                          RecordCard(
                              title: 'Active',
                              value: snapshot.data!.active!.toString()),
                          RecordCard(
                              title: 'Critical',
                              value: snapshot.data!.critical!.toString()),
                          RecordCard(
                              title: 'Today Deaths',
                              value: snapshot.data!.todayDeaths!.toString()),
                          RecordCard(
                              title: 'Today Recovered',
                              value: snapshot.data!.todayRecovered!.toString()),
                        ],
                      ),
                    )),
                SizedBox(
                    width: double.infinity,
                    height: size.height * 0.06,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff1aa268)),
                        onPressed: () {
                          Get.toNamed(Routes.countries);
                        },
                        child: const Text('Country Tracker')))
              ],
            );
          }
        });
  }
}
