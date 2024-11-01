
import 'package:get/get.dart';
import 'package:thread/routes/routes_names.dart';
import 'package:thread/view/auth/login.dart';
import 'package:thread/view/auth/register.dart';
import 'package:thread/view/home.dart';

class Routes {
  static final pages = [
    GetPage(
      name: RoutesNames.home,
      page: () => const Home(),
    ),
    GetPage(
      name: RoutesNames.login,
      page: () => const Login(),
    ),
    GetPage(
      name: RoutesNames.register,
      page: () => const Register(),
    ),
  ];
}
