import 'dart:async';

import 'package:flutter_task/models/create_account_model.dart';

import '../api/api_manager.dart';
import '../models/booking_model.dart';
import '../models/login_model.dart';
import '../models/slots_model.dart';
import '../utils/string_constants.dart';

class AuthRepository {
  final APIManager apiManager;
  AuthRepository(this.apiManager);

  //Login api
  Future<LoginModel> loginApiCall({required var params, bool isLoaderShow = true}) async {
    var jsonData = await apiManager.postAPICall(
      url: 'https://demo0413095.mockable.io/digitalflake/api/login',
      params: params,
      isLoaderShow: isLoaderShow,
    );
    var response = LoginModel.fromJson(jsonData);
    return response;
  }


  //Create Account api
  Future<CreateAccountModel> createAccountApiCall({required var params, bool isLoaderShow = true}) async {
    var jsonData = await apiManager.postAPICall(
      url: '${baseUrl}create_account',
      params: params,
      isLoaderShow: isLoaderShow,
    );
    var response = CreateAccountModel.fromJson(jsonData);
    return response;
  }

  //select Slot api
  Future<SlotsModel> selectSlotApiCall({ required var params , bool isLoaderShow = true}) async{
    var jsonData = await apiManager.getAPICall(
        url: 'https://demo0413095.mockable.io/digitalflake/api/get_slots?date=2023-05-01',
    params:params,
    isLoaderShow: isLoaderShow,
    );
    var response = SlotsModel.fromJson(jsonData);
    return response;
  }

  //booking history api
  Future<List<BookingModel>> bookingHistoryApiCall ({ required var params , bool isLoaderShow = true}) async {
    var jsonData = await apiManager.getAPICall(
        url: "https://demo0413095.mockable.io/digitalflake/api/get_bookings?user_id=1",
        params: params,
        isLoaderShow: isLoaderShow
         );
    var response = jsonData as List;
    List<BookingModel> objects =
        response.map((e) => BookingModel.fromJson(e)).toList();
        return objects;
  }
}
