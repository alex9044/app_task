import 'package:flutter/material.dart';


class CityBox extends StatelessWidget {
  CityBox({
    @required 
    this.data,
    this.onTap
  });

  final data;
  final Function onTap;
  @override 
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.all(10),
      child: GestureDetector(
      onTap: (){
        onTap(data);
      },
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: 1/1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey),
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            right: 0,
            bottom: 0,
            child: ClipRRect(
              child: Image.network(data['places'][0]['img'],
                fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(20))),
          Positioned(
            left: 0,
            top: 0,
            right: 0,
            bottom: 0,
            child: Container(
              
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black
                  ]
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            )
          ),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child:Text(
              data['name'],
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
              textAlign: TextAlign.center
            )
          )
        ],
      ),
    )
    );
  }
}