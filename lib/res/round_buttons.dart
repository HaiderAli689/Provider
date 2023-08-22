

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {

  final String title;
  final bool loading;
  final VoidCallback onPress;

  const RoundButton({Key? key,
    required this.title,
    this.loading = false,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 46,
        width: 400,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(12)
        ),
        child: Center(
            child: loading ? CircleAvatar() : Text(title,style: TextStyle(
          fontSize: 20,
          color: Colors.white
        ),)),
      ),
    );
  }
}
