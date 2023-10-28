import 'package:covide_tracker/pages/splash/controller.dart';
import 'package:get/get.dart';

class SplashBindig extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }
}
