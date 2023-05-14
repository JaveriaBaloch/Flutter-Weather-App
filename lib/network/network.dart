
import 'package:weather_app/util/forecast_utils.dart';
import 'dart:async';
import 'package:dio/dio.dart';
class Network{
  final dio = Dio();
  Future<Map<String, dynamic>> getWeatherForecast({required String city}) async{
    final Response response;
    var finalUrl = 'https://api.openweathermap.org/data/2.5/forecast?q=$city&units=imperial&appid=${Utils.appId}';
    response = await dio.get(finalUrl);

    if(response.statusCode == 200){
      // print(response.data);
      return response.data;
    }else{
      throw Exception("Error");
    }
  }
  Future<Map<String, dynamic>> getWeatherForDay({required String city, required int day}) async{
    final Response response;
    var finalUrl = 'https://api.openweathermap.org/data/2.5/weather?q=$city&cnt=$day&APPID=${Utils.appId}';
    response = await dio.get(finalUrl);

    if(response.statusCode == 200){
      // print(response.data);
      return response.data;
    }else{
      throw Exception("Error");
    }
  }
}