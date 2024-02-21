import 'package:flutter_task/models/create_account_model.dart';

import '../api/api_manager.dart';
import '../models/login_model.dart';
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

}
