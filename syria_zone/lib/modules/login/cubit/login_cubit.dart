import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syria_zone/models/login_model.dart';
import 'package:syria_zone/modules/login/cubit/login_states.dart';
import 'package:syria_zone/shared/networking/end_points.dart';
import 'package:syria_zone/shared/networking/remote/dio_helper.dart';

class LoginCubit extends Cubit<LoginStates>{
  LoginCubit():super(LoginIntitialState());

  static LoginCubit get(context)=>BlocProvider.of(context);

  LoginModel? loginModel ;

  void login({required String email,required  String password}){
    emit(LoginLoadingState());
    DioHelper.postData(
        path: LOGIN,
        data: {
          "email":email,
          "password":password,
        }
    ).then((response){
      loginModel=LoginModel.fromJson(response.data);
      emit(LoginSuccessfulState(loginModel));
    }).catchError((error){
      emit(LoginFailedState());
      print(error.toString());
    });
  }
}