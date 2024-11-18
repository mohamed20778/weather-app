import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/Cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchCity extends StatefulWidget {
  const SearchCity({super.key});

  @override
  State<SearchCity> createState() => _SearchCityState();
}

class _SearchCityState extends State<SearchCity> {
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
                      BlocProvider.of<GetWeatherCubit>(context).cityName =
                          cityName;
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
