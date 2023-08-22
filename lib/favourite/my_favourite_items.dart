

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/favourite_provider.dart';

class MyFavouriteItems extends StatefulWidget {
  const MyFavouriteItems({Key? key}) : super(key: key);

  @override
  State<MyFavouriteItems> createState() => _MyFavouriteItemsState();
}

class _MyFavouriteItemsState extends State<MyFavouriteItems> {

  @override
  Widget build(BuildContext context) {
    final favouriteProvider = Provider.of<FavouriteProvider>(context);
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: Text("My Favourite Items"),
        centerTitle: true,

      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: favouriteProvider.selecteditem.length,
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
                          /*value.additem(index);*/
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
