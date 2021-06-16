import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grayquest/institute.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'personal_details.dart';

class StudentDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StudentDetailsState();
  }
}

class StudentDetailsState extends State<StudentDetails> {
  String instituteVib;
  TextEditingController _branch = TextEditingController();
  TextEditingController _instituteId = TextEditingController();
  String instituteID;
  String hasUnique;

  List<Institute> institute = [
    Institute(
        id: 101,
        school_name: "Dhirubhai Ambani International School",
        location: "Bandra Kurla Complex, Bandra East",
        board: "Maharashtra"),
    Institute(
        id: 102,
        school_name: "St. Mary's High School",
        location: "Mazgaon, Mumbai, Maharashtra",
        board: "Maharashtra"),
    Institute(
        id: 103,
        school_name: "B.D. Somani International School",
        location: "Cuffe Parade, Mumbai, Maharashtra",
        board: "CBSE"),
    Institute(
        id: 104,
        school_name: "The JB Petit High School for Girls",
        location: "Fort, Mumbai, Maharashtra",
        board: "Mumbai"),
    Institute(
        id: 105,
        school_name: "Bunts Sangha's S M Shetty School",
        location: "Powai, Mumbai, Maharashtra",
        board: "CBSE"),
    Institute(
        id: 106,
        school_name: "NSS Hill Spring International School",
        location: "Tardeo, Mumbai, Maharashtra",
        board: "CBSE"),
    Institute(
        id: 107,
        school_name: "Shishuvan School",
        location: "Matunga, Mumbai, Maharashtra",
        board: "CBSE"),
  ];

  List<String> _schoolName = [
    "Vibgyor group of schools",
    "My company is not listed here"
  ];

  @override
  void initState() {
    instituteVib = null;
    hasUnique = "yes";
    instituteID = null;
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
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: new Center(
                            child: new Text(
                              "1",
                              style: new TextStyle(
                                color: Colors.indigo,
                              ),
                            ),
                          ),
                        ),
                        new Expanded(
                          child: new Container(
                            margin:
                                const EdgeInsets.only(left: 10.0, right: 15.0),
                            child: Divider(
                              color: Colors.white,
                              height: 50,
                            ),
                          ),
                          flex: 1,
                        ),
                        new Container(
                          width: 30.0,
                          height: 30.0,
                          decoration: new BoxDecoration(
                            // color: Colors.white,
                            shape: BoxShape.circle,
                            // borderRadius: BorderRadius.all(Radius.circular(1)),
                            border: Border.all(
                                width: 1, color: Colors.purpleAccent),
                          ),
                          child: new Center(
                            child: new Text(
                              "2",
                              style: new TextStyle(
                                color: Colors.purpleAccent,
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
                            // color: Colors.white,
                            shape: BoxShape.circle,
                            // borderRadius: BorderRadius.all(Radius.circular(1)),
                            border: Border.all(
                                width: 1, color: Colors.purpleAccent),
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
                    new Padding(
                      padding: EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 20.0, bottom: 20.0),
                      child: new Text(
                        "Complete the steps below to Check your eligibility",
                        style:
                            new TextStyle(fontSize: 20.0, color: Colors.black),
                      ),
                    ),
                    new Container(
                      margin: EdgeInsets.only(left: 15.0, right: 15.0),
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
                                        "Educational Institute Details",
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
                                margin:
                                    EdgeInsets.only(top: 10.0, bottom: 20.0),
                                child: new Align(
                                  alignment: Alignment.centerLeft,
                                  child: new Text(
                                    "Select Institute",
                                    style: new TextStyle(
                                        fontSize: 16.0, color: Colors.black45),
                                  ),
                                ),
                              ),
                              new Padding(
                                padding: EdgeInsets.only(bottom: 10.0),
                                child: new Align(
                                  alignment: Alignment.centerLeft,
                                  child: new Text("Vib"),
                                ),
                              ),
                              new RadioGroup<String>.builder(
                                groupValue: instituteVib,
                                onChanged: (value) => setState(() {
                                  instituteVib = value;
                                }),
                                items: _schoolName,
                                itemBuilder: (item) => RadioButtonBuilder(
                                  item,
                                ),
                                activeColor: Colors.indigo,
                              ),
                              new TextFormField(
                                readOnly: true,
                                controller: _branch,
                                // onTap: () => showDatePickerDialog(),
                                onTap: () => instituteDialog(),
                                decoration: new InputDecoration(
                                  labelText: 'Select branch',
                                  suffixIconConstraints: BoxConstraints(
                                      minHeight: 24, minWidth: 24),
                                  suffixIcon: Icon(Icons.arrow_drop_down_sharp,
                                      color: Colors.black),
                                ),
                              ),
                              new Padding(
                                padding:
                                    EdgeInsets.only(top: 10.0, bottom: 10.0),
                                child: new TextFormField(
                                  controller: _instituteId,
                                  decoration: new InputDecoration(
                                      labelText: 'Institute Unique ID'),
                                ),
                              ),
                              new Padding(
                                padding:
                                    EdgeInsets.only(top: 10.0, bottom: 10.0),
                                child: new Text(
                                  "Unique ID helps us to auto fill the below details for you.",
                                  style:
                                      new TextStyle(color: Colors.deepPurple),
                                ),
                              ),
                              new Align(
                                alignment: Alignment.centerLeft,
                                child: new Row(
                                  children: <Widget>[
                                    new Radio(
                                      value: "no",
                                      activeColor: Colors.indigo,
                                      groupValue: hasUnique,
                                      onChanged: (value) => setState(() {
                                        hasUnique = value;
                                        print(hasUnique);
                                      }),
                                    ),
                                    new GestureDetector(
                                      child: new Text(
                                          "I do not have my child's school unique ID"),
                                      onTap: () => setState(() {
                                        hasUnique = "no";
                                        print(hasUnique);
                                      }),
                                    ),
                                  ],
                                ),
                              ),
                              new Align(
                                alignment: FractionalOffset.bottomCenter,
                                child: new Container(
                                  margin: EdgeInsets.only(
                                      bottom: 20.0, left: 15.0, right: 15.0),
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
                                              BorderRadius.circular(25.0)),
                                    ),
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

  instituteDialog() {
    showModalBottomSheet<void>(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        builder: (BuildContext context) {
          return Container(
            height: 500,
            // color: Colors.amber,
            child: new Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                new Card(
                  elevation: 5,
                  child: new Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: new Row(
                      children: <Widget>[
                        new Expanded(
                          child: new Container(
                            margin: EdgeInsets.only(left: 10.0),
                            child: new Align(
                              alignment: Alignment.centerLeft,
                              child: new Text("School Name"),
                            ),
                          ),
                          flex: 2,
                        ),
                        new Expanded(
                          child: new Align(
                            alignment: Alignment.centerLeft,
                              child: new Text(
                                  "Location"
                              ),
                          ),
                          flex: 2,
                        ),
                        new Expanded(
                          child: new Container(
                            margin:  EdgeInsets.only(right: 10.0),
                            child: new Align(
                              alignment: Alignment.centerRight,
                              child: new Text("Board"),
                            ),
                          ),
                          flex: 1,
                        ),
                      ],
                    ),
                  ),
                ),
                new Expanded(
                  child: new ListView.builder(
                    shrinkWrap: true,
                      itemCount: institute.length,
                      itemBuilder: (context, index) {
                        return new Container(
                          margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                          child: new Column(
                            children: <Widget>[
                              new GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _branch.text = institute[index].school_name;
                                    Navigator.pop(context);
                                  });
                                },
                                child: new Row(
                                  children: <Widget>[
                                    new Expanded(
                                      child: new Padding(
                                        padding: EdgeInsets.only(left: 10.0),
                                        child: new Text(
                                            institute[index].school_name),
                                      ),
                                      flex: 2,
                                    ),
                                    new Expanded(
                                      child: new Text(institute[index].location),
                                      flex: 2,
                                    ),
                                    new Expanded(
                                      child: new Padding(
                                        padding: EdgeInsets.only(right: 10.0),
                                        child: new Text(institute[index].board),
                                      ),
                                      flex: 1,
                                    ),
                                  ],
                                ),
                              ),
                              new Padding(padding: EdgeInsets.only(top: 10.0)),
                              new Divider(
                                color: Colors.indigo,
                              )
                            ],
                          ),
                        );
                      }),
                ),
              ],
            ),
          );
        });
  }

  ///This method is to validate all fields
  validation() {
    instituteID = _instituteId.text;

    print('Institute Vid $instituteVib');
    print('Selected Branch ${_branch.text}');
    print('Unique ID $instituteID');
    print('Unique ID ${_instituteId.text.isEmpty}');
    print('has Unique ID $hasUnique');

    if (instituteVib == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Please Select Institute'),
      ));
    } else if (_branch.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Please Select Branch'),
      ));
    } else if (hasUnique == "yes" && _instituteId.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Please Enter Institute Unique ID'),
      ));
    } else {
      saveDetails();
    }
  }

  ///This method is to save student details and navigate to Personal details Screen
  saveDetails() {
    print('Institute Vib $instituteVib');
    print('Selected Branch ${_branch.text}');
    print('Unique ID $instituteID');
    print('has Unique ID $hasUnique');
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => PersonalDetails(
                instituteVib, _branch.text, hasUnique,
                uniqueID: instituteID)));
  }
}
