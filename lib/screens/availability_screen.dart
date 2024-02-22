import 'package:flutter/material.dart';
import 'package:flutter_task/utils/app_colors.dart';
import 'package:flutter_task/utils/text_styles.dart';
import 'package:flutter_task/widgets/button.dart';
import 'package:flutter_task/widgets/constant_widgets.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
class AvailabilityScreen extends StatefulWidget {
  const AvailabilityScreen({super.key});

  @override
  State<AvailabilityScreen> createState() => _AvailabilityScreenState();
}

class _AvailabilityScreenState extends State<AvailabilityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 70,left: 24),
            child: Row(
              children: [
                InkWell(
                    child: Icon(Icons.arrow_back,size: 24,color: Colors.black,),
                onTap: (){
                      Get.back();
                },
                ),
                SizedBox(width: 36,),
                Text("Available desks",style: TextHelper.h6.copyWith(color:ColorsForApp.textColor,fontSize: 20,fontWeight: FontWeight.w400),)
              ],
            ),
          ),
          SizedBox(height: 40,),
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Row(
              children: [
                Text("Wed 31 May , 05.00PM-06.00PM",style: TextHelper.h6.copyWith(fontSize: 13,fontWeight: FontWeight.w400),)
              ],
            ),
          ),
          SizedBox(height: 20,),
          Container(
            height: 55.h,
            child: Padding(
              padding: const EdgeInsets.only(left: 24,right: 24),
              child: Expanded(
                child: GridView.builder(
                    itemCount: 40,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 6,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 1
                    ),
                    itemBuilder: (context,index){
                      return Container(
                        height: 3.h,
                        width: 10.w,
                        color: Colors.purple,
                      );
                    }
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 75),
            child: CommonButton(
                onPressed: ()
                {
                  showCommonMessageDialog(context, "Confirm Booking", "");
                },
                label: "Book Desk"
            ),
          )
        ],
      ),
    );
  }
}
