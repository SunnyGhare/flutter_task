import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../utils/app_colors.dart';
import '../utils/text_styles.dart';
class BookingHistoryScreen extends StatefulWidget {
  const BookingHistoryScreen({super.key});

  @override
  State<BookingHistoryScreen> createState() => _BookingHistoryScreenState();
}

class _BookingHistoryScreenState extends State<BookingHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 70,left: 25),
            child: Row(
              children: [
                InkWell(
                  child: Icon(Icons.arrow_back,size: 24,color: Colors.black,),
                    onTap: (){
                    Get.back();
                  },
                ),
                SizedBox(width: 36,),
                Text("Booking history",style: TextHelper.h6.copyWith(color:ColorsForApp.textColor,fontSize: 20,fontWeight: FontWeight.w400),)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
