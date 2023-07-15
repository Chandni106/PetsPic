import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_pic_application/comman_components/comman_widgets.dart';
import 'package:pet_pic_application/utils/assets_path.dart';
import 'package:pet_pic_application/utils/colors.dart';
import 'package:pet_pic_application/utils/navigator_route.dart';
import 'package:pet_pic_application/utils/strings.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController ownerNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: width,
                height: height*0.45,
                child: Image.asset(loginImage,fit: BoxFit.fill,),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(appName,style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
              vSpace(30.h),
            commanTextfeild(ownerNameHint, ownerNameController,inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^ ?\d*')),]),

           vSpace(20.h),
             commanTextfeild(petNameHint, ownerNameController,inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^ ?\d*')),]),
            vSpace(20.h),
               commanTextfeild(breedHint, ownerNameController,inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^ ?\d*')),]),
            
             
             vSpace(20.h), 
             ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context,bottomBarView );
                },
                style: ElevatedButton.styleFrom(fixedSize: const Size(150, 50),backgroundColor:Vx.hexToColor(appColor)),
                child: const Text('Login',style: TextStyle(fontSize: 18,color: Colors.black),)),
           
           vSpace(20.h),
          
           
           
           ],
          ),
        ),
      ),
    );
  }
  }
