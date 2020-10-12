import 'package:ecommerce_app/models/userModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedInfo{
  SharedPreferences sharedPreferences;
  
  //save info logged in to shared preferences
  void sharedLoginSave(UserModel userModel) async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt("idUser", userModel.id);
    sharedPreferences.setString("userName", userModel.userName);
  }
}