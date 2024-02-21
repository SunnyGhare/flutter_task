
import 'package:flutter_task/bindings/auth_binding.dart';
import 'package:flutter_task/bindings/booking_binding.dart';
import 'package:flutter_task/bindings/network_binding.dart';
import 'package:flutter_task/bindings/slot_binding.dart';
import 'package:flutter_task/routes/routes.dart';
import 'package:flutter_task/screens/co_working_screen.dart';
import 'package:flutter_task/screens/login_screen.dart';
import 'package:flutter_task/screens/no_internet_connection_screen.dart';
import 'package:flutter_task/screens/select_date_screen.dart';
import 'package:flutter_task/screens/sign_up_screen.dart';
import 'package:get/get.dart';
class AppPages
{
  static String INITIAL_ROUTE = Routes.SIGN_UP_SCREEN;
  static final routes =
  [
    GetPage(
        name: Routes.SIGN_UP_SCREEN,
        page: ()=>SignupScreen(),
        binding: AuthBinding()
    ),
    GetPage(
        name: Routes.LOGIN_SCREEN,
        page: ()=>LoginScreen(),
        binding: AuthBinding()
    ),
    GetPage(
        name: Routes.COWORKING_SCREEN,
        page: ()=>CoworkingScreen(),
        binding: BookingBinding()
    ),
    GetPage(
        name: Routes.SELECT_DATE_SCREEN,
        page: ()=>SelectDateScreen(),
        binding: SlotBinding()
    ),
    GetPage(
        name: Routes.NO_INTERNET_CONNECTION_SCREEN,
        page: ()=>NoInternetConnectionScreen(),
        binding: NetworkBinding()
    ),
  ];
}