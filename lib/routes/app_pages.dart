import 'package:get/get.dart';

import 'package:tourism_app/views/home/home.dart';
import 'package:tourism_app/views/detail/detail.dart';

part 'app_routes.dart';

abstract class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.homeRoute,
      page: () => Home(),
    ),
    GetPage(
      name: AppRoutes.detailRoute,
      page: () => Detail(),
      transition: Transition.cupertino,
    ),
  ];
}
