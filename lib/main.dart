import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import 'package:pet_pic_application/services/navigator.dart';
import 'package:pet_pic_application/utils/navigator_route.dart';

import 'package:pet_pic_application/utils/strings.dart';
import 'package:pet_pic_application/utils/theme.dart';

void main() {
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: (context, child) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
          themeMode: ThemeMode.light,
              theme: MyTheme.lightTheme(context),
              darkTheme: MyTheme.darkTheme(context),
      initialRoute: "/",
        builder: (context, child) {
                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  child: child!,
                );
              },
              onGenerateRoute: RouteGenerator.generateRoute,
    );},
     designSize: const Size(375, 812),);
  }
}

