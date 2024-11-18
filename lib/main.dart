// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/Cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weatherapp/home_page.dart';

void main() {
  runApp(BlocProvider(
      create: (context) {
        return GetWeatherCubit();
      },
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch:
            BlocProvider.of<GetWeatherCubit>(context).weathermodel == Null
                ? Colors.blue
                : BlocProvider.of<GetWeatherCubit>(context)
                    .weathermodel
                    ?.getThemeColor(),
      ),
      home: SearchPage(),
    );
  }
}
