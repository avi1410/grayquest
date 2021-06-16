import 'dart:async';

import 'package:flutter/material.dart';
import 'shared_preferences.dart';
import 'dashboard.dart';
import 'login.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {

  bool isLogin;

  @override
  void initState() {
    super.initState();
    isLogin = _isLogin();
    Timer(
        Duration(seconds: 3),
            () => getScreenNavigator());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        color: Colors.indigoAccent,
        child: new Center(
          child: new Image(image: new AssetImage("assets/logo1.png"),
            height: 120.0,),
        ),
      ),
    );
  }

  ///This method is to check whether user is already login or not and redirect to particular screen
  void getScreenNavigator(){

    print(isLogin);

    if(!isLogin) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Login()));
    }else{
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Dashboard()));
    }
  }

  ///This method is to get isLogin data from Shared Preferences
  bool _isLogin(){
    SharedPreferencesClass().getIsLogin().then((bool isLog){
      setState(() {
        isLogin = isLog;
      });
    });

    return isLogin;
  }
}
