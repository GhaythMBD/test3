import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syria_zone/modules/layout/layout.dart';
import 'package:syria_zone/modules/login/login_screen.dart';
import 'package:syria_zone/modules/onBording/on_boarding_screen.dart';
import 'package:syria_zone/shared/cubit/observer.dart';
import 'package:syria_zone/shared/networking/local/cach_helper.dart';
import 'package:syria_zone/shared/networking/remote/dio_helper.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  DioHelper.initial();
  //CachHelper.inital();

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: "ShopApp",
      theme: ThemeData(
        // appBarTheme: AppBarTheme(
        //   systemOverlayStyle: SystemUiOverlayStyle(
        //     statusBarColor:
        //   )
        // )
      ),
      home: OnBoardingScreen(),
    );

  }
}