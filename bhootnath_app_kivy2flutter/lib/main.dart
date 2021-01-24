import 'package:flutter/material.dart';
import "Request.dart";
import "SubmitFile.dart";

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
TextEditingController Username = new TextEditingController();
TextEditingController Password = new TextEditingController();
class _MyHomePageState extends State<MyHomePage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);


  @override
  Widget build(BuildContext context) {
    final emailField = TextField(
      controller: Username,
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "User Name",
          border:

          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final passwordField = TextField(
      controller: Password,
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          if(Username.text==""){
            Future.delayed(Duration.zero, () => showAlert(context));
          }else{
            String body= validate(Username.text,Password.text) as String;
            if(body.length >0 ){
              Navigator.push(
                  context,MaterialPageRoute(builder: (context) => NextPage()));
            }else{

            }
        }},
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
                // SizedBox(
                //   height: 101.0,
                //   child: Image.asset(
                //     "assets/logo.png",
                //     fit: BoxFit.contain,
                //   ),
                // ),
                SizedBox(height: 35.0),
                emailField,
                SizedBox(height: 15.0),
                passwordField,
                SizedBox(
                  height: 25.0,
                ),
                loginButon,
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


void showAlert(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text("Enter username"),
      ));
}


// class NextPage extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("BhootNath submit page"),
//       ),
//       body: Center(
//         child: Column(
//           children: <Widget>[
//             MaterialButton(
//               child: Text("Go Back!"),
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               color: Colors.red,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
