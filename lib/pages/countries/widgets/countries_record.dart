import 'package:covide_tracker/pages/countries/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../common/routes/app_routes.dart';

class CoutriesRecord extends StatelessWidget {
  const CoutriesRecord({super.key, required this.controller});
  final CountriesController controller;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetBuilder<CountriesController>(
          init: CountriesController(),
          builder: (context) {
            return FutureBuilder(
                future: controller.getCountryListRecord(),
                builder: (_, AsyncSnapshot<List<dynamic>> snapshot) {
                  if (!snapshot.hasData) {
                    return ListView.builder(
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Shimmer.fromColors(
                            baseColor: Colors.grey.shade700,
                            highlightColor: Colors.grey.shade100,
                            child: Column(
                              children: [
                                ListTile(
                                  leading: CircleAvatar(
                                      child: Container(
                                    color: Colors.white,
                                  )),
                                  title: Container(
                                      height: 10,
                                      width: 89,
                                      color: Colors.white),
                                  subtitle: Container(
                                      height: 10,
                                      width: 89,
                                      color: Colors.white),
                                )
                              ],
                            ),
                          );
                        });
                  } else {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, index) {
                          String name = snapshot.data![index]['country'];
                          if (controller.searchController.text.isEmpty) {
                            return Column(
                              children: [
                                GestureDetector(
                                  onTap: () =>
                                      Get.toNamed(Routes.detail, arguments: {
                                    'country': snapshot.data![index]['country'],
                                    'flag': snapshot.data![index]['countryInfo']
                                        ['flag'],
                                    'cases': snapshot.data![index]['cases'],
                                    'deaths': snapshot.data![index]['deaths'],
                                    'critical': snapshot.data![index]
                                        ['critical'],
                                    'recovered': snapshot.data![index]
                                        ['recovered'],
                                    'todayRecovered': snapshot.data![index]
                                        ['todayRecovered'],
                                    'todayDeaths': snapshot.data![index]
                                        ['todayDeaths'],
                                  }),
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      backgroundImage: NetworkImage(snapshot
                                          .data![index]['countryInfo']['flag']),
                                    ),
                                    title:
                                        Text(snapshot.data![index]['country']),
                                    subtitle: Text(snapshot.data![index]
                                            ['cases']
                                        .toString()),
                                  ),
                                )
                              ],
                            );
                          } else if (name.toLowerCase().contains(
                              controller.searchController.text.toLowerCase())) {
                            return Column(
                              children: [
                                GestureDetector(
                                  onTap: () =>
                                      Get.toNamed(Routes.detail, arguments: {
                                    'country': snapshot.data![index]['country'],
                                    'flag': snapshot.data![index]['countryInfo']
                                        ['flag'],
                                    'cases': snapshot.data![index]['cases'],
                                    'deaths': snapshot.data![index]['deaths'],
                                    'critical': snapshot.data![index]
                                        ['critical'],
                                    'recovered': snapshot.data![index]
                                        ['recovered'],
                                    'todayRecovered': snapshot.data![index]
                                        ['todayRecovered'],
                                    'todayDeaths': snapshot.data![index]
                                        ['todayDeaths'],
                                  }),
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      backgroundImage: NetworkImage(snapshot
                                          .data![index]['countryInfo']['flag']),
                                    ),
                                    title:
                                        Text(snapshot.data![index]['country']),
                                    subtitle: Text(snapshot.data![index]
                                            ['cases']
                                        .toString()),
                                  ),
                                )
                              ],
                            );
                          } else {
                            return const SizedBox();
                          }
                        });
                  }
                });
          }),
    );
  }
}
