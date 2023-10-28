import 'package:covide_tracker/common/routes/app_routes.dart';
import 'package:covide_tracker/pages/countries/index.dart';
import 'package:get/get.dart';

import '../../pages/detail/index.dart';
import '../../pages/home/index.dart';
import '../../pages/splash/index.dart';

class AppPages {
  static const initial = Routes.splash;
  static final routes = [
    GetPage(
        name: Routes.splash,
        page: () => const SplashPage(),
        binding: SplashBindig()),
    GetPage(
        name: Routes.home,
        page: () => const HomePage(),
        binding: HomeBinding()),
    GetPage(
        name: Routes.countries,
        page: () => const CountriesListPage(),
        binding: CountriesBindig()),
    GetPage(
        name: Routes.detail,
        page: () => const DetailPage(),
        binding: DetailBinding()),
  ];
}
