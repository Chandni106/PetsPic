import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_pic_application/utils/assets_path.dart';
import 'package:pet_pic_application/utils/colors.dart';
import 'package:pet_pic_application/utils/dimens.dart';
import 'package:pet_pic_application/utils/navigator_route.dart';
import 'package:pet_pic_application/utils/strings.dart';
import 'package:velocity_x/velocity_x.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
   void initState() {
    super.initState();
   
   _navigateToHome(); 
   
  }

    void _navigateToHome() {
   Future.delayed(const Duration(seconds: 2), () { 
      Navigator.pushReplacementNamed(context, loginScreen); 
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
        body: SizedBox.expand(
        child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(splashImage,fit: BoxFit.fill,),
           Padding(
             padding:  EdgeInsets.all(8.sp),
             child: Text(welcomeLabel,style: TextStyle(fontSize: font_20,color:Vx.hexToColor(balckMainColor),fontWeight: FontWeight.w500),),
           ),
            Text(splashDiscriptionLbl,style: TextStyle(fontSize: font_14,color: Vx.hexToColor(slatGrey),),),
          ],
        ),
      ),
    );
  }
}