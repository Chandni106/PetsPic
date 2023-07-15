
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';  
import 'package:pet_pic_application/utils/colors.dart';
import 'package:pet_pic_application/utils/strings.dart';
import 'package:velocity_x/velocity_x.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 XFile? image;
  final ImagePicker imgpicker = ImagePicker();
 List<XFile>? imagefiles;
    


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


//   openCamera() async {
// try {
//     var pickedfiles = await imgpicker.pickMultiImage();
//     //you can use ImageCourse.camera for Camera capture
//     if(pickedfiles != null){
//         imagefiles = pickedfiles;
//         setState(() {
//         });
//     }else{
//         print("No image is selected.");
//     }
// }catch (e) {
//     print("error while picking file.");
// }
//   }
    
    
   
      @override
      void initState() {
        // ignore: todo
        // TODO: implement initState
        super.initState();
    //    getImageServer();
      }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Vx.hexToColor(appColor),
        title: Center(child: Text("pet Name")),
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
                    child: Text(" No image "),
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
                        //if user click this button, user can upload image from gallery
                        onPressed: () {
                          Navigator.pop(context);
                          openImages();
                          // sendImage(ImageSource.gallery);
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
                        //if user click this button. user can upload image from camera
                        onPressed: () {
                          Navigator.pop(context);
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
      //    Future sendImage(ImageSource media) async {
    
      //   var img = await picker.pickImage(source: media);
    
      //   var uri = "http://192.168.1.4/latihan/flutter_upload_image/create.php";
    
      //   var request = http.MultipartRequest('POST', Uri.parse(uri));
    
      //   if(img != null){
    
      //     var pic = await http.MultipartFile.fromPath("image", img.path);
    
      //     request.files.add(pic);
    
      //     await request.send().then((result) {
    
      //       http.Response.fromStream(result).then((response) {
    
      //         var message = jsonDecode(response.body);
    
      //         // show snackbar if input data successfully
      //         final snackBar = SnackBar(content: Text(message['message']));
      //         ScaffoldMessenger.of(context).showSnackBar(snackBar);
    
      //         //get new list images 
      //         getImageServer();
      //       });
    
      //     }).catchError((e) {
    
      //       print(e);
    
      //     });
      //   }
    
      // }
    
}