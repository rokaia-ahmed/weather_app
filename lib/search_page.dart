
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/services/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';
class SearchPage extends StatelessWidget {
  String? cityName ;
  SearchPage({this.updateUi});
  VoidCallback ? updateUi ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a city'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextField(
            onChanged: (data){
              cityName = data;
            },
            onSubmitted: (data) async {
              cityName = data;
              debugPrint(data);
              WeatherService service = WeatherService();
              WeatherModel? weather = await service.getWeather(cityName: cityName!);
              Provider.of<WeatherProvider>(context,listen: false).weatherData=weather;
              Provider.of<WeatherProvider>(context,listen: false).cityName = cityName;
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 25,horizontal: 15),
              labelText: 'Search',
              hintText: 'enter a city',
              suffixIcon: GestureDetector(
                onTap: ()async{
                  WeatherService service = WeatherService();
                  WeatherModel? weather = await service.getWeather(cityName: cityName!);
                  Provider.of<WeatherProvider>(context,listen: false).weatherData=weather;
                  Provider.of<WeatherProvider>(context,listen: false).cityName = cityName;
                  Navigator.pop(context);
                },
                  child: const Icon(Icons.search)),
              border: const OutlineInputBorder(),
            ),
          ),
        ),
      ),
    );
  }
}

