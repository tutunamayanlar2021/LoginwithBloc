import 'package:camera_app/login/model/login_request_model.dart';
import 'package:camera_app/login/model/login_response.dart';
import 'package:dio/dio.dart';

abstract class ILoginService {
  final Dio dio;
  final String loginPath = ILoginServicePath.LOGIN.rawValue;

  ILoginService(this.dio);
  Future<LoginResponseModel?> postUserLogin(LoginRequestModel model);
}

enum ILoginServicePath { LOGIN }

extension ILoginServicePathExtension on ILoginServicePath {
  String get rawValue {
    switch (this) {
      case ILoginServicePath.LOGIN:
        return '/login';
    }
  }
}
