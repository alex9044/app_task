import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AppData with ChangeNotifier {
  var data = [];
  var favorites = []; 

  bool favorite(cityName){
    if(this.hasFavorite(cityName)){
      
      favorites.remove(cityName);
      return false;

    }else{

      favorites.add(cityName);
      return true;

    }
  }
  
  bool hasFavorite(cityName){
    return favorites.contains(cityName);
  }

  List favoritiesCities(){

    List result= [];

    for(var favorite in favorites){
      List foundCities = this.searchCity(favorite);

      if(foundCities.length > 0){
        result.add(foundCities[0]);
      }
    }

    return result;

  }
  List searchCity(text){
    
    List result = [];
    text = text.trim().toLowerCase();
    if(text == ''){
      return result;
    }

    for(var continents in data){
      for(var countries in continents['countries']){
        for(var city in countries['cities']){
          if(city['name'].toLowerCase().contains(text)){
            result.add(city);
          }
        }
      }
    }

    return result;
  }
  void setData(newData){
    data = newData;
    notifyListeners();
  }

  Future<bool> requestData() async {
    final res =  await http.get('https://api.b7web.com.br/flutter1wb/');
    if(res.statusCode == 200){
      setData(jsonDecode(res.body));
      return true;
    }
    return false;
  }
}