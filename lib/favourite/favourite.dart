

import 'package:countexamples/favourite/my_favourite_items.dart';
import 'package:countexamples/provider/favourite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {

  List <int> selectedItem = [];
  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourite"),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: ()
              {
                Navigator.push(context, MaterialPageRoute(builder: (builder) => MyFavouriteItems()));
              },
              child: Icon(Icons.favorite)),
          SizedBox(width: 24,)
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 100,
                itemBuilder: (context, index){
                  return Consumer<FavouriteProvider>(builder: (context, value, child)
                  {
                    return ListTile(
                      onTap: ()
                      {
                        if(value.selecteditem.contains(index))
                          {
                            value.removeitem(index);
                          }
                        else
                          {
                            value.additem(index);
                          }

                      },
                      title:Text("Item"+index.toString()) ,
                      trailing: Icon(
                          value.selecteditem.contains(index) ? Icons.favorite : Icons.favorite_outline),
                    );
                  });
                }),
          )

        ],
      ),
    );
  }
}
