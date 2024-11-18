import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/Cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weatherapp/models/weatherModel.dart';
import 'package:weatherapp/provider/weather_provider.dart';
import 'package:weatherapp/service/weather_service.dart';

class searchCity extends StatefulWidget {
  const searchCity({super.key});

  @override
  State<searchCity> createState() => _searchCityState();
}

class _searchCityState extends State<searchCity> {
  String? cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a City'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: TextFormField(
              onChanged: (data) {
                cityName = data;
              },
              onFieldSubmitted: (data) async {},
              decoration: InputDecoration(
                label: const Text('search a city'),
                suffixIcon: GestureDetector(
                    onTap: () async {
                      BlocProvider.of<GetWeatherCubit>(context)
                          .getWeather(cityName: cityName!);
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.search)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
