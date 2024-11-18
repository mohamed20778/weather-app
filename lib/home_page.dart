import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/Cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weatherapp/Cubits/get_weather_states.dart';
import 'package:weatherapp/models/weatherModel.dart';
import 'package:weatherapp/search_city.dart';

class SearchPage extends StatelessWidget {
  WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Weather')),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SearchCity()));
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WeatherSuccessState) {
            weatherData =
                BlocProvider.of<GetWeatherCubit>(context).weathermodel;
            return Center(
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
                      BlocProvider.of<GetWeatherCubit>(context).cityName!,
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
            );
          } else if (state is WeatherFailureState) {
            return const Center(
              child: Text('SomeThing Went Wrong Please Trt Again'),
            );
          } else {
            return const Padding(
              padding: EdgeInsets.all(21.0),
              child: Center(
                  child: Text(
                'there is no weather start search now',
                style: TextStyle(fontSize: 25),
              )),
            );
          }
        },
      ),
      // body: true
      //     ? const Padding(
      //         padding: EdgeInsets.all(21.0),
      //         child: Center(
      //             child: Text(
      //           'there is no weather start search now',
      //           style: TextStyle(fontSize: 25),
      //         )),
      //       )
      //     :
    );
  }
}
