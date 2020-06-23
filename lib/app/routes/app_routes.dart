import 'package:get/get.dart';
import 'package:getx_modular_pattern/app/modules/home/home_page.dart';

class AppRoutes {
  static final routes = [
    GetPage(name: '/', page: () => HomePage()),
  ];
}
