import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/controllers/slot_controller.dart';
import 'package:flutter_task/repositories/auth_repository.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../routes/routes.dart';
import '../utils/app_colors.dart';
import '../utils/text_styles.dart';
import '../widgets/button.dart';

class SelectSlotScreen extends StatefulWidget {
  const SelectSlotScreen({super.key});

  @override
  State<SelectSlotScreen> createState() => _SelectSlotScreenState();
}

class _SelectSlotScreenState extends State<SelectSlotScreen> {

  SlotController slotController = Get.find();

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
                Text("Select Date & Slot",style: TextHelper.h6.copyWith(color:ColorsForApp.textColor,fontSize: 20,fontWeight: FontWeight.w400),)
              ],
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(top:54),
            child: Container(
              height: 80,
              width: 500,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black,width: 0.5)
              ),
              child: Expanded(
                child: DatePicker(
                  DateTime.now(),
                  initialSelectedDate: DateTime.now(),
                  selectionColor: Color(0xff4D60D1),
                  selectedTextColor: Colors.white,
                  onDateChange: (date) {
                    setState(() {
                      slotController.selectedValue.value =! slotController.selectedValue.value;
                    });
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(left: 24,right: 24),
            child: Expanded(
              child: GridView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 4
                  ),
                  itemBuilder: (context,index){
                    return Container(
                      height: 3.h,
                      width: 10.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.purple,
                      ),
                    );
                  }
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 150),
            child: CommonButton(
                onPressed: (){
                  Get.toNamed(Routes.AVAILABILITY_SCREEN);
                },
                label: "Next"
            ),
          )
        ],
      ),
    );
  }
}
