
import 'package:flutter_task/routes/routes.dart';
import 'package:flutter_task/screens/co_working_screen.dart';
import 'package:flutter_task/screens/login_screen.dart';
import 'package:flutter_task/screens/select_date_screen.dart';
import 'package:flutter_task/screens/sign_up_screen.dart';
import 'package:get/get.dart';
class AppPages
{
  static String INITIAL_ROUTE = Routes.SIGN_UP_SCREEN;
  static final pages =
  [
    GetPage(
        name: Routes.SIGN_UP_SCREEN,
        page: ()=>SignupScreen()
    ),
    GetPage(
        name: Routes.LOGIN_SCREEN,
        page: ()=>LoginScreen()
    ),
    GetPage(
        name: Routes.COWORKING_SCREEN,
        page: ()=>CoworkingScreen()
    ),
    GetPage(
        name: Routes.SELECT_DATE_SCREEN,
        page: ()=>SelectDateScreen()
    ),
  ];
}