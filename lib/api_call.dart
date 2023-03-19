import 'dart:convert';

import 'package:home_test/api_modal.dart';
import'package:http/http.dart' as http ;

Future<ApiCalling> fetchUserData() async{
  final response = await http.get(Uri.parse("https://reqres.in/api/users?page=2"));
  if(response.statusCode == 200)
  // If the server did return a 200 OK response,
    // then parse the JSON.
  {
    return ApiCalling.fromJson(jsonDecode(response.body));

  }
  else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed To load Data');
    
  }
  
}