import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syria_zone/modules/register/cubit/register_states.dart';
import '../../../shared/networking/end_points.dart';

import '../../../shared/networking/remote/dio_helper.dart';


class RegisterCubit extends Cubit<RegisterStates>{
  RegisterCubit():super(RegisterIntitialState());
  static RegisterCubit get(context)=>BlocProvider.of(context);

  void register(
      {
        required String email,
        required  String password,
        required  String name,
        required  String phone,
      }
      ){
    emit(RegisterLoadingState());
    DioHelper.postData(
        path: REGISTER,
        data: {
          "name":name,
          "email":email,
          "password":password,
          "phone":phone,
        }
    ).then((response){
      emit(RegisterSuccessfulState());
      print(response.data);
    }).catchError((error){
      emit(RegisterFailedState());
      print(error.toString());
    });
  }
}