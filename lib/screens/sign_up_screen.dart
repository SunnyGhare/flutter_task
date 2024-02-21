import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/widgets/button.dart';
import 'package:flutter_task/widgets/text_field.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';
import '../utils/text_styles.dart';
class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  final GlobalKey<FormState> signupkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: signupkey,
              child: Column(
                children: [
                  Padding(
                    padding:EdgeInsets.only(top: 90,left: 27),
                    child: Row(
                      children: [
                        Center(child: Text("Create an Account",style:TextHelper.h5)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30,left: 27),
                    child: Row(
                      children: [
                        Center(child: Text("Full name",style: TextHelper.h6.copyWith(color: ColorsForApp.textColor,fontSize: 16)))
                      ],
                    ),
                  ),
                  CustomTextField(
                    controller: nameController,
                    validator: (val)
                    {
                      if(val!.isEmpty)
                        {
                          return "Please Enter Name";
                        }
                      else {
                        return null;
                      }
                    },
                    fillColor: ColorsForApp.textfieldColor,
                    filled: true,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30,left: 27),
                    child: Row(
                      children: [
                        Center(child: Text("Mobile number",style: TextStyle(color: ColorsForApp.textColor,fontSize: 16),))
                      ],
                    ),
                  ),
                  CustomTextField(
                    controller: mobileController,
                    validator: (val)
                    {
                      if(val!.isEmpty)
                      {
                        return "Please Enter Mobile No";
                      }
                      else {
                        return null;
                      }
                    },
                    fillColor: ColorsForApp.textfieldColor,
                    filled: true,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30,left: 27),
                    child: Row(
                      children: [
                        Center(child: Text("Email ID",style: TextStyle(color: ColorsForApp.textColor,fontSize: 16),))
                      ],
                    ),
                  ),
                  CustomTextField(
                    controller: emailController,
                    validator: (val)
                    {
                      if(val!.isEmpty)
                      {
                        return "Please Enter Email";
                      }
                      else {
                        return null;
                      }
                    },
                    fillColor: ColorsForApp.textfieldColor,
                    filled: true,
                  ),
                  SizedBox(height: 180,),
                  CommonButton(
                    onPressed: ()
                    {
                      if(signupkey.currentState!.validate())
                        {
                          Get.toNamed("/login_screen");
                        }
                    },
                    label:"Create an account",
                    bgColor:Color(0xff5167EB),)
                ],
              ),
            ),
            RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Existing user?",style: TextStyle(color: Color(0xff626262))
                    ),
                    TextSpan(
                        recognizer:TapGestureRecognizer()..onTap = ()
                        {
                          Get.toNamed("/login_screen");
                        }  ,
                        text: " Log in",style: TextStyle(color: Color(0xff2A1D8B))
                    ),
                  ]
                ))
          ],
        ),
      ),
    );
  }
}
