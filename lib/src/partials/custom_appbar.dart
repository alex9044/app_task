import 'package:flutter/material.dart';


Widget CustomAppBar({
  String title = '',
  bool hideSearch = false,
  bool showBack = false,
  GlobalKey<ScaffoldState> scaffoldKey,
  BuildContext pageContext
}){

  void searchAction() {
    Navigator.pushNamed(pageContext, '/search');
  }

  IconButton backIcon = IconButton(
    icon: Icon(Icons.arrow_back, color: Colors.black,size: 30),
    onPressed: (){
      Navigator.pop(pageContext);
    }
  );

  IconButton drawerIcon = IconButton(
    icon: Icon(Icons.menu, color: Colors.black,size: 30),
    onPressed: (){
      scaffoldKey.currentState.openDrawer();
    }
  );

  IconButton leadingButton = drawerIcon;

  if(showBack){
    leadingButton = backIcon;
  }

  return AppBar(
    brightness: Brightness.light,
    leading: leadingButton,
    actions: [
      !hideSearch ? IconButton(
        icon: Icon(Icons.search,
        color: Colors.black,
        size: 30),
        onPressed: searchAction ) : Container()
    ],
    centerTitle: false,
    elevation: 0,
    title: Text(title,
      style: TextStyle(
        color: Colors.black,
        fontFamily: 'Helvetica Neue',
        fontSize: 20,
        fontWeight: FontWeight.bold
        )),
    backgroundColor: Colors.white
  );
}