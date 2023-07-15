import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

vSpace(double height) {
  return SizedBox(
    height: height,
  );
} 

hSpace(double width) {
  return SizedBox(
    width: width,
  );
}
commanTextfeild(String hint,TextEditingController mController, {List<TextInputFormatter>? inputFormatters, final String? Function(String?)? validator,
  required Null Function(dynamic value) onChanged, }){

 return TextFormField(
 
        controller: mController,
        keyboardType: TextInputType.name,
        inputFormatters: inputFormatters,
        validator: validator,
         autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged:onChanged,
                decoration: InputDecoration(
                  hintText:hint,
               
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              );

}