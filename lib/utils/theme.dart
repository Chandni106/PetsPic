import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pet_pic_application/utils/colors.dart';



import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      buttonTheme: const ButtonThemeData(
        buttonColor: buttonColor,
        textTheme: ButtonTextTheme.primary,
      ),
      iconTheme: const IconThemeData(
        color: black,
      ),
      fontFamily: 'Urbanist',
     
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: Vx.hexToColor(balckMainColor),
        elevation: 0.0,
        iconTheme: const IconThemeData(color: white),
        foregroundColor: white,
       
      ));

  static ThemeData darkTheme(BuildContext context) => ThemeData(
      brightness: Brightness.dark,
      buttonTheme: const ButtonThemeData(
        buttonColor: buttonColor,
        textTheme: ButtonTextTheme.primary,
      ),
      iconTheme: const IconThemeData(
        color: black,
      ),
      canvasColor: Colors.white,
      
      appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
         
          elevation: 0.0,
          iconTheme: const IconThemeData(color: white),
          foregroundColor: white,
          toolbarTextStyle: Theme.of(context).textTheme.bodyText2,
          titleTextStyle: Theme.of(context).textTheme.headline6));
}
