import 'package:flutter/material.dart';
import '../partials/custom_listtile.dart';


Widget CustomDrawer ({
  BuildContext pageContext
}){

  void navegator (String route){
    Navigator.pushReplacementNamed(pageContext, route);
  }

  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            color: Colors.blueGrey
          ),
          child:Column(
            children: [
              Container(
                width: 130,
              child: Image.asset('lib/assets/flutter1_devstravel_logo.png',
              width: 120,)
              ),
              Container(
                padding: EdgeInsets.only(top: 5,bottom: 5,
                left: 15),
                alignment: Alignment.centerLeft,
                child: Text('Versão 1.0.0',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontFamily: 'Helvetica Neue'
                )))
            ],
        )),
        listTile(
          icon: Icons.home,
          title: 'Home',
          onPress: (){
            navegator('/home');
          }         
        ),
        listTile(
          icon: Icons.public,
          title: 'Escolher Continente',
          onPress: (){
            navegator('/continents');
          }
        ),
        listTile(
          icon: Icons.search,
          title: 'Buscar Cidade',
          onPress: (){
            navegator('/search');
          }
        ),
        listTile(
          icon: Icons.favorite,
          title: 'Cidades Salvas',
          onPress: (){
            navegator('/favorites');
          }
        )
      ],
    ),
  );
}