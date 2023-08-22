
import 'package:countexamples/favourite/favourite.dart';
import 'package:countexamples/provider/auth_provider.dart';
import 'package:countexamples/provider/count_example.dart';
import 'package:countexamples/provider/count_provider.dart';
import 'package:countexamples/provider/favourite_provider.dart';
import 'package:countexamples/provider/multiple_provider.dart';
import 'package:countexamples/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'login_screen.dart';

void main()
{
  runApp(Main());
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers : [
        ChangeNotifierProvider(create: (_) => CountProvider()),
        ChangeNotifierProvider(create: (_) => ExampleMultipleProvider()),
        ChangeNotifierProvider(create: (_) => FavouriteProvider()),
        ChangeNotifierProvider(create: (_) => ThemeChanger()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: Builder(builder: (BuildContext context){
        final themeChanger = Provider.of<ThemeChanger>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: themeChanger.themeMode,
          theme: ThemeData(
              brightness: Brightness.light,
              primarySwatch: Colors.red
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
              appBarTheme: AppBarTheme(
                color: Colors.teal
              ),
              primarySwatch: Colors.pink,

          ),

          home: Scaffold(
            body: LoginScreen(),
          ),
        );
      }),
    );

  }
}
