
import 'package:flutter/material.dart';
import 'package:animated_splash/animated_splash.dart';
import '../pages/home.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';


class StartPage extends StatefulWidget {
  @override 
  _StartPage createState() => _StartPage();
}

class _StartPage extends State<StartPage>{
  bool loading = true;

  void requestInfo() async {

    await Future.delayed(Duration(seconds: 1));

    bool req = await Provider.of<AppData>(context, listen: false).requestData();

    if(req){
      setState(() {
       loading = true;
      });
    }else{
      setState(() {
      loading = false;
    });
    }

    
  }
  @override
  void initState() {
    super.initState();
    requestInfo();
  }
  
  @override
  Widget build(BuildContext context) {
    return AnimatedSplash(
      imagePath: 'lib=assets/',
      home: HomePage(),
      customFunction: (){
        requestInfo();
      },
      duration: 2500,
      type: AnimatedSplashType.BackgroundProcess,
    );
  } 
}