// import 'package:shared_preferences/shared_preferences.dart';
//
// class CachHelper{
//   static SharedPreferences? sharedPrefrence;
//   static inital()async{
//     sharedPrefrence=await SharedPreferences.getInstance();
//   }
//
//   static Future<bool> setData({required String key,required var value })async{
//     if(value is String){
//       return await sharedPrefrence!.setString(key, value);
//     }else if(value is int ){
//       return await sharedPrefrence!.setInt(key, value);
//     }else if(value is bool ){
//       return await sharedPrefrence!.setBool(key, value);
//     }
//     return await sharedPrefrence!.setDouble(key, value);
//
//   }
//   static dynamic getData({required String key}){
//     sharedPrefrence!.get(key);
//   }
//
//
// }