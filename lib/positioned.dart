

import 'package:flutter/material.dart';

class Position extends StatefulWidget {
  const Position({Key? key}) : super(key: key);

  @override
  State<Position> createState() => _PositionState();
}

class _PositionState extends State<Position> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Positioned"),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.blueGrey,
          child: Stack(
            children: [
              Positioned(
                bottom: 100,
                left: 100,
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.blue,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
