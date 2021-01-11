import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/models/userModel.dart';
import 'package:ecommerce_app/repositories/userRepository.dart';
import 'package:ecommerce_app/service/apiService.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState>{

  void onLogin(String user, String password){
    dispatch(LoginEvent(user: user, password: password));
  }

  void onLogOut(){
    dispatch(LogOutEvent());
  }

  void onCheckLogin(){
    dispatch(CheckLoginEvent());
  }

  @override
  AuthenticationState get initialState => AuthenticationState.initial();

  SharedPreferences sharedPreferences;
  @override
  Stream<AuthenticationState> mapEventToState(AuthenticationEvent event) async* {
    if(event is LoginEvent){
      try{
        yield LoadingState();
        //give a delay for loading
        await Future.delayed(const Duration(seconds: 3));
        //execute api
        var url = "login";
        Map<String, dynamic> jsonBody = {
          'email': event.user.trim().toString(),
          'password': event.password.trim().toString(),
        };
        final data = await APIWeb().post(UserRepository.post(url, jsonBody));
        //retrieve data
        yield AuthenticationState(userModel: data);
      }catch(e){
        yield GetFailureState(e.toString());
      }
    }

    //check status login
    else if (event is CheckLoginEvent){
      //check shared info
      sharedPreferences = await SharedPreferences.getInstance();
      var data = sharedPreferences.get("idUser");
      if(data != null){
        yield LoggedInState();
      }else{
        yield LoggedOutState();
      }
    }

    //logout event
    else if(event is LogOutEvent){
      sharedPreferences = await SharedPreferences.getInstance();
      await sharedPreferences.clear();
      yield LoggedOutState();
    }
  }

}

//event
class AuthenticationEvent{}

class LoginEvent extends AuthenticationEvent{
  final String user;
  final String password;

  LoginEvent({this.user, this.password});
}

class LogOutEvent extends AuthenticationEvent{}
class CheckLoginEvent extends AuthenticationEvent{}

//state
class AuthenticationState{
  final UserModel userModel;

  const AuthenticationState({this.userModel});

  factory AuthenticationState.initial() => AuthenticationState();
}

class GetFailureState extends AuthenticationState{
  final String error;

  GetFailureState(this.error);
}

class LoggedInState extends AuthenticationState{}
class LoggedOutState extends AuthenticationState{}
class LoadingState extends AuthenticationState{}
