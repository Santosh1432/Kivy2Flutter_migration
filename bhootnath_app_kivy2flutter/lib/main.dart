import 'package:flutter/material.dart';
import "Request.dart";


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: MyHomePage(title: 'BhootNath Result Publish Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

TextEditingController username = new TextEditingController();
TextEditingController password = new TextEditingController();
TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    final emailField = TextField(
      controller: username,
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "User Name",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final passwordField = TextField(
      controller: password,
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final loginbuton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          if (username.text == "") {
            Future.delayed(Duration.zero, () => showAlertDialog(context,"Please Enter UserName"));
          } else if(password.text==""){
            Future.delayed(Duration.zero, () => showAlertDialog(context,"Please Enter Password"));
          } else{
            validate(context, username.text, password.text);
          }
        },
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 35.0),
                emailField,
                SizedBox(height: 15.0),
                passwordField,
                SizedBox(
                  height: 25.0,
                ),
                loginbuton,
                SizedBox(
                  height: 15.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context,String msg) {

  // set up the button
  Widget okButton = TextButton(
    child: Text("OK"),
    style: TextButton.styleFrom(
      primary: Colors.teal,
    ),
    onPressed: () {Navigator.pop(context); },
  );
  AlertDialog alert = AlertDialog(
    title: Text("Alert"),
    content: Text(msg),
    actions: [
      okButton,
    ],
  );
  showDialog(
    context: context,

    builder: (context) {
      return alert;
    },
  );
  // set up the AlertDialog
  //  CustomAlert.showCustomDialog(context,title: "Alert",okBtnText: "Save",
  //    cancelBtnText: "Cancel",
  //      okBtnFunction :()=>Navigator.pop(context));
  // show the dialog

}
