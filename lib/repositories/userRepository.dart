import 'dart:convert';

import 'package:ecommerce_app/models/resultModels.dart';
import 'package:ecommerce_app/models/userModel.dart';
import 'package:ecommerce_app/service/apiService.dart';

class UserRepository{
  static APIService<UserModel> getLogin(url){
    return APIService(
      url: url,
      parse: (response){
        final parsed = json.decode(response.body);
        final dataJson = ResultModel.fromJSON(parsed);

        return UserModel.fromJSON(dataJson.responsedata.first);
      }
    );
  }
}