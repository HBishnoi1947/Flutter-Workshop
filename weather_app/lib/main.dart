import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/Controllers/weather_controller.dart';

import 'Controllers/pollution_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData.light(),
      home: const FirstPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

  final WeatherController _weatherCont = Get.put(WeatherController()); 
  final PollutionController _pollutionCont = Get.put(PollutionController()); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App"),
      ),
      // body: SizedBox(
      //   height: 200,
      //   width: 200,
      //   child: Image.asset(
      //     'assets/filtered.jpeg',
      //     // fit: BoxFit.fill,
      //     )
      //   ),

      body: Obx( () =>  Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background_sky.PNG'),
              fit: BoxFit.fill,
              )
            ),
            padding: const EdgeInsets.all(15),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 250,
                    color: Colors.black26,
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(children: [
                          const Icon(Icons.location_on,size: 18,),
                          Text("Indore",style: TextStyle(fontSize: 18))
                        ],),
                        const SizedBox(height: 20,),
                        Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                          Text("${_weatherCont.temperature.value.toInt()}°C", style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
                          // Icon(Icons.sunny,size: 40,color: Colors.yellow)
                          SizedBox(
                            width: 60, height: 60,
                            child: Image.network(
                              _weatherCont.icon.value,
                              fit: BoxFit.cover,
                            ),
                          )
                        ],),
                        const SizedBox(height: 10,),
                        Text("${_weatherCont.weatherMain}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("Updated 25 May 2000",textAlign: TextAlign.end),
                          ],
                        )
                    ]),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    padding: const EdgeInsets.all(15),
                    color: Colors.black12,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Expanded(child: 
                        CustomWeatherWidget(
                          title: "Humidity",
                          value: "${_weatherCont.humidity} %",
                          icon: Icons.water_drop,
                          // )
                          ),
                          VerticalDivider(color: Colors.black,thickness: 1,),
                        // Expanded(child: 
                        CustomWeatherWidget(
                          title: "Visibility",
                          value: "${_weatherCont.visibility} km",
                          icon: Icons.visibility,
                          // )
                          ),
                        VerticalDivider(color: Colors.black,thickness: 1,),
                        // Expanded(child: 
                        CustomWeatherWidget(
                          title: "Pressure",
                          value: "${_weatherCont.pressure} hPa",
                          icon: Icons.speed,
                          // )
                          ),
                    ]),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    padding: const EdgeInsets.all(15),
                    color: Colors.black12,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Expanded(child: 
                        CustomWeatherWidget(
                          title: "Wind",
                          value: "${_weatherCont.wind} m/s",
                          icon: Icons.wind_power_outlined,
                          // )
                          ),
                          VerticalDivider(color: Colors.black,thickness: 1,),
                        // Expanded(child: 
                        CustomWeatherWidget(
                          title: "Min. Temp.",
                          value: "${_weatherCont.minTemp}° C",
                          icon: Icons.thermostat,
                          // )
                          ),
                        VerticalDivider(color: Colors.black,thickness: 1,),
                        // Expanded(child: 
                        CustomWeatherWidget(
                          title: "Max Temp.",
                          value: "${_weatherCont.maxTemp}° C",
                          icon: Icons.thermostat,
                          // )
                          ),
                    ]),
                  ),Container(
                    height: 100,
                    width: 100,
                    padding: const EdgeInsets.all(15),
                    color: Colors.black12,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Aqu Value = ${_pollutionCont.aqi}"),
                        Container(
                          height: 45,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Expanded(child: 
                              CustomWeatherWidget(
                                title: "CO",
                                value: "${_pollutionCont.co}",
                                icon: Icons.wind_power_outlined,
                                // )
                                ),
                                VerticalDivider(color: Colors.black,thickness: 1,),
                              // Expanded(child: 
                              CustomWeatherWidget(
                                title: "NO",
                                value: "${_pollutionCont.no}",
                                icon: Icons.thermostat,
                                // )
                                ),
                              VerticalDivider(color: Colors.black,thickness: 1,),
                              // Expanded(child: 
                              CustomWeatherWidget(
                                title: "SO2",
                                value: "${_pollutionCont.so2}",
                                icon: Icons.thermostat,
                                // )
                                ),
                              VerticalDivider(color: Colors.black,thickness: 1,),
                              // Expanded(child: 
                              CustomWeatherWidget(
                                title: "NH3",
                                value: "${_pollutionCont.nh3}",
                                icon: Icons.thermostat,
                                // )
                                ),
                          ]),
                        ),
                      ],
                    ),
                  )
              ]),
            ),
        ),
      ),
    );
  }
}

class CustomWeatherWidget extends StatelessWidget {
  const CustomWeatherWidget({
    Key? key, required this.icon, required this.title, required this.value,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon,color: Colors.blue),
        const SizedBox(width: 5,),
        Column(mainAxisAlignment: MainAxisAlignment.center,children: [
          Text(title,style: const TextStyle(fontWeight: FontWeight.w700),),
          Text(value),
        ],)
      ],
    );
  }
}