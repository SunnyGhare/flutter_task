import 'dart:async';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../widgets/constant_widgets.dart';
import 'package:jwt_decoder/jwt_decoder.dart';


String baseUrl = "https://uatapi.tharpay.co.in";
RxBool isTokenValid = false.obs;
RxBool isInternetAvailable = false.obs;

// Get storage keys
const loginTypeKey = 'loginType';
const loginDataKey = 'loginDataKey';
const apiTimeOutMsg = 'Request timeout, please try again!';
const noInternetMsg = 'Please check your internet connection';

// Get stored login details
LoginModel getStoredLoginDetails() {
  LoginModel loginModel = LoginModel();
  var data = GetStorage().read(loginDataKey);
  if (data != null) {
    loginModel = LoginModel.fromJson(GetStorage().read(loginDataKey));
  }
  return loginModel;
}



// Get stored user auth token
String getAuthToken() {
  LoginModel loginModel = getStoredLoginDetails();
  if (loginModel.accessToken != null && loginModel.accessToken!.isNotEmpty) {
    bool isTokenExpired = JwtDecoder.isExpired(loginModel.accessToken!);
    if (isTokenExpired == true) {
      isTokenValid.value = false;
      Timer(const Duration(seconds: 1), () {
        Get.offNamed(Routes.AUTH_SCREEN);
        errorSnackBar(message: 'Your session has expired!');
      });
      return '';
    } else {
      isTokenValid.value = true;
      return loginModel.accessToken!;
    }
  } else {
    isTokenValid.value = false;
    return '';
  }
}