import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/home_page.dart';
import 'package:weather_app/providers/weather_provider.dart';

void main() {
  runApp( ChangeNotifierProvider(
      create: (BuildContext context) {
        return WeatherProvider() ;
      },
      child: MyApp()));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Provider.of<WeatherProvider>(context).weatherData == null ?
        Colors.blue : Provider.of<WeatherProvider>(context).weatherData!.getThemeColor(),
      ),
      home:HomePage() ,
    );
  }
}
