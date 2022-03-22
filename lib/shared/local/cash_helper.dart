import 'package:shared_preferences/shared_preferences.dart';

class cachHelper
{
  static late SharedPreferences sharedPreferences;

  static iniit() async
  {
    //علشاان تعرفه
    sharedPreferences = await SharedPreferences.getInstance();
  }

 static Future<bool> putData({
  required String key,
    required bool value
}) async
  {
    return await sharedPreferences.setBool('key', value);
  }

  static bool? getData({
    required String key,
  })
  {
    return  sharedPreferences.getBool('key');
  }
}