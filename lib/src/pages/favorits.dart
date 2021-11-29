import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';

import '../partials/custom_appbar.dart';
import '../partials/custom_drawer.dart';
import '../partials/cityBox.dart';


class FavoritsPage extends StatelessWidget{
  
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override 
  Widget build(BuildContext context){
    return Consumer<AppData>(
      builder: (context, appdata, child){
        
        List favorites = appdata.favoritiesCities();
        
        return Scaffold(
        backgroundColor: Colors.white,
        key: _scaffoldKey,
        appBar: CustomAppBar(
          title: 'Ciadades salvas',
          scaffoldKey: _scaffoldKey,
          pageContext: context
        ),
        drawer: CustomDrawer(
          pageContext: context
        ),
        body: GridView.count(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 2,
          children: List.generate(favorites.length, (index) {
           return CityBox(
                    data: favorites[index],
                    onTap: (cityData){
                      Navigator.pushNamed(context, '/city', arguments: cityData);
                    }
                  );
            })
          )
        );
    }); 
  }
}