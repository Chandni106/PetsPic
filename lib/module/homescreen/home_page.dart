
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';  
import 'package:pet_pic_application/utils/colors.dart';
import 'package:pet_pic_application/utils/sharepRefrence.dart';
import 'package:pet_pic_application/utils/strings.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:camera/camera.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 XFile? image;
  final ImagePicker imgpicker = ImagePicker();
 List<XFile>? imagefiles;
 String? petN;
    

 openImages() async {
try {
    var pickedfiles = await imgpicker.pickMultiImage();
    //you can use ImageCourse.camera for Camera capture
    if(pickedfiles != null){
        imagefiles = pickedfiles;
        setState(() {
        });
    }else{
        print("No image is selected.");
    }
}catch (e) {
    print("error while picking file.");
}
}


 userdata()async{
   petN=  await getStringVal(petNameKey);  
 }
      @override
      void initState() {
      
        super.initState();
        userdata(); 
        print(petN);// value from shareprefrence
  
      }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Vx.hexToColor(appColor),
        title: Center(child: Text(petN.toString())),
          actions: [
              IconButton(
                onPressed: () => myAlert(), 
                icon: Icon(Icons.upload),
              )
            ],
      ),
  

      body:Container(child:Column(
        children: [
          imagefiles != null?Wrap(
                     children: imagefiles!.map((imageone){
                        return Container(
                           child:Card( 
                              child: Container(
                                 height: 100, width:100,
                                 child: Image.file(File(imageone.path)),
                              ),
                           )
                        );
                     }).toList(),
                  ):Container(
                    child: Center(child: Text(" Upload the images ... ")),
                  )
        ],

      ) ,),
    );
    
  }
     //show popup dialog
      void myAlert() {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Vx.hexToColor(appColor),
                shape:
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                title: Text(popupTitle),
                content: Container(
               
                  height: MediaQuery.of(context).size.height / 6,
                  child: Column(
                    children: [
                      ElevatedButton(
                         style: ButtonStyle(backgroundColor: MaterialStateProperty.all( Vx.hexToColor(appColor),)  ),
                       
                        onPressed: () {
                          Navigator.pop(context);
                          openImages();
                          
                        },
                        child: const Row(
                          children: [
                            Icon(Icons.image),
                            Text(gallerylabel),
                          ],
                        ),
                      ),
                      ElevatedButton(
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all( Vx.hexToColor(appColor),)  ),
                       
                        onPressed: ()  {
                          setState(() async{
                             final XFile? pickedFile = await ImagePicker().pickImage(source:
 ImageSource.camera); 
                          });
             
                         // sendImage(ImageSource.camera);
                        },
                        child: const Row(
                          children: [
                            Icon(Icons.camera),
                            Text(cameraLabel),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            });
      }
   
    
}