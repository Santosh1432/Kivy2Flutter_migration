import 'package:http/http.dart' as http;


Future <String>validate(String UserName_Value,String Password_value ) async{
  final String url="http://3.16.36.128/api/token/";
  Map<String, String> headers = {"Content-type": "application/json"};
  String json = '{"username": UserName_Value, "password": Password_value}';

  final  response = await http.post(url, headers: headers, body: json);
  if(response.statusCode==201){
    final String bodyVal=response.body;
    //String access_key=bodyVal.access
    print(bodyVal);
    return bodyVal;
  }
  else{
    return "";
  }
}



// Future Submit(String UserName_Value,String Password_value ) async{
//   if(UserName_Value==''){
//     return "Please Enter User Name";
//   }else if(Password_value==''){
//     return "Please Enter Password";
//   }
//   return "";
// }