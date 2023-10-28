import 'package:covide_tracker/pages/countries/controller.dart';
import 'package:get/get.dart';

class CountriesBindig extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CountriesController());
  }
}
