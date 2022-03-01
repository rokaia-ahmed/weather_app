
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/search_page.dart';
import 'package:weather_app/services/models/weather_model.dart';
class HomePage extends StatefulWidget {
   HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void updateUi(){
    setState(() {

    });
  }
  WeatherModel? weatherData ;
  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
      appBar:AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context,
                MaterialPageRoute(builder:(context)=> SearchPage(
                  updateUi: updateUi,
                ),
                ),
            );
          },
              icon: const Icon(Icons.search)),
        ],
      ) ,
       body: Provider.of<WeatherProvider>(context,listen: true).weatherData == null? Center(
         child: Column(
           mainAxisSize: MainAxisSize.min,
           children: const [
             Text(' There is no weather 😔 ',
               style: TextStyle(
                 fontSize: 30,
               ),
             ),
             Text(' start search now 🔎',
               style: TextStyle(
                 fontSize: 30,
               ),
             ),
           ],
         ),
       ) : Container(
         decoration: BoxDecoration(
           gradient: LinearGradient(
             colors:[
               weatherData!.getThemeColor(),
               weatherData!.getThemeColor()[300]!,
               weatherData!.getThemeColor()[100]!,
             ],
             begin:Alignment.topCenter,
             end: Alignment.bottomCenter,
           ),
         ),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
            const Spacer(
               flex: 3,
             ),
             Text( Provider.of<WeatherProvider>(context).cityName!,
               style: const TextStyle(
                 fontSize: 32,
                 fontWeight: FontWeight.bold,
               ),
             ),
             Text(
             'update at :${weatherData!.date.hour.toString()}:${weatherData!.date.minute.toString()}',
               style: const TextStyle(
                 fontSize: 17,
               ),
             ),
             const Spacer(),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 Image.asset('images/sun.png',
                      width: 60 ,
                     height: 60,
                 ),
                 Text(weatherData!.temp.toInt().toString(),
                   style: const TextStyle(
                     fontSize: 17,
                     fontWeight: FontWeight.bold,
                   ),
                 ),
                 Column(
                   children: [
                     Text('maxTem : ${weatherData!.mexTemp.toInt()}'),
                     Text('minTem : ${weatherData!.minTemp.toInt()}'),
                   ],
                 ),
               ],
             ),
             const Spacer(),
              Text(weatherData!.weatherStateName,
               style: const TextStyle(
                 fontSize: 32,
                 fontWeight: FontWeight.bold,
               ),
             ),
             const Spacer(
               flex: 6,
             ),
           ],
         ),
       ),
    );
  }
}
