import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/util/convertIcons.dart';
import 'package:weather_app/util/forecast_utils.dart';

Widget foreCastCard(AsyncSnapshot<Map<String, dynamic>> snapshot, int index){
  Map<String, dynamic> forecastList = snapshot.data as Map<String, dynamic>;
  Map<String, dynamic>   item = forecastList['list'][(index*8).round()];
  int fullDate = item['dt']*1000;
  String icon = item['weather'][0]['main'];
  int tempMin = (((item['main']['temp_min'])-32)*(5/9)).ceil();
  int tempMax =(((item['main']['temp_max'])-32)*(5/9)).ceil();
  int wind = (item['wind']['speed']).ceil();
  int humidity = (item['main']['humidity']).ceil();

  String fullDay =  Utils.getDay(DateTime.fromMillisecondsSinceEpoch(fullDate));
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 5,),
              Text(fullDay,style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w300, color: Colors.black),),
          const SizedBox(height: 25,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(width: 10,),
              CircleAvatar(
                radius: 33,
                backgroundColor: Colors.white,
                child: getWeatherIcon(weatherType: icon, size: 35),
              ),
              const SizedBox(width: 20,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text("$tempMin°C", style: const TextStyle(fontSize: 14),),
                          const SizedBox(width: 8,),
                          const CircleAvatar(
                            radius: 8,
                            backgroundColor: Colors.white,
                            child: Icon(FontAwesomeIcons.arrowDown,color: Colors.deepPurple,size: 8,),
                          )
                        ],
                      ),
                  const SizedBox(height: 4,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text("$tempMax°C", style: const TextStyle(fontSize: 14),),
                      const SizedBox(width: 8,),
                      const CircleAvatar(
                        radius: 8,
                        backgroundColor: Colors.white,
                        child: Icon(FontAwesomeIcons.arrowUp,color: Colors.deepPurple,size: 8,),
                      )
                    ],
                  ),
                  const SizedBox(height: 4,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const Icon(FontAwesomeIcons.wind,color: Colors.white,size: 15,),
                      Text("$wind mi/h", style: const TextStyle(fontSize: 14),),
                    ],
                  ),
                  const SizedBox(height: 4,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Icon(FontAwesomeIcons.droplet,color: Colors.white,size: 15,),
                      Text("$humidity %", style: const TextStyle(fontSize: 14),),
                    ],
                  )
                ],
              ),
            ],
          )
        ]
      );
}