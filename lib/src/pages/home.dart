import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';

import '../partials/custom_appbar.dart';
import '../partials/custom_drawer.dart';


class HomePage extends StatelessWidget{
  
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  final TextStyle  styles = TextStyle(
    fontSize: 15,
    fontFamily: 'Helvetica Neue',
    fontWeight: FontWeight.bold
  );

  @override 
  Widget build(BuildContext context){
    return Consumer<AppData>(
      builder: (context, appdata, child)=> Scaffold(
        backgroundColor: Colors.white,
        key: _scaffoldKey,
        appBar: CustomAppBar(
          title: 'Home Page',
          scaffoldKey: _scaffoldKey,
          pageContext: context
        ),
        drawer: CustomDrawer(
          pageContext: context
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(bottom:30),
                child: Text('Bom vindo(a) ao',
                style: styles
                ),
              ),
              Image.asset('lib/assets/flutter1_devstravel_logo.png',
                width: 200,
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Text('Seu guia de viajes perfeito',
                style: styles
                ),
              )
            ],
          )
      ))
    ); 
  }
}