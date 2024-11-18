import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/models/weatherModel.dart';
import 'package:weatherapp/provider/weather_provider.dart';
import 'package:weatherapp/searchCity.dart';

class searchPage extends StatefulWidget {
  const searchPage({super.key});

  @override
  State<searchPage> createState() => _searchPageState();
}

class _searchPageState extends State<searchPage> {
  WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Weather')),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const searchCity()));
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: Provider.of<WeatherProvider>(context).weatherData == null
          ? const Padding(
              padding: EdgeInsets.all(21.0),
              child: Center(
                  child: Text(
                'there is no weather start search now',
                style: TextStyle(fontSize: 25),
              )),
            )
          : Center(
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  weatherData!.getThemeColor(),
                  weatherData!.getThemeColor()[300]!,
                  weatherData!.getThemeColor()[100]!
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(
                      flex: 3,
                    ),
                    Text(
                      Provider.of<WeatherProvider>(context).cityName.toString(),
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Updated:${weatherData?.date.toString() ?? ''}',
                      style: const TextStyle(fontSize: 32),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            weatherData!.getImage(),
                            height: 200,
                            width: 200,
                          ),
                          Text(
                            weatherData?.temp.toString() ?? '',
                            style: const TextStyle(
                                fontSize: 32, fontWeight: FontWeight.bold),
                          ),
                          Column(
                            children: [
                              Text('MaxTemp:'
                                  '${weatherData!.maxtemp.toString()}'),
                              Text('MinTemp:'
                                  ' ${weatherData!.mintemp.toString()}'),
                            ],
                          ),
                        ]),
                    const Spacer(
                      flex: 2,
                    ),
                    Text(
                      weatherData!.condition ?? '',
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(
                      flex: 3,
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
