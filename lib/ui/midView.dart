
import 'package:flutter/material.dart';
import 'package:weather_app/util/convertIcons.dart';
import 'package:weather_app/util/forecast_utils.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget midView(AsyncSnapshot<Map<String, dynamic>> snapshot){

  Map<String, dynamic> forecastList = snapshot.data as Map<String, dynamic>;
  String  city = forecastList['city']['name'];
  String country = forecastList['city']['country'];
  int dateNumber =  forecastList['list'][1]['dt']*1000;
  int temp = (((forecastList['list'][1]['main']['temp'])-32)*(5/9)).ceil();
  String description = forecastList['list'][1]['weather'][0]['description'];
  double speed = forecastList['list'][1]['wind']['speed'];
  int humidity = forecastList['list'][1]['main']['humidity'];
  int maxTemp = (((forecastList['list'][1]['main']['temp_max'])-32)*(5/9)).ceil();
  String icon = forecastList['list'][1]['weather'][0]['main'];
  Container midView = Container(
    child: Padding(
    padding: const EdgeInsets.all(14),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('$city, $country', style: const TextStyle(fontWeight: FontWeight.bold,fontSize:18, color: Colors.black87 ),),
        Text(Utils.getFormattedDate(DateTime.fromMillisecondsSinceEpoch(dateNumber)), style:const TextStyle(fontSize: 15) ,),
        // const SizedBox(height: 10,),
        getWeatherIcon(weatherType: icon, size: 190),
        Padding(padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
              Text("$temp°C", style: const TextStyle(fontSize: 34, fontWeight: FontWeight.bold),),
              const SizedBox(width: 10,),
              Text(description.toUpperCase(), style: const TextStyle(fontSize: 15),)
          ],
        )
    ),
        const SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("$speed mi/h"),
              const SizedBox(height: 5,),
              const Icon(FontAwesomeIcons.wind, size: 25, color:Colors.brown)
            ],
            ),
            const SizedBox(width: 30,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("$humidity %"),
                const SizedBox(height: 5,),
                const Icon(FontAwesomeIcons.droplet, size: 25, color:Colors.brown)
              ],
            ),
            const SizedBox(width: 30,),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("$maxTemp°C"),
                const SizedBox(height: 5,),
                const Icon(FontAwesomeIcons.temperatureHigh, size: 25, color:Colors.brown)
              ],
            )
          ],
        )
      ],
    ),
    )
  );
  return midView;
}