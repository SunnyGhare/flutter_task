import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/widgets/button.dart';
import 'package:flutter_task/widgets/text_field.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  final GlobalKey<FormState> signupkey = GlobalKey<FormState>();
  bool selected = true;
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
                      padding: EdgeInsets.only(top: 89),
                      child: Container(
                        height:44 ,
                        width: 44,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image:AssetImage("assets/images/coworking1.png"))
                        ),
                      ),
                    ),
                  Padding(
                    padding:EdgeInsets.only(left: 140,top: 5),
                    child: Row(
                      children: [
                        Center(child: Text("Co-working",style:TextStyle(color: Colors.black,fontSize: 24))),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 70,left: 27),
                    child: Row(
                      children: [
                        Center(child: Text("Mobile number or Email",style: TextStyle(color: ColorsForApp.textColor,fontSize: 16),))
                      ],
                    ),
                  ),
                  CustomTextField(
                    controller: nameController,
                    validator: (val)
                    {
                      if(val!.isEmpty)
                      {
                        return "Please Enter Mobile number or Email";
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
                        Center(child: Text("Password",style: TextStyle(color: ColorsForApp.textColor,fontSize: 16),))
                      ],
                    ),
                  ),
                  CustomTextField(
                    controller: mobileController,
                    validator: (val)
                    {
                      if(val!.isEmpty)
                      {
                        return "Please Enter Password";
                      }
                      else {
                        return null;
                      }
                    },
                    fillColor: ColorsForApp.textfieldColor,
                    filled: true,
                    obscureText: selected,
                    suffixIcon: GestureDetector(
                      onTap: (){
                        setState(() {
                          selected =! selected;
                        });
                      },
                        child: selected?Icon(Icons.remove_red_eye):Icon(Icons.visibility_off_outlined)),
                  ),
                  SizedBox(height: 180,),
                  CommonButton(
                    onPressed: ()
                    {
                      if(signupkey.currentState!.validate())
                      {
                        Get.toNamed("/coworking_screen");
                      }
                    },
                    label:"Log in",
                    bgColor:Color(0xff5167EB),)
                ],
              ),
            ),
            RichText(
                text: TextSpan(
                    children: [
                      TextSpan(
                          text: "New user?",style: TextStyle(color: Color(0xff626262))
                      ),
                      TextSpan(
                          recognizer:TapGestureRecognizer()..onTap = ()
                          {
                            Get.toNamed("/sign_up_screen");
                          }  ,
                          text: " Create an account",style: TextStyle(color: Color(0xff2A1D8B))
                      ),
                    ]
                ))
          ],
        ),
      ),
    );
  }
}
