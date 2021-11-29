import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';


class CityPage extends StatefulWidget {

  @override
  _CityPage createState() => _CityPage();
}


class _CityPage extends State<CityPage>{

  bool heart;
  
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  final TextStyle  styles = TextStyle(
    fontSize: 15,
    fontFamily: 'Helvetica Neue',
    fontWeight: FontWeight.bold
  );


  backButtonAction(context){
    Navigator.pop(context);
  }

  @override 
  Widget build(BuildContext context){

    Map<String, dynamic> args = ModalRoute.of(context).settings.arguments;

    final double footerHeigth = MediaQuery.of(context).padding.bottom;

    final double statusBarHeight = MediaQuery.of(context).padding.top;

    var starRate = double.parse(args['review']).floor();

    var stars = []; 
    for(var i=0; i < 5; i++){
      if(i < starRate){
        stars.add(true);
      }else{
        stars.add(false);
      }
    }

    return Consumer<AppData>(
      builder: (context, appdata, child){ 
        
        heart = appdata.hasFavorite(args['name']);

        return Scaffold(
        backgroundColor: Colors.white,
        key: _scaffoldKey,
        body: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              right: 0,
              height: 250,
              child: 
               Image.network(args['places'][0]['img'],
               fit: BoxFit.cover)
            ),
            ListView(
              physics: ClampingScrollPhysics(),
              padding: EdgeInsets.zero,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: EdgeInsets.only(top: 220),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.all(15),
                            child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 5),
                                child: Text('${args['name']}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Helvetica Neue',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19
                                  )
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(Icons.star, size: 16, color: stars[0]? Colors.blue : Colors.grey ),
                                  Icon(Icons.star, size: 16, color: stars[1]? Colors.blue : Colors.grey ),
                                  Icon(Icons.star, size: 16, color: stars[2]? Colors.blue : Colors.grey ),
                                  Icon(Icons.star, size: 16, color: stars[3]? Colors.blue : Colors.grey ),
                                  Icon(Icons.star, size: 16, color: stars[4]? Colors.blue : Colors.grey ),

                                  Container(
                                    margin: EdgeInsets.all(10),
                                    child: Text(args['review'],
                                     style: TextStyle(
                                       fontFamily: 'Helvetica Neue',
                                       fontWeight: FontWeight.bold
                                     )
                                    )
                                  )
                                ],
                              )
                            ])
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            child: IconButton(
                            onPressed: (){setState(() {
                                heart = appdata.favorite(args['name']);
                              });
                            },
                            icon: Icon(heart ? Icons.favorite : Icons.favorite_border, color: Colors.red,)
                          ),
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: 0,
                          bottom: 15,
                          right: 15,
                          left: 15),
                          child: Text(args['description'],
                            style: TextStyle(
                             fontFamily: 'Helvetica Neue',
                             fontWeight: FontWeight.bold,
                             fontSize: 11,
                             color: Colors.grey
                            )
                          ),
                      ),
                     Divider(
                       thickness: 1,
                     ),
                     Container(
                       margin: EdgeInsets.all(10),
                       child: (Text('PRINCIPAIS PONTOS TURÍSTICOS',
                            style: TextStyle(
                             fontFamily: 'Helvetica Neue',
                             fontWeight: FontWeight.bold,
                             fontSize: 12,
                             color: Colors.black
                            )
                          )
                        ),
                      ),
                      GridView.count(
                        childAspectRatio: 10/11,
                        padding: EdgeInsets.only( top: 10 ,bottom: footerHeigth),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: List.generate(args['places'].length, (index){
                          return Container(
                            child: Column(
                              children: [
                                Expanded(
                                  child: AspectRatio(
                                    aspectRatio: 1/1,
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.network(
                                          args['places'][index]['img'],
                                          fit: BoxFit.cover,
                                      )
                                    ) 
                                  )
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                    args['places'][index]['name'],
                                    style: TextStyle(
                                      fontFamily: 'Helvetica Neue',
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black
                                    )
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 15),
                                  child: Text(
                                   'Ponto turistico',
                                   style: TextStyle(
                                      fontFamily: 'Helvetica Neue',
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey
                                    )
                                  ),
                                )
                              ],
                            )
                          );
                        }),
                        crossAxisCount: 2
                      )
                    ]
                  ),
                )
              ],
            ),
            Container(margin: EdgeInsets.only(top: statusBarHeight),
              height: 50,
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white,),
                onPressed: (){
                  backButtonAction(context);
                },
              ),
            )
          ],
        )
      );
    }); 
  }
}