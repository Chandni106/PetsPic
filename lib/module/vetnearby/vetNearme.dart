import 'package:flutter/material.dart';
import 'package:pet_pic_application/utils/colors.dart';
import 'package:pet_pic_application/utils/strings.dart';
import 'package:velocity_x/velocity_x.dart';

class VetNearMeScreen extends StatefulWidget {
  const VetNearMeScreen({super.key});

  @override
  State<VetNearMeScreen> createState() => _VetNearMeScreenState();
}

class _VetNearMeScreenState extends State<VetNearMeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Vx.hexToColor(appColor),
        title: Center(child: Text(vetNearme,)),
         
      
      ),
    );
  }
}