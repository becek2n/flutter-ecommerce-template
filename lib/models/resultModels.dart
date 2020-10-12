import 'dart:convert';

class ResultModel{
  final int responsecode;
  final String responsemessage;
  final List responsedata;

  ResultModel({this.responsecode, this.responsemessage, this.responsedata});

  //mapping json data
  factory ResultModel.fromJSON(Map<String, dynamic> jsonMap){
    var list = jsonMap["responseData"] as List;
    final data = ResultModel(
      responsecode: jsonMap["responseCode"],
      responsemessage: jsonMap["responseMessage"],
      responsedata: list
    );
    return data;
  }
}