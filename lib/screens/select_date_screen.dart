import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
class SelectDateScreen extends StatefulWidget {
  const SelectDateScreen({super.key});

  @override
  State<SelectDateScreen> createState() => _SelectDateScreenState();
}

class _SelectDateScreenState extends State<SelectDateScreen> {
  bool selectedValue = false;
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
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
                    selectedValue =! selectedValue;
                  });
                },
              ),
            ),
          ),
          // Row(
          //   children: [
          //     Padding(
          //       padding: const EdgeInsets.all(16.0),
          //       child: Container(
          //         height: mediaQuery.size.height*0.07,
          //         width: mediaQuery.size.width*0.41,
          //         color: Colors.pink,
          //       ),
          //     ),
          //     Padding(
          //       padding: const EdgeInsets.all(16.0),
          //       child: Container(
          //         height: mediaQuery.size.height*0.07,
          //         width: mediaQuery.size.width*0.41,
          //         color: Colors.pink,
          //       ),
          //     ),
          //   ],
          // )

        ],
      )
    );
  }
}
