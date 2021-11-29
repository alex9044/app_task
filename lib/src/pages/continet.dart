import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';

import '../partials/custom_appbar.dart';
import '../partials/custom_drawer.dart';
import '../partials/cityBox.dart';


class ContinetPage extends StatelessWidget{
  
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  final TextStyle styles = TextStyle(
    fontSize: 15,
    fontFamily: 'Helvetica Neue',
    fontWeight: FontWeight.bold
  );

  void seeCityAction(context, continetIndex){
    Navigator.pushNamed(context, '/listcity', arguments: continetIndex);
  }

  void cityBoxAction(context, cityData){
    Navigator.pushNamed(context, '/city', arguments: cityData);
  }
  @override 
  Widget build(BuildContext context){
    return Consumer<AppData>(
      builder: (context, appdata, child)=> Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          title: 'Escolha um continente',
          scaffoldKey: _scaffoldKey,
          pageContext: context
        ),
        drawer: CustomDrawer(
          pageContext: context
        ),
        body: ListView.builder(
            itemCount: appdata.data.length,
            itemBuilder: (context, index){

              var cities = [];

              for(var country in appdata.data[index]['countries']){
                cities.addAll(country['cities']);
              }


              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     Container(
                       margin: EdgeInsets.only(left: 10),
                       child: Text("${appdata.data[index]['name']} (${cities.length})",
                        style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold  
                        ))
                      ),
                      FlatButton(
                        onPressed: (){
                          seeCityAction(context, index);
                        }, 
                        child: Text('Ver cidades',
                        style: TextStyle(
                          fontFamily: 'Helvetica Neue',
                          fontSize: 13,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.bold),
                        )
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 15),
                    height: 140,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: cities.length,
                      itemBuilder: (cityContext, cityIndex){
                        return CityBox(
                          data: cities[cityIndex],
                          onTap: (cityData){
                            cityBoxAction(context, cityData);
                          }
                        );
                      } ,
                    ),
                  )
              ]);
            }
        )
      )
    ); 
  }
}