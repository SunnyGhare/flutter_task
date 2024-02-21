import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/controllers/slot_controller.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SelectDateScreen extends StatefulWidget {
  const SelectDateScreen({super.key});

  @override
  State<SelectDateScreen> createState() => _SelectDateScreenState();
}

class _SelectDateScreenState extends State<SelectDateScreen> {

  SlotController slotController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 69,left: 60),
            child: Row(
              children: [
                Icon(Icons.arrow_back),
                SizedBox(width: 10,),
                Text("Select Date & slot",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:54),
            child: Container(
              height: 80,
              width: 460,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black)
              ),
              child: DatePicker(
                DateTime.now(),
                initialSelectedDate: DateTime.now(),
                selectionColor: Color(0xff4D60D1),
                selectedTextColor: Colors.white,
                onDateChange: (date) {
                  // New date selected
                  setState(() {
                    slotController.selectedValue.value =! slotController.selectedValue.value;
                  });
                },
              ),
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2
    ),
              itemBuilder: (context,index){
                return Container(
                  height: 3.h,
                  width: 10.w,
                  color: Colors.purple,
                );
              }
          )

        ],
      )
    );
  }
}
