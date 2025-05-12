import 'package:dio/dio.dart';

class DioHelper{
  static Dio? dio;
  static initial(){
    dio=Dio(
      BaseOptions(
        baseUrl: "https://student.valuxapps.com/api/",
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String path,
    required Map<String,dynamic> query,

})async
  {
    return await dio!.get(
      path,
      queryParameters: query,
    );
}

  static Future<Response> postData({
    required String path,
    Map<String,dynamic>? query,
    required Map<String,dynamic> data,
})async
  {
    return await dio!.post(
      path,
      data:data,
      queryParameters: query,
    );
  }
}