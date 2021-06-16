import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'student_details.dart';
import 'modal_application.dart';
import 'database_helper.dart';

class Dashboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DashboardState();
  }
}

class DashboardState extends State<Dashboard> {
  List<ApplicationList> application = [];
  final dbHelper = DatabaseHelper.instance;

  @override
  void initState() {
    print('length Application - ${application.length}');
    super.initState();
  }

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
              child: new Align(
                alignment: Alignment.centerLeft,
                child: new Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: new Text(
                    "Dashboard",
                    style: new TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ),
              ),
            ),
            new Flexible(
              child: new Container(
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0)),
                  color: Color(0xFFC5CAE9),
                ),
                child: new Column(
                  children: <Widget>[
                    new Flexible(
                      child: new ListView(
                        children: <Widget>[
                          new Container(
                            margin: EdgeInsets.only(
                                top: 20.0,
                                left: 10.0,
                                right: 10.0,
                                bottom: 10.0),
                            child: new Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 15,
                              child: new Container(
                                margin: EdgeInsets.only(top: 10.0),
                                child: new Align(
                                  alignment: Alignment.center,
                                  child: new Column(
                                    children: <Widget>[
                                      new Padding(
                                        padding: EdgeInsets.all(20.0),
                                        child: new Text(
                                          "Create New Application",
                                          style: new TextStyle(
                                              fontSize: 16.0,
                                              color: Colors.indigo),
                                        ),
                                      ),
                                      new GestureDetector(
                                        child: new Image(
                                          image:
                                              new AssetImage("assets/add.png"),
                                          height: 60.0,
                                        ),
                                        onTap: () => {
                                          studentDetailsScreen(),
                                          // saveApplication()
                                        },
                                      ),
                                      new Padding(
                                          padding: EdgeInsets.all(10.0)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          new Container(
                              child: new FutureBuilder(
                                  future: _getAllApplications(),
                                  builder: (context, AsyncSnapshot snapshot) {
                                    if (!snapshot.hasData) {
                                      return Center(
                                          child: CircularProgressIndicator());
                                    } else {
                                      return new ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemCount: application.length,
                                          itemBuilder: (context, index) {
                                            return new Container(
                                              margin: EdgeInsets.only(
                                                  left: 10.0,
                                                  right: 10.0,
                                                  bottom: 10.0),
                                              child: new Card(
                                                elevation: 15,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: new Container(
                                                  margin: EdgeInsets.only(
                                                      top: 10.0),
                                                  child: new Column(
                                                    children: <Widget>[
                                                      new Padding(
                                                        padding: EdgeInsets.all(
                                                            20.0),
                                                        child: new Image(
                                                          image: new AssetImage(
                                                              "assets/icon.png"),
                                                          height: 60.0,
                                                        ),
                                                      ),
                                                      new Container(
                                                        margin: EdgeInsets.only(
                                                            left: 10.0,
                                                            right: 10.0,
                                                            top: 10.0,
                                                            bottom: 5.0),
                                                        child: new Row(
                                                          children: <Widget>[
                                                            new Expanded(
                                                              child: new Text(
                                                                "Application ID",
                                                                style: new TextStyle(
                                                                    fontSize:
                                                                        16.0,
                                                                    color: Colors
                                                                        .black),
                                                              ),
                                                              flex: 1,
                                                            ),
                                                            new Expanded(
                                                              child: new Text(
                                                                '${application[index].id}',
                                                                style: new TextStyle(
                                                                    fontSize:
                                                                        16.0,
                                                                    color: Colors
                                                                        .black),
                                                              ),
                                                              flex: 1,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      new Container(
                                                        margin: EdgeInsets.only(
                                                            left: 10.0,
                                                            right: 10.0,
                                                            top: 10.0,
                                                            bottom: 5.0),
                                                        child: new Row(
                                                          children: <Widget>[
                                                            new Expanded(
                                                              child: new Text(
                                                                "Created On",
                                                                style: new TextStyle(
                                                                    fontSize:
                                                                        16.0,
                                                                    color: Colors
                                                                        .black),
                                                              ),
                                                              flex: 1,
                                                            ),
                                                            new Expanded(
                                                              child: new Text(
                                                                application[
                                                                        index]
                                                                    .created_on,
                                                                style: new TextStyle(
                                                                    fontSize:
                                                                        16.0,
                                                                    color: Colors
                                                                        .black),
                                                              ),
                                                              flex: 1,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      new Container(
                                                        margin: EdgeInsets.only(
                                                            left: 10.0,
                                                            right: 10.0,
                                                            top: 10.0,
                                                            bottom: 5.0),
                                                        child: new Row(
                                                          children: <Widget>[
                                                            new Expanded(
                                                              child: new Text(
                                                                "Parent Name",
                                                                style: new TextStyle(
                                                                    fontSize:
                                                                        16.0,
                                                                    color: Colors
                                                                        .black),
                                                              ),
                                                              flex: 1,
                                                            ),
                                                            new Expanded(
                                                              child: new Text(
                                                                application[
                                                                        index]
                                                                    .parent_name,
                                                                style: new TextStyle(
                                                                    fontSize:
                                                                        16.0,
                                                                    color: Colors
                                                                        .black),
                                                              ),
                                                              flex: 1,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      new Container(
                                                        margin: EdgeInsets.only(
                                                            left: 10.0,
                                                            right: 10.0,
                                                            top: 10.0,
                                                            bottom: 5.0),
                                                        child: new Row(
                                                          children: <Widget>[
                                                            new Expanded(
                                                              child: new Text(
                                                                "Branch",
                                                                style: new TextStyle(
                                                                    fontSize:
                                                                        16.0,
                                                                    color: Colors
                                                                        .black),
                                                              ),
                                                              flex: 1,
                                                            ),
                                                            new Expanded(
                                                              child: new Text(
                                                                application[
                                                                        index]
                                                                    .branch,
                                                                style: new TextStyle(
                                                                    fontSize:
                                                                        16.0,
                                                                    color: Colors
                                                                        .black),
                                                              ),
                                                              flex: 1,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      new Container(
                                                        margin: EdgeInsets.only(
                                                            left: 10.0,
                                                            right: 10.0,
                                                            top: 10.0,
                                                            bottom: 5.0),
                                                        child: new Row(
                                                          children: <Widget>[
                                                            new Expanded(
                                                              child: new Text(
                                                                "Loan Amount",
                                                                style: new TextStyle(
                                                                    fontSize:
                                                                        16.0,
                                                                    color: Colors
                                                                        .black),
                                                              ),
                                                              flex: 1,
                                                            ),
                                                            new Expanded(
                                                              child: new Text(
                                                                "1,20,000",
                                                                style: new TextStyle(
                                                                    fontSize:
                                                                        16.0,
                                                                    color: Colors
                                                                        .black),
                                                              ),
                                                              flex: 1,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      new Container(
                                                        margin: EdgeInsets.only(
                                                            left: 10.0,
                                                            right: 10.0,
                                                            top: 10.0,
                                                            bottom: 5.0),
                                                        child: new Row(
                                                          children: <Widget>[
                                                            new Expanded(
                                                              child: new Text(
                                                                "Status",
                                                                style: new TextStyle(
                                                                    fontSize:
                                                                        16.0,
                                                                    color: Colors
                                                                        .black),
                                                              ),
                                                              flex: 1,
                                                            ),
                                                            new Expanded(
                                                              child:
                                                                  new Container(
                                                                color: Colors
                                                                    .greenAccent,
                                                                child:
                                                                    new Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              3.0),
                                                                  child:
                                                                      new Text(
                                                                    "Payment under progress",
                                                                    style: new TextStyle(
                                                                        fontSize:
                                                                            14.0,
                                                                        color: Colors
                                                                            .black),
                                                                  ),
                                                                ),
                                                              ),
                                                              flex: 1,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      new Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  5.0)),
                                                      new Divider(
                                                        color: Colors.purple,
                                                        height: 2.0,
                                                      ),
                                                      new Container(
                                                          color:
                                                              Color(0xFFB39DDB),
                                                          child: new Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    10.0),
                                                            child: new Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: <
                                                                  Widget>[
                                                                new Text(
                                                                  "View Application",
                                                                  style: new TextStyle(
                                                                      fontSize:
                                                                          18.0,
                                                                      color: Colors
                                                                          .deepPurple),
                                                                ),
                                                                new Padding(
                                                                    padding: EdgeInsets.only(
                                                                        left:
                                                                            5.0,
                                                                        right:
                                                                            5.0)),
                                                                new Icon(
                                                                  Icons
                                                                      .double_arrow,
                                                                  color: Colors
                                                                      .deepPurple,
                                                                ),
                                                              ],
                                                            ),
                                                          )),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          });
                                    }
                                  })),
                        ],
                      ),
                      flex: 1,
                    ),
                    new Container(
                      height: 60.0,
                      decoration: new BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0)),
                        color: Colors.white,
                      ),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Expanded(
                            child: new Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Icon(
                                  Icons.home_filled,
                                  color: Colors.indigo,
                                ),
                                new Text(
                                  "Home",
                                  style: new TextStyle(
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ],
                            ),
                            flex: 1,
                          ),
                          new Expanded(
                            child: new Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Icon(
                                  Icons.notifications_none,
                                ),
                                new Text("Notifications")
                              ],
                            ),
                            flex: 1,
                          ),
                          new Expanded(
                            child: new Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Icon(
                                  Icons.star,
                                ),
                                new Text("Membership")
                              ],
                            ),
                            flex: 1,
                          ),
                          new Expanded(
                            child: new Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Icon(
                                  Icons.more_horiz,
                                ),
                                new Text("More")
                              ],
                            ),
                            flex: 1,
                          ),
                        ],
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

  ///This method is to navigate from Dashboard to Student details form page
  studentDetailsScreen() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => StudentDetails()));
    // Navigator.push(context, MaterialPageRoute(builder: (context)=>PersonalDetails()));
  }

  ///This method is to get all saved application from Database
  _getAllApplications() async {
    application.clear();
    final allRows = await dbHelper.queryAllRows();
    for (int i = 0; i < allRows.length; i++) {
      print('student name ${allRows[i][ApplicationFields.id]}');

      application.add(ApplicationList(
          allRows[i][ApplicationFields.id],
          allRows[i][ApplicationFields.institute_vib],
          allRows[i][ApplicationFields.branch],
          allRows[i][ApplicationFields.unique_id],
          allRows[i][ApplicationFields.has_unique_id],
          allRows[i][ApplicationFields.parent_name],
          allRows[i][ApplicationFields.date_of_birth],
          allRows[i][ApplicationFields.gender],
          allRows[i][ApplicationFields.maritial_status],
          allRows[i][ApplicationFields.created_on]));
    }
    print('query all rows:${application.length}');
    allRows.forEach(print);

    return application;
  }
}
