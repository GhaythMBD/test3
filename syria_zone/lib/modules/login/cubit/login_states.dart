import 'package:syria_zone/models/login_model.dart';

abstract class LoginStates{}

class LoginIntitialState extends LoginStates{}
class LoginSuccessfulState extends LoginStates{
  final LoginModel? loginModel;
  LoginSuccessfulState( this.loginModel);
}
class LoginLoadingState extends LoginStates{}
class LoginFailedState extends LoginStates{}