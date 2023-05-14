import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget getWeatherIcon ({required String weatherType,required double size}){
  switch(weatherType){
    case "Clear":
      return Icon(FontAwesomeIcons.sun,color: Colors.orange,size: size,);
    case "Clouds":
      return Icon(FontAwesomeIcons.cloud,color: Colors.blueGrey,size: size,);
    case "Rain":
      return Icon(FontAwesomeIcons.cloudRain,color: Colors.lightBlueAccent,size: size,);
    case "Snow":
      return Icon(FontAwesomeIcons.snowman,color: Colors.blueAccent,size: size,);
    default:
      return Icon(FontAwesomeIcons.sun,color:Colors.orange,size: size,);
  }
}