import 'package:apptask/src/partials/cityBox.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';

import '../partials/custom_appbar.dart';
import '../partials/custom_drawer.dart';

class SearchPage extends StatefulWidget {

  @override 
  _SearchPage createState() => _SearchPage();

}

class _SearchPage extends State<SearchPage>{
  var list = [];
  
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  final TextStyle  styles = TextStyle(
    fontSize: 15,
    fontFamily: 'Helvetica Neue',
    fontWeight: FontWeight.bold
  );

  void doSearch(context, text) async{
    var newList = await Provider.of<AppData>(context, listen: false).searchCity(text);

    setState(() {
      list = newList;
    });
  }

  @override 
  Widget build(BuildContext context){
    return Consumer<AppData>(
      builder: (context, appdata, child)=> Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          title: 'Busque uma Cidade',
          scaffoldKey: _scaffoldKey,
          pageContext: context,
        ),
        drawer: CustomDrawer(
          pageContext: context
        ),
        body: ListView(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: TextField(
                onChanged: (text){
                  doSearch(context, text);
                },
                decoration: InputDecoration(
                  hintText: 'Digite o nome de uma cidade',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.search, size: 32)
                ),
                ),
            ),
            Expanded(
              child: GridView.count(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                children: List.generate(list.length, (index) {
                  return CityBox(
                    data: list[index],
                    onTap: (cityData){
                        Navigator.pushNamed(context, '/city', arguments: cityData);
                    }
                  );
                })
              )
            )
          ],
        )
      )
    ); 
  }
}