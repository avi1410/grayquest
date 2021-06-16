import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'database_helper.dart';
import 'modal_application.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'dashboard.dart';

class PersonalDetails extends StatefulWidget {
  PersonalDetails(this.instituteVib, this.branch, this.hasUnique,
      {this.uniqueID = "null"});

  final String instituteVib;
  final String branch;
  final String hasUnique;
  final String uniqueID;

  @override
  State<StatefulWidget> createState() {
    return PersonalDetailsState();
  }
}

class PersonalDetailsState extends State<PersonalDetails> {
  final dbHelper = DatabaseHelper.instance;

  String instituteVib;
  String branch;
  String uniqueId;
  String hasUnique;

  TextEditingController _parentName = TextEditingController();
  TextEditingController _date = TextEditingController();
  TextEditingController _other = TextEditingController();
  String patientDate;

  String _patientGender = "";
  String _patientMaterial = "";

  List<String> _genderList = ["Male", "Female"];
  List<String> _materialState = ["Married", "Divorced", "Others"];

  DateTime currentDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
        String formattedDate = DateFormat('dd-MM-yyyy').format(currentDate);
        _date.text = formattedDate.toString();
        // _date = patientDate.toString() as TextEditingController;
      });
  }

  @override
  void initState() {
    instituteVib = this.widget.instituteVib;
    branch = this.widget.branch;
    uniqueId = this.widget.uniqueID;
    hasUnique = this.widget.hasUnique;

    print('personal details - instituteVib: $instituteVib');
    print('personal details - branch: $branch');
    print('personal details - uniqueId: $uniqueId');
    print('personal details - hasUnique: $hasUnique');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String radioItem = '';
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
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Padding(padding: EdgeInsets.only(top: 20.0)),
                  new Expanded(
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Padding(padding: EdgeInsets.only(left: 15.0)),
                        new Container(
                          width: 30.0,
                          height: 30.0,
                          decoration: new BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                          ),
                          child: new Center(
                            child: new Text(
                              "1",
                              style: new TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        new Expanded(
                          child: new Container(
                            margin:
                                const EdgeInsets.only(left: 10.0, right: 15.0),
                            child: Divider(
                              color: Colors.green,
                              height: 50,
                            ),
                          ),
                          flex: 1,
                        ),
                        new Container(
                          width: 30.0,
                          height: 30.0,
                          decoration: new BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                            // borderRadius: BorderRadius.all(Radius.circular(1)),
                            border: Border.all(
                                width: 1, color: Colors.purpleAccent),
                          ),
                          child: new Center(
                            child: new Text(
                              "2",
                              style: new TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        new Expanded(
                          child: new Container(
                            margin:
                                const EdgeInsets.only(left: 10.0, right: 15.0),
                            child: Divider(
                              color: Colors.purpleAccent,
                              height: 50,
                            ),
                          ),
                          flex: 1,
                        ),
                        new Container(
                          width: 30.0,
                          height: 30.0,
                          decoration: new BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            // borderRadius: BorderRadius.all(Radius.circular(1)),
                            // border: Border.all(width: 1, color: Colors.purpleAccent),
                          ),
                          child: new Center(
                            child: new Text(
                              "3",
                              style: new TextStyle(
                                color: Colors.purpleAccent,
                              ),
                            ),
                          ),
                        ),
                        new Padding(padding: EdgeInsets.only(left: 15.0)),
                      ],
                    ),
                    flex: 1,
                  ),
                  new Expanded(
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Padding(padding: EdgeInsets.only(left: 15.0)),
                        new Expanded(
                          child: new Align(
                            alignment: Alignment.centerLeft,
                            child: new Text(
                              "Student details",
                              style: new TextStyle(
                                color: Colors.purpleAccent,
                              ),
                            ),
                          ),
                          flex: 1,
                        ),
                        new Expanded(
                          child: new Align(
                            alignment: Alignment.center,
                            child: new Text(
                              "Choose plan",
                              style: new TextStyle(
                                color: Colors.purpleAccent,
                              ),
                            ),
                          ),
                          flex: 1,
                        ),
                        new Expanded(
                          child: new Align(
                            alignment: Alignment.centerRight,
                            child: new Text(
                              "Personal Details",
                              style: new TextStyle(
                                color: Colors.purpleAccent,
                              ),
                            ),
                          ),
                          flex: 1,
                        ),
                        new Padding(padding: EdgeInsets.only(right: 15.0)),
                      ],
                    ),
                    flex: 1,
                  ),
                ],
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
                child: new ListView(
                  children: <Widget>[
                    new Container(
                      margin:
                          EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0),
                      child: new Card(
                        elevation: 15,
                        child: new Padding(
                          padding: EdgeInsets.all(10.0),
                          child: new Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              new Row(
                                children: <Widget>[
                                  new Icon(
                                    Icons.home_filled,
                                    color: Colors.purple,
                                  ),
                                  new Expanded(
                                    child: new Container(
                                      margin: EdgeInsets.only(
                                          left: 10.0, right: 10.0),
                                      child: new Text(
                                        "Personal Details",
                                        style:
                                            new TextStyle(color: Colors.purple),
                                      ),
                                    ),
                                    flex: 1,
                                  ),
                                  new IconButton(
                                      icon: new Icon(
                                        Icons.keyboard_arrow_up,
                                        color: Colors.purple,
                                      ),
                                      onPressed: () => {}),
                                ],
                              ),
                              new Divider(
                                thickness: 1.5,
                                color: Colors.indigo,
                              ),
                              new Container(
                                color: Colors.indigoAccent,
                                child: new Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: new Row(
                                    children: <Widget>[
                                      new Padding(
                                          padding: EdgeInsets.only(left: 10.0)),
                                      new Icon(
                                        Icons.info,
                                        color: Colors.indigo,
                                      ),
                                      new Padding(
                                          padding: EdgeInsets.only(left: 10.0)),
                                      new Expanded(
                                        child: new Text(
                                            "Personal details of the parent/spouse with the higher income group improves approval chances."),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              new Container(
                                margin:
                                    EdgeInsets.only(top: 30.0, bottom: 20.0),
                                child: new Form(
                                  child: new Column(
                                    children: <Widget>[
                                      new TextFormField(
                                        controller: _parentName,
                                        decoration: new InputDecoration(
                                            labelText: 'Parent Name'),
                                      ),
                                      new Padding(
                                          padding: EdgeInsets.only(top: 10.0)),
                                      new TextFormField(
                                        readOnly: true,
                                        controller: _date,
                                        // onTap: () => showDatePickerDialog(),
                                        onTap: () => _selectDate(context),
                                        decoration: new InputDecoration(
                                          labelText: 'Parent Date of Birth',
                                          suffixIconConstraints: BoxConstraints(
                                              minHeight: 24, minWidth: 24),
                                          suffixIcon: Icon(
                                              Icons.arrow_drop_down_sharp,
                                              color: Colors.black),
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please Select Date of Birth';
                                          }
                                          return null;
                                        },
                                      ),
                                      new Padding(
                                        padding: EdgeInsets.only(
                                            top: 20.0, bottom: 10.0),
                                        child: new Align(
                                          alignment: Alignment.centerLeft,
                                          child: new Text("Parent Gender"),
                                        ),
                                      ),
                                      new RadioGroup<String>.builder(
                                        groupValue: _patientGender,
                                        onChanged: (value) => setState(() {
                                          _patientGender = value;
                                        }),
                                        items: _genderList,
                                        itemBuilder: (item) =>
                                            RadioButtonBuilder(
                                          item,
                                        ),
                                        activeColor: Colors.indigo,
                                      ),
                                      new Padding(
                                        padding: EdgeInsets.only(
                                            top: 20.0, bottom: 10.0),
                                        child: new Align(
                                          alignment: Alignment.centerLeft,
                                          child: new Text("Material Status"),
                                        ),
                                      ),
                                      new RadioGroup<String>.builder(
                                        groupValue: _patientMaterial,
                                        onChanged: (value) => setState(() {
                                          _patientMaterial = value;
                                        }),
                                        items: _materialState,
                                        itemBuilder: (item) =>
                                            RadioButtonBuilder(
                                          item,
                                        ),
                                        activeColor: Colors.indigo,
                                      ),
                                      new Container(
                                          margin: EdgeInsets.only(left: 30.0),
                                          child: _patientMaterial == 'Others'
                                              ? new TextFormField(
                                                  controller: _other,
                                                  decoration: new InputDecoration(
                                                      // labelText: _patientMaterial,
                                                      hintText: "Please specific"),
                                                )
                                              : null),
                                      new Container(
                                        margin: EdgeInsets.all(20.0),
                                        child: new Align(
                                          alignment: Alignment.centerRight,
                                          child: new MaterialButton(
                                            onPressed: () => {validation()},
                                            child: new Padding(
                                              padding: EdgeInsets.only(
                                                  left: 20.0, right: 20.0),
                                              child: new Text(
                                                "Next",
                                                style: new TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            color: Colors.indigo,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        25.0)),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
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

  ///This method is to show Date picker dialog
  showDatePickerDialog() {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 300,
            // color: Colors.amber,
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0)),
              color: Colors.white,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text('Modal BottomSheet'),
                  ElevatedButton(
                    child: const Text('Close BottomSheet'),
                    onPressed: () => Navigator.pop(context),
                  )
                ],
              ),
            ),
          );
        });
  }

  ///This method is to validation all fields
  validation() {
    print('parentName: ${_parentName.text}');
    print('dateOFBirth: ${_date.text}');
    print('parentGender: $_patientGender');
    print('parentMaterialStatus: $_patientMaterial');
    print('other: ${_other.text}');

    if (_parentName.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Please Enter Parent Name'),
      ));
    } else if (_date.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Please Select Parent Date of Birth'),
      ));
    } else if (_patientGender.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Please Select Parent Gender'),
      ));
    } else if (_patientMaterial.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Please Select Parent Material Status'),
      ));
    } else if (_patientMaterial == 'Others' && _other.text.isEmpty) {
      _patientMaterial = _other.text;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Please Enter Specific Material Status'),
      ));
    } else {
      saveApplication();
    }
  }

  ///This method is to insert application into database
  void saveApplication() async {
    DateTime now = DateTime.now();
    String currentDate = DateFormat('yyyy-MM-dd | hh:mm:ss').format(now);
    print('current date - $currentDate');

    // row to insert
    Map<String, dynamic> row = {
      ApplicationFields.institute_vib: instituteVib,
      ApplicationFields.branch: branch,
      ApplicationFields.unique_id: uniqueId,
      ApplicationFields.has_unique_id: hasUnique,
      ApplicationFields.parent_name: _parentName.text,
      ApplicationFields.date_of_birth: _date.text,
      ApplicationFields.gender: _patientGender,
      ApplicationFields.maritial_status: _patientMaterial,
      ApplicationFields.created_on: currentDate,
    };
    final id = await dbHelper.insert(row);

    if (id > 0) {
      alertDialog(context);
    }

    print('inserted row id: $id');
  }

  ///This method is to show successfully saved details dialog
  Future<bool> alertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Done'),
            content: Text('Add Success'),
            actions: <Widget>[
              TextButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Dashboard()),
                      (route) => false);
                },
              ),
            ],
          );
        });
  }
}
