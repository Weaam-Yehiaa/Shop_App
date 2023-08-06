import 'package:flutter/material.dart';

class CustomTextFiled extends StatelessWidget {
  CustomTextFiled.CustomTextField({this.onChanged,this.hintText,this.obscureText=false,this.inputType=TextInputType.text});

  String? hintText;
  Function(String)? onChanged;
  bool? obscureText;
  TextInputType inputType;

  @override
  Widget build(BuildContext context) {
    return TextField(  //TextFormField instead of TextField cause of using Form
      obscureText: obscureText!,
      onChanged: onChanged,
      keyboardType: inputType,
      decoration: InputDecoration(
        hintText: hintText,

        enabledBorder:OutlineInputBorder(
          borderSide:BorderSide(),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(),
          borderRadius: BorderRadius.circular(16),
        ),

      ),
    );
  }
}