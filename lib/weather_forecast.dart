

import 'package:flutter/material.dart';
import 'package:weather_app/network/network.dart';
import 'package:weather_app/ui/botton_view.dart';
import 'dart:async';

import 'package:weather_app/ui/midView.dart';

class Weather_Forecast extends StatefulWidget{
  const Weather_Forecast({super.key});

  @override
  _Weather_Forecast createState() => _Weather_Forecast();

}
class _Weather_Forecast extends State<Weather_Forecast>{
  late Future <Map<String, dynamic>> forecastObject;
  String _city = "Mumbai";
  Map<String, dynamic> getInfo ={};
  @override
  void initState(){
    super.initState();
    forecastObject = getWeatherInfo(city: _city);
    forecastObject.then((weather) => {
      weather
    });
    // getInfo.forEach((key, value) {
    //   print(key);
    //   print(value);
    // });
    // print(getInfo['data']);
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Forecast"),
      ),
      body: ListView(
        children: <Widget>[
          textFieldView(),
          FutureBuilder<Map<String, dynamic>>(
            future: forecastObject,
            builder: (BuildContext context,AsyncSnapshot<Map<String, dynamic>> snapshot){
              if(snapshot.hasData){
                    return Column(
                      children: <Widget>[
                        midView(snapshot),
                        const SizedBox(height: 50,),
                        bottomView(snapshot)
                      ],
                    );
              }else{
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

            },
          )
        ],
      ),
    );
  }

  Widget textFieldView() {
    return Container(
      width: MediaQuery.of(context).size.width*0.8,
      alignment: Alignment.topCenter,
      child: TextField(
        decoration: InputDecoration(
          hintText:"Enter City Name",
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10)
          ),
            contentPadding: const EdgeInsets.all(8)
        ),
        onSubmitted: ((value)=>{
          setState(()=>{
            _city = value,
            getWeatherInfo(city: value)
          })
        }),
      ),
    );
  }

  Future<Map<String, dynamic>> getWeatherInfo({required String city}) =>   forecastObject =
      Network().getWeatherForecast(city: _city);

}