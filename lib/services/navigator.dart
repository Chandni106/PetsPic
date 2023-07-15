import 'package:flutter/material.dart';
import 'package:pet_pic_application/comman_components/bottom_Navigation_Bar.dart';
import 'package:pet_pic_application/module/homescreen/home_page.dart';
import 'package:pet_pic_application/module/loginScreen/login.dart';

import 'package:pet_pic_application/module/splash_screen.dart';

import 'package:velocity_x/velocity_x.dart';


class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
   
   

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => SplashScreen());

     case '/loginScreen':
        return MaterialPageRoute(builder: (_) => const LoginPage());
     case '/bottomBar':
        return MaterialPageRoute(builder: (_) => const BottomBarView());
    
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: "Error".text.make(),
        ),
        body: Center(
          child: "Something Went Wrong".text.make(),
        ),
      );
    });
  }



  
  
}
