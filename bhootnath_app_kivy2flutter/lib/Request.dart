import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import "globals.dart" as global;
import 'dart:convert';
import "SubmitFile.dart";
import 'main.dart';

 void validate(BuildContext context,String UserName_Value,String Password_value ) async {

  final http.Response response = await http.post(
    'http://3.16.36.128/api/token/',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'username': "admin",
      'password':Password_value,
    }),
  );


  if(response.statusCode==200){
    Map <String ,dynamic> dartbody =jsonDecode(response.body);
   //print(jsonDecode(response.body));
    global.access_token=dartbody["access"];
    Navigator.push(
       context,MaterialPageRoute(builder: (context) => NextPage()));

  }
  else {
    Future.delayed(Duration.zero, () => showAlertDialog(context,"Error while Login"));
    //print(jsonDecode(response.body));
  }
}



