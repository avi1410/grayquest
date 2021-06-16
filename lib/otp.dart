import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'shared_preferences.dart';
import 'dashboard.dart';

class OTP extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return OTPState();
  }
}

class OTPState extends State<OTP> {
  String _opt;
  String number;

  @override
  void initState() {
    super.initState();
    number = getNumber();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0)),
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
                              "Please enter the OTP below",
                              style: new TextStyle(
                                fontSize: 25.0,
                                color: Colors.black,
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
                      child: new RichText(
                        text: TextSpan(
                            text:
                                'Please type the 4-digit verification code (OTP) sent to ',
                            style: new TextStyle(
                                color: Colors.grey, fontSize: 16.0),
                            children: <TextSpan>[
                              TextSpan(
                                text: number,
                                style: TextStyle(
                                  color: Colors.black38,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ]),
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
                                  new Flexible(
                                    child: new OTPTextField(
                                      length: 4,
                                      width: MediaQuery.of(context).size.width,
                                      textFieldAlignment:
                                          MainAxisAlignment.spaceAround,
                                      // fieldWidth: 20,
                                      // fieldStyle: FieldStyle.box,
                                      // outlineBorderRadius: 15,
                                      style: TextStyle(
                                        fontSize: 17,
                                      ),
                                      onChanged: (pin) {
                                        print("Changed: " + pin);
                                        setState(() {
                                          _opt = pin;
                                        });
                                      },
                                      onCompleted: (pin) {
                                        print("Completed: " + pin);
                                        setState(() {
                                          _opt = pin;
                                        });
                                      },
                                    ),
                                    flex: 1,
                                  ),
                                  new MaterialButton(
                                    color: Colors.indigoAccent,
                                    child: new Text(
                                      "Verify",
                                      style: new TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0)),
                                    ),
                                    onPressed: () => {verifyOTP()},
                                  ),
                                  new Padding(padding: EdgeInsets.all(5.0))
                                ],
                              ),
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

  ///This method is to get number from Shared preferences
  String getNumber() {
    SharedPreferencesClass().getNumber().then((String result) {
      setState(() => number = result);
    });
    print(number);
    return number;
  }

  ///This method is to validate and verify entered OTP
  verifyOTP() {
    print(_opt);
    if (_opt == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Please enter 4-digit OTP'),
      ));
    } else if (_opt.length != 4) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Please enter valid 4-digit OTP'),
      ));
    } else if (_opt == '1234') {
      SharedPreferencesClass().setIsLogin(true);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Dashboard()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Please enter valid 4-digit OTP'),
      ));
    }
  }
}
