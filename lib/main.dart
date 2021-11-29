import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'src/models/appdata.dart';
import 'src/pages/home.dart';
import 'src/pages/preload.dart';
import 'src/pages/search.dart';
import 'src/pages/continet.dart';
import 'src/pages/listcity.dart';
import 'src/pages/start.dart';
import 'src/pages/city.dart';
import 'src/pages/favorits.dart';


void main() => runApp (
  MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => AppData()
    )
  ],
  child: MyApp()),
);


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/home': (context) => HomePage(),
        '/preload': (context) => PreloadPage(),
        '/search': (context) => SearchPage(),
        '/continents': (context) => ContinetPage(),
        '/listcity': (context) => ListCityPage(),
        '/start': (context) => StartPage(),
        '/city': (context) => CityPage(),
        '/favorites': (context) => FavoritsPage()
      },
      initialRoute: '/preload'
    );
  }
}