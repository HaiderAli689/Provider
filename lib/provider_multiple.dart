

import 'package:countexamples/positioned.dart';
import 'package:countexamples/provider/multiple_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MultipleProvider extends StatefulWidget {
  const MultipleProvider({Key? key}) : super(key: key);

  @override
  State<MultipleProvider> createState() => _MultipleProviderState();
}

class _MultipleProviderState extends State<MultipleProvider> {

  @override
  Widget build(BuildContext context) {
   print("Build");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Multiple Provider"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<ExampleMultipleProvider>(builder: (context, value, child)
          {
            return Slider(
                min: 0,
                max: 1,
                value: value.value, onChanged: (val)
            {
              value.setValue(val);
            });
          }),
          Consumer<ExampleMultipleProvider>(builder: (context, value, child)
          {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.red.withOpacity(value.value),
                      ),
                      child: const Center(
                        child:  Text("Container 1"),
                      ),
                    ),
                  ),
                  SizedBox(width: 12,),
                  Expanded(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.blue.withOpacity(value.value),
                      ),
                      child: const Center(
                        child: Text("Container 1"),
                      ),
                    ),
                  ),
                ],
              ),
            )
            ;
          }),

          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: TextButton(onPressed: ()
                {
                  Navigator.push(context, MaterialPageRoute(builder: (builder) => Position() ));
                }, child: Text("Positioned")),
          )
        ],
      ),
    );
  }
}
