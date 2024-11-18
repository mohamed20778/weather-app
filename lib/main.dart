import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/Cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weatherapp/provider/weather_provider.dart';
import 'package:weatherapp/Home_view.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) {
        return WeatherProvider();
      },
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch:
              Provider.of<WeatherProvider>(context).weatherData == Null
                  ? Colors.blue
                  : Provider.of<WeatherProvider>(context)
                      .weatherData
                      ?.getThemeColor(),
        ),
        home: const searchPage(),
      ),
    );
  }
}
