

import 'dart:async';

import 'package:countexamples/provider_multiple.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'count_provider.dart';

class CountExample extends StatefulWidget {
  const CountExample({Key? key}) : super(key: key);

  @override
  State<CountExample> createState() => _CountExampleState();
}

class _CountExampleState extends State<CountExample> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final countProvider = Provider.of<CountProvider>(context, listen:  false);
    Timer.periodic(Duration(seconds: 2), (timer)
    {
      countProvider.setCount();
    });
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    final countProvider = Provider.of<CountProvider>(context, listen:  false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Count"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Consumer<CountProvider>(
              builder: (context, value, child)
              {
                print("Only this will be display");
                return (Text(countProvider.count.toString(),style: TextStyle(
                    fontSize: 32
                ),));
              },
            ),
          ),

          TextButton(onPressed: ()
              {
                Navigator.push(context, MaterialPageRoute(builder: (builder) => MultipleProvider()));
              }, child: Text("Multiple Provider"))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()
        {
          countProvider.setCount();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
