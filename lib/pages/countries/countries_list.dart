import 'package:covide_tracker/pages/countries/controller.dart';
import 'package:covide_tracker/pages/countries/widgets/countries_record.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CountriesListPage extends GetView<CountriesController> {
  const CountriesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GestureDetector(
          onTap: () => Focus.of(context).unfocus(),
          child: Column(
            children: [
              TextFormField(
                controller: controller.searchController,
                onChanged: (value) => controller.change(value),
                decoration: InputDecoration(
                    hintText: 'Search your country name',
                    contentPadding: const EdgeInsets.symmetric(horizontal: 25),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25))),
              ),
              CoutriesRecord(
                controller: controller,
              )
            ],
          ),
        ),
      ),
    );
  }
}
