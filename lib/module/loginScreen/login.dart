import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_pic_application/comman_components/comman_widgets.dart';
import 'package:pet_pic_application/utils/assets_path.dart';
import 'package:pet_pic_application/utils/colors.dart';
import 'package:pet_pic_application/utils/navigator_route.dart';
import 'package:pet_pic_application/utils/sharepRefrence.dart';
import 'package:pet_pic_application/utils/strings.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final GlobalKey<FormState> formKey = GlobalKey();
    final ownController = TextEditingController();
     final petNameController = TextEditingController();
      final breedController = TextEditingController();
        bool submitted = false;

  @override
  void dispose() {
    super.dispose();
    ownController.dispose();
    petNameController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Scaffold(
      body:Container(
        height: height,
        width: width,
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: width,
                  height: height*0.45,
                  child: Image.asset(loginImage,fit: BoxFit.fill,),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(appName,style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
                vSpace(30.h),
              commanTextfeild(ownerNameHint, ownController,inputFormatters: [ 
                LengthLimitingTextInputFormatter(20),
             ],
                  validator: (value) {
                                 // if (value!.isEmpty) return cantbeempty;
                                  String ownerName =
                                      ownController.text.trim();
                                  if (ownerName.isEmpty) {
                                    return enterOwnerName;
                                  } else if (ownerName.length <3) {
                                    return tooShortError;
                                  } else {
                                    return null;
                                  }
                                },
                                onChanged: (value) {
                                  

                                  
                                },
                                
                ),
                
             vSpace(20.h),
               commanTextfeild(petNameHint, petNameController,inputFormatters: [
                 LengthLimitingTextInputFormatter(10),
                ],
                validator:(value){
                    String petName =
                                      petNameController.text.trim();
                                  if (petName.isEmpty) {
                                    return enterPetName;
                                  }else {
                                    return null;
                                  }
                },onChanged: (value) {
                  
                },),
              vSpace(20.h),
                 commanTextfeild(breedHint, breedController,inputFormatters: [
                   LengthLimitingTextInputFormatter(10),
                ],
                   validator:(value){
                      
                                 
                   },onChanged: (value) {
                  
                },),
              
               
               vSpace(20.h), 
               ElevatedButton(
                  onPressed: () {
                     final formstate =formKey.currentState;
                    if (formstate!.validate()) {
                        //  loginvalidationForm(); 
                        formKey.currentState!.save();  
                        saveKeyValString(ownerNameKey, ownController.toString());
                         saveKeyValString(petNameKey, petNameController.toString());
                         Navigator.pushNamed(context,bottomBarView );         
                                          }
                   
                  },
                  style: ElevatedButton.styleFrom(fixedSize: const Size(150, 50),backgroundColor:Vx.hexToColor(appColor)),
                  child: const Text(loginButton,style: TextStyle(fontSize: 18,color: Colors.black),)),
             
             vSpace(20.h),
            
             
             
             ],
            ),
          ),
        ),
      ),
    );
  }

  }
