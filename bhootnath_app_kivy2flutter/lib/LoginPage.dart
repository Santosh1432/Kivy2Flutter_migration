import 'package:flutter/material.dart';
import "ShowAlertDialog.dart";
import "Request.dart";

TextEditingController username = new TextEditingController();
TextEditingController password = new TextEditingController();
TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

class LoginPage extends StatelessWidget {
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
            Future.delayed(Duration.zero,
                () => showAlertDialog(context, "Please Enter UserName"));
          } else if (password.text == "") {
            Future.delayed(Duration.zero,
                () => showAlertDialog(context, "Please Enter Password"));
          } else {
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
        title: Text(
          "BhootNath Result Publish Page",
          textAlign: TextAlign.center,
        ),
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
                new Text(
                  "Bhootnath Result App - only for Admin",
                  textAlign: TextAlign.center,
                  style: style.copyWith(
                     // backgroundColor: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 25,
                      fontStyle: FontStyle.italic,

                          ),
                ),
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
