
import 'dart:io';

import 'package:base_getx/core/constants/app_api_routes.dart';
import 'package:base_getx/core/service/api_service.dart';
import 'package:base_getx/core/utils/logic_utils.dart';


class RegistrationApiController {
  ApiService apiService;

  RegistrationApiController(this.apiService);

  Future<dynamic> login({required String email,required String password,}) async {
    LogicUtils.log('Start login() Api');
    var response = await apiService.post(url: AppApiRoute.login,headers: {}, body: {
      'email': email.toString(),
      'password': password.toString(),
    });
    LogicUtils.log('End login() Api: $response');
    return response.fold((l) => l, (map) {
      if (map['success']) {
        return null;//User.fromJsonToList([map['data']]).first;
      }
      return ValidationMessage(map['message']);
    });
  }
  Future<dynamic> logout() async {
    LogicUtils.log('Start logout() Api');
    var response = await apiService.get(url: AppApiRoute.logout,headers: {});
    LogicUtils.log('End logout() Api: $response');
    return response.fold((l) => l, (map) {
      if (map['success']) {
        return null;
      }
      return ValidationMessage(map['message']);
    });
  }
}
