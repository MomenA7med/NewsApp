// import 'package:flutter/cupertino.dart';
// import 'package:news_eg/generated_plugin_registrant.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class CacheHelper {
//   static SharedPreferences sharedPreferences;
//   static init() async{
//     sharedPreferences = await SharedPreferences.getInstance();
//   }
//
//   static Future<bool> putData({
//   @required String key,
//   @required bool isDark,
// })async{
//     return await sharedPreferences.setBool(key, isDark);
//   }
//
//   static bool getData({
//     @required String key,
//   }){
//     return sharedPreferences.getBool(key);
//   }
// }