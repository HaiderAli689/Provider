

import 'package:flutter/material.dart';

class CheckedBoxes extends StatefulWidget {
  const CheckedBoxes({Key? key}) : super(key: key);

  @override
  State<CheckedBoxes> createState() => _CheckedBoxesState();
}

class _CheckedBoxesState extends State<CheckedBoxes> {
  @override
  bool check1 = false;
  bool check2 = false;
  bool check3 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ChechBox"),
      ),
      body:Column(
        children: [
          SizedBox(height: 24,),
           Row(
             children: [
               Checkbox(
                      value: check1,
                      onChanged: (val)
                      {
                        setState(() {
                          check1= val!;
                        });
                      },
                    ),
               Text("Check 1"),

             ],

           ),
          Row(
             children: [
               Checkbox(
                      value: check2,
                      onChanged: (val)
                      {
                        setState(() {
                          check2= val!;
                        });
                      },
                    ),
               Text("Check 2"),

             ],

           ),
          Row(
             children: [
               Checkbox(
                      value: check3,
                      onChanged: (val)
                      {
                        setState(() {
                          check3= val!;
                        });
                      },
                    ),
               Text("Check 3"),

             ],

           ),
            ],
          )
      ) ;
  }
  }

