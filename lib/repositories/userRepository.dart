import 'dart:convert';

import 'package:ecommerce_app/models/resultModels.dart';
import 'package:ecommerce_app/models/userModel.dart';
import 'package:ecommerce_app/service/apiService.dart';

class UserRepository{
  static APIService<UserModel> post(url, dynamic body){
    return APIService(
      url: url,
      body: body,
      parse: (response){
        final parsed = json.decode(response.body);
        final dataJson = ResultModel.fromJSON(parsed);

        return UserModel.fromJSON(dataJson.responsedata);
      }
    );
  }
}