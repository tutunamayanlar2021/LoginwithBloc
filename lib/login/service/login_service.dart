import 'dart:io';

import 'package:camera_app/login/model/login_response.dart';
import 'package:camera_app/login/model/login_request_model.dart';
import 'ILoginService.dart';

class LoginService extends ILoginService {
  LoginService(super.dio);

  @override
  Future<LoginResponseModel?> postUserLogin(LoginRequestModel model) async {
    final response = await dio.post(loginPath, data: model);
    if (response.statusCode == HttpStatus.ok) {
      return LoginResponseModel.fromJson(response.data);
    } else {
      return null;
    }
  }
}
