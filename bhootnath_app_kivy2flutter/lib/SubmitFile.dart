
import 'package:flutter/material.dart';

class NextPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BhootNath submit page"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            MaterialButton(
              child: Text("Go Back!"),
              onPressed: () {
                Navigator.pop(context);
              },
              color: Colors.red,
            )
          ],
        ),
      ),
    );
  }
}
