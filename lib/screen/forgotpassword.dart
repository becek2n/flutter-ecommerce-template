import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/screen/components.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  ForgotPasswordScreen({Key key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  var _formKey = GlobalKey<FormState>();
  final textControllerEmail = TextEditingController(),
    textControllerPassword = TextEditingController();

  bool bCheckEmail = false;
  bool bCheckPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Text("Forgot Password", style: TextStyle(color: cModeDarkColorFontTitle, fontSize: cSizeTextHeader, fontWeight: FontWeight.bold),),
              SizedBox(height: 40,),
              Text("Please enter your email address. You will recieve a link to create new password via email.", style: TextStyle(color: cModeDarkColorFontTitle),),
              SizedBox(height: 10,),
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
                  ],
                ),
              ),
              SizedBox(height: 50,),
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: RaisedButton(
                    onPressed: (){},
                    child: Text("SEND"),
                    color: cModeDarkColorButtom,
                    textColor: cModeDarkColorButtonText,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                  ),
                ),
              ),
              
              SizedBox(height: 200,),
              dividerFooter
            ],
          ),
        ),
      ),
    );
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