import 'package:flutter/material.dart';

Widget listTile({
  String title,
  Function onPress,
  IconData icon
}){
  return ListTile(    
    onTap: onPress,
    title: Text(title, style: TextStyle(
    
    )),
    leading: Icon(icon, color: Colors.black,), 
  );
}