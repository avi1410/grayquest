import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesClass{


  final String IS_LOGIN = "is_login";
  final String NUMBER = "number";

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<bool> getIsLogin() async {
    final SharedPreferences preferences = await _prefs;

    return preferences.getBool(IS_LOGIN)??false;
  }

  Future<bool> setIsLogin(bool isLogin) async {
    final SharedPreferences preferences = await _prefs;

    return preferences.setBool(IS_LOGIN, isLogin);
  }

  Future<String> getNumber() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    return preferences.get(NUMBER) ?? "";
  }

  Future<bool> setNumber(String number) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    return preferences.setString(NUMBER, number);
  }
}