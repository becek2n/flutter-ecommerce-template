
import 'dart:convert';

import 'package:ecommerce_app/constants.dart';
import 'package:http/http.dart' as http;

class APIService<T>{
  final String url;
  final dynamic body;
  T Function(http.Response response) parse;
  
  APIService({this.url, this.body, this.parse});
}

class APIWeb{
  //get method
  Future<T> load<T>(APIService<T> resource) async {
    final response = await http.get(apiUrl + resource.url);
    if(response.statusCode == 200){
      return resource.parse(response);
    }else{
      throw Exception(response.statusCode);
    }
  }

  //post method
  Future<T> post<T>(APIService<T> resource) async {
    Map<String, String> header = {
      "Content-Type": "application/json"
    };

    final response = await http.post(apiUrl + resource.url, body: jsonEncode(resource.body), headers: header);
    if(response.statusCode == 200){
      return resource.parse(response);
    }else{
      throw Exception(response.statusCode);
    }
  }

}