import 'package:flutter/material.dart';


showAlertDialog(BuildContext context,String msg) {
  TextStyle AlertStyle = TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.black,
      //backgroundColor: Colors.red,
      fontSize: 20.0,
      fontFamily: 'Raleway',);
  // set up the button
  Widget okButton = TextButton(
    child: Text("OK"),
    style: TextButton.styleFrom(
      primary: Colors.black,
    ),
    onPressed: () {Navigator.pop(context); },
  );
  AlertDialog alert = AlertDialog(
    title: Text("Alert ! ",style: AlertStyle,),
    content: Text(msg,style: AlertStyle,),
    actions: [
      okButton,
    ],
  );
  showDialog(
    context: context,

    builder: (context) {
      // threedigit.clear();
      //Single_digit_string="";
      return alert;
    },
  );

}
