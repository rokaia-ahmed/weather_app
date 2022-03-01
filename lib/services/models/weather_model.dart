import 'package:flutter/material.dart';

class WeatherModel{
String weatherStateName ;
DateTime date ;
double temp ;
double minTemp;
double mexTemp;

WeatherModel({
  required this.weatherStateName,
 required this.date,
 required this.temp,
 required this.minTemp,
 required this.mexTemp,
});

factory WeatherModel.fromJson(Map<String,dynamic>data){
  return WeatherModel(
      weatherStateName : data['weather_state_name'],
      date: DateTime.parse(data['created']) ,
      temp : data['the_temp'] ,
      minTemp : data['min_temp'] ,
      mexTemp : data['max_temp'] ,
  );
}

MaterialColor getThemeColor(){
  if (weatherStateName =='Clear' || weatherStateName=='Light Clour') {
    return Colors.orange;
  }else if (weatherStateName=='Snow' ||weatherStateName =='Hail'){
    return Colors.blue;
  }else if (weatherStateName =='Heavy Cloud'){
    return Colors.blueGrey;
  }else if (weatherStateName =='Light Rain'||
      weatherStateName =='Heavy Rain' ||
     weatherStateName =='Showers'){
    return Colors.blue;
  }else if(weatherStateName =='Thunderstorm'){
    return Colors.yellow;
  }else {
    return Colors.blue;
  }

}


}