import 'package:ecommerce_app/bloc/authenticationBloc.dart';
import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/screen/components.dart';
import 'package:ecommerce_app/screen/forgotpassword.dart';
import 'package:ecommerce_app/screen/mainmenu.dart';
import 'package:ecommerce_app/sharedInfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var _formKey = GlobalKey<FormState>();
  final textControllerEmail = TextEditingController(),
    textControllerPassword = TextEditingController();

  bool bCheckEmail = false;
  bool bCheckPassword = false;

  final authBloc = AuthenticationBloc();
  final sharedInfo = SharedInfo();

  //loading widget
  void loadingDialog(BuildContext context){
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context){
        return CupertinoAlertDialog(
          title: Text("Loading..."),
          content: CupertinoActivityIndicator(radius: 15,),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: authBloc,
      listener: (context, AuthenticationState state){
        if(state.userModel != null && state is AuthenticationState){
          //dismis loading widget
          Navigator.of(context, rootNavigator: true).pop();
          //save user to shared info
          sharedInfo.sharedLoginSave(state.userModel);
          // go to main menu
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => 
            MainMenuScreen()
          ));
          
        }else if (state is LoadingState){
          //show loading
          WidgetsBinding.instance.addPostFrameCallback((_) => loadingDialog(context)); 
        }
      },
      child: Scaffold(
        backgroundColor: cModeDark,
        appBar: AppBar(
          backgroundColor: cModeDark,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.of(context).pop(),
          ),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Login", style: TextStyle(color: cModeDarkColorFontTitle, fontSize: cSizeTextHeader, fontWeight: FontWeight.bold),),
                SizedBox(height: 40,),
                Form(
                  key: _formKey,
                  autovalidate: true,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: cModeDarkColorTextBox,
                          borderRadius: BorderRadius.all(Radius.circular(5))
                        ),
                        child: Stack(
                          children: [
                            TextFormField(
                              controller: textControllerEmail,
                              style: TextStyle(color: cModeDarkColorFontTitle),
                              cursorColor: cModeDarkColorFontTitle,
                              decoration: InputDecoration(
                                focusColor: cModeDarkColorFontTitle,
                                labelText: "Email",
                                labelStyle: TextStyle(color: cModeDarkColorTextBoxLabel),
                                contentPadding: EdgeInsets.all(10.0),
                                fillColor: cModeDarkColorFontTitle,
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.transparent)
                                ),
                              ),
                              keyboardType: TextInputType.emailAddress,
                              validator: validateEmail,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * .85, top:13),
                                  child: iconCheckEmail(),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 5.0,),
                      Container(
                        decoration: BoxDecoration(
                          color: cModeDarkColorTextBox,
                          borderRadius: BorderRadius.all(Radius.circular(5))
                        ),
                        child: Stack(
                          children: [
                            TextFormField(
                              controller: textControllerPassword,
                              style: TextStyle(color: cModeDarkColorFontTitle),
                              cursorColor: cModeDarkColorFontTitle,
                              decoration: InputDecoration(
                                focusColor: cModeDarkColorFontTitle,
                                labelText: "Password",
                                labelStyle: TextStyle(color: cModeDarkColorTextBoxLabel),
                                contentPadding: EdgeInsets.all(10.0),
                                fillColor: cModeDarkColorFontTitle,
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.transparent)
                                ),
                              ),
                              keyboardType: TextInputType.visiblePassword,
                              validator: validatePassword,
                              obscureText: true,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * .85, top:13),
                                  child: iconCheckPassword(),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Forgot your password?", style: TextStyle(color: cModeDarkColorFontTitle)),
                    InkWell(
                      child: Image.asset("assets/arrow-right.png"),
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => new ForgotPasswordScreen()));
                      },
                    )
                  ],
                ),
                SizedBox(height: 20,),
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: RaisedButton(
                      onPressed: (){
                        //add event click 
                        authBloc.onLogin(textControllerEmail.text, textControllerPassword.text);
                      },
                      child: Text("LOGIN"),
                      color: cModeDarkColorButtom,
                      textColor: cModeDarkColorButtonText,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 50,),
                Center(
                  child: Text("Or login with social account?", style: TextStyle(color: cModeDarkColorFontTitle),),

                ),
                SizedBox(height:10),
                signSocialMedia,
                SizedBox(height: 20,),
                dividerFooter
              ],
            ),
          ),
        ),
      ),
    ) ;
  }

  String validatePassword(String value){
    if(value.length < 3){
      bCheckPassword = false;
      return "Must be more than 3 character!";
    }else{
      bCheckPassword = true;
      return null;
    }
  }

  String validateEmail(String value){
    Pattern regexEmailPattern = 
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(regexEmailPattern);
    if(!regex.hasMatch(value)){
      bCheckEmail = false;
      return "Not a valid email address, Should be your@email.com!";
    }else{
      bCheckEmail = true;
      return null;
    }
  }

  Widget iconCheckEmail(){
    if(_formKey.currentState == null){
      return Container();
    }else if(bCheckEmail && textControllerEmail.text.isNotEmpty){
      return Icon(Icons.check, color: Colors.green,);
    }else if(!bCheckEmail){
      return Icon(Icons.clear, color: Colors.red,);
    }else{
      return Container();
    }
  }
  
  Widget iconCheckPassword(){
    if(_formKey.currentState == null){
      return Container();
    }else if(bCheckPassword && textControllerPassword.text.isNotEmpty){
      return Icon(Icons.check, color: Colors.green,);
    }else if(!bCheckPassword){
      return Icon(Icons.clear, color: Colors.red,);
    }else{
      return Container();
    }
  }
}