import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';

import '../partials/custom_appbar.dart';
import '../partials/custom_drawer.dart';
import '../partials/cityBox.dart';


class ListCityPage extends StatelessWidget{
  
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  final TextStyle  styles = TextStyle(
    fontSize: 15,
    fontFamily: 'Helvetica Neue',
    fontWeight: FontWeight.bold
  );
  void cityBoxAction(context, cityData){
    Navigator.pushNamed(context, '/city', arguments: cityData);
  }
  @override 
  Widget build(BuildContext context){

    var args = ModalRoute.of(context).settings.arguments;
    return Consumer<AppData>(
      builder: (context, appdata, child){
        
        var cities = [];
        
        for(var country in appdata.data[args]['countries']){
          cities.addAll(country['cities']);
        }

        return Scaffold(
          backgroundColor: Colors.white,
          key: _scaffoldKey,
          appBar: CustomAppBar(
          title: '${appdata.data[args]['name']} (${cities.length})',
          scaffoldKey: _scaffoldKey,
          pageContext: context,
          showBack: true
          ),
          drawer: CustomDrawer(
          pageContext: context
          ),
          body: GridView.count(
            crossAxisCount: 3,
            children: List.generate(cities.length, (index) { 
              return CityBox(
                data: cities[index],
                onTap: (cityData){
                  cityBoxAction(context, cityData);
                }
              );
            })
          ) 
        );
      }
    );
  }
}