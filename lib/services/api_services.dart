import 'dart:convert';

import 'package:bloc_api_cubit/model/user_information_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  List<UserInformation> userdata=[];
  Future<List<UserInformation>?> getData() async {
    try {
      var request = http.Request(
          'Get', Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      http.StreamedResponse response =await request.send();

      if(response.statusCode==200){
        var rowData=await response.stream.bytesToString();
        var data=jsonDecode(rowData);
        data.forEach((e){
          var information=UserInformation.fromJson(e);
          userdata.add(information);


        });
        return userdata;
      }else{
       return [];
      }
    } catch (e) {}
  }
}
