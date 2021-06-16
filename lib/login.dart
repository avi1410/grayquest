import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'otp.dart';
import 'shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {

  final _numberFormKey = GlobalKey<FormState>();
  bool _switchWhatsApp = false;
  TextEditingController _number = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: AppBar(
            // Here we create one to set status bar color
            backgroundColor: Colors
                .indigo, // Set any color of status bar you want; or it defaults to your theme's primary color
          )),
      backgroundColor: Color(0xFFD6D6D6),
      body: new Container(
        color: Colors.indigoAccent,
        child: new Column(
          children: <Widget>[
            new SizedBox(
              height: 80.0,
              child: new Center(
                child: new Image(
                  image: new AssetImage("assets/logo1.png"),
                  height: 40.0,
                ),
              ),
            ),
            new Flexible(
              child: new Container(
                margin: EdgeInsets.only(top: 15.0),
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0),topRight: Radius.circular(20.0)),
                  color: Colors.white,
                ),
                child: new Column(
                  children: <Widget>[
                    new Padding(
                      padding: EdgeInsets.all(15.0),
                      child: new Row(
                        children: <Widget>[
                          new Expanded(
                            child: new Text(
                              "Please enter your mobile number",
                              style: new TextStyle(
                                fontSize: 25.0,
                                color: Colors.black,
                                // fontWeight: FontWeight.bold
                              ),
                            ),
                            flex: 2,
                          ),
                          new Expanded(
                            child: new Align(
                              alignment: FractionalOffset.centerRight,
                              child: new Image(
                                image: new AssetImage("assets/phone.png"),
                                height: 50.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    new Padding(
                      padding: EdgeInsets.only(left: 15.0, right: 15.0),
                      child: new Text(
                        "A 4-digit OTP will be sent via SMS to verify your mobile number.",
                        style: new TextStyle(
                            color: Colors.grey, fontSize: 16.0),
                      ),
                    ),
                    new Container(
                      margin: EdgeInsets.only(
                          top: 40.0, left: 15.0, right: 15.0, bottom: 20.0),
                      child: new Card(
                        elevation: 15,
                        child: new Container(
                          margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                          child: new Column(
                            children: <Widget>[
                              new Row(
                                children: <Widget>[
                                  new Padding(padding: EdgeInsets.all(5.0)),
                                  new Text(
                                    "+91",
                                    style: new TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  new Padding(padding: EdgeInsets.all(5.0)),
                                  new Flexible(
                                    child: new Form(
                                      key: _numberFormKey,
                                      autovalidateMode: AutovalidateMode.onUserInteraction,
                                      child: new TextFormField(
                                        controller: _number,
                                        decoration: new InputDecoration(
                                          hintText:
                                              "Please enter mobile number",
                                          border: InputBorder.none,
                                        ),
                                        keyboardType: TextInputType.number,
                                        inputFormatters: <TextInputFormatter>[
                                          FilteringTextInputFormatter
                                              .digitsOnly,
                                          new LengthLimitingTextInputFormatter(
                                              10)
                                        ],
                                        validator: (value) {
                                          if (value == null ||
                                              value.isEmpty) {
                                            return 'Please enter mobile number';
                                          }else if(value.length!=10){
                                            return 'Please enter valid mobile number';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    flex: 1,
                                  ),
                                  new MaterialButton(
                                    color: Colors.indigoAccent,
                                    child: new Text(
                                      "Send OTP",
                                      style: new TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0)),
                                    ),
                                    onPressed: () => {
                                      sendOtp()
                                    },
                                  ),
                                  new Padding(padding: EdgeInsets.all(5.0))
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    new Expanded(
                      child: Align(
                        alignment: FractionalOffset.bottomCenter,
                        child: new Container(
                          margin: EdgeInsets.only(bottom: 20.0, left: 15.0, right: 15.0),
                          child: new Row(
                            children: <Widget>[
                              new Image(
                                image:
                                    new AssetImage("assets/whatsapp.png"),
                                height: 20.0,
                              ),
                              new Padding(padding: EdgeInsets.only(left: 10.0)),
                              new Text(
                                "Send me updates on WhatsApp",
                              ),
                              new Switch(
                                value: _switchWhatsApp,
                                onChanged: (value) {
                                  setState(() {
                                    _switchWhatsApp = value;
                                    print(_switchWhatsApp);
                                  });
                                },
                                activeTrackColor: Colors.indigoAccent,
                                activeColor: Colors.indigoAccent,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }

  /// This method is to send OTP and Redirect to OTP Verification Screen
  sendOtp(){
    if(_numberFormKey.currentState.validate()) {
      print(_number.text);
      SharedPreferencesClass().setNumber("+91"+_number.text);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OTP()));
    }
  }
}
