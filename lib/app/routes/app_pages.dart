import 'package:get/get.dart';

import '../modules/authorisation/bindings/authorisation_binding.dart';
import '../modules/authorisation/views/authorisation_view.dart';
import '../modules/authorisation/views/registration_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.AUTHORISATION;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.AUTHORISATION,
      page: () => const AuthorisationView(),
      binding: AuthorisationBinding(),
    ),
    GetPage(
      name: _Paths.REGUSTRATION,
      page: () => const RegistrationView(),
      binding: AuthorisationBinding(),
    ),
  ];
}
