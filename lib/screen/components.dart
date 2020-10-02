import 'package:ecommerce_app/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget signSocialMedia = Row(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    SizedBox(
      width: 90, height: 60,
      child: RaisedButton(
        onPressed: (){},
        child: Image.asset("assets/google-icon.png"),
        color: cModeDarkColorFontTitle,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
      ),
    ),
    SizedBox(width: 10,),
    SizedBox(
      width: 90, height: 60,
      child: RaisedButton(
        onPressed: (){},
        child: Image.asset("assets/facebook-icon.png"),
        color: cModeDarkColorFontTitle,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
      ),
    )
  ],  
);

Widget dividerFooter = Center(
  child: SizedBox(
    width: 130,
    child: Divider(color: cModeDarkColorFontTitle, thickness: 3,),
  ),
);