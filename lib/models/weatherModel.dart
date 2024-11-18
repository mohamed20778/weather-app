import 'package:flutter/material.dart';

class WeatherModel {
  String? date;
  double? temp;
  double? maxtemp;
  double? mintemp;
  String? condition;

  WeatherModel(
      {required this.date,
      required this.condition,
      required this.maxtemp,
      required this.mintemp,
      required this.temp});

  factory WeatherModel.fromjson(dynamic data) {
    var jsondata = data['forecast']['forecastday'][0]['day'];
    print(jsondata);
    // date = data['location']['localtime'];
    // condition = jsondata['condition']['text'];
    // ;
    // ;
    // temp = jsondata['day']['avgtemp_c'];
    return WeatherModel(
      date: data['location']['localtime'],
      condition: jsondata['condition']['text'],
      maxtemp: jsondata['maxtemp_c'],
      mintemp: jsondata['mintemp_c'],
      temp: jsondata['avgtemp_c'],
    );
  }
  String getImage() {
    if (condition == 'Thunderstorm') {
      return 'assets/images/thunderstorm.png';
    } else if (condition == 'Clear' || condition == 'Light Cloud') {
      return 'assets/images/clear-sky.png';
    } else if (condition == 'Heavy Cloud' || condition == 'Cloudy') {
      return 'assets/images/cloudy.png';
    } else if (condition == 'Rain' ||
        condition == 'Moderate rain' ||
        condition == 'Heavy rain' ||
        condition == 'Patchy rain possible') {
      return 'assets/images/raining.png';
    } else if (condition == 'Sleet' ||
        condition == 'Snow' ||
        condition == 'Hail') {
      return 'assets/images/snow.png';
    } else {
      return 'assets/images/sun.png';
    }
  }

  MaterialColor getThemeColor() {
    if (condition == 'Thunderstorm') {
      return Colors.blueGrey;
    } else if (condition == 'Clear' || condition == 'Light Cloud') {
      return Colors.orange;
    } else if (condition == 'Heavy Cloud' || condition == 'Cloudy') {
      return Colors.blueGrey;
    } else if (condition == 'Rain' ||
        condition == 'Moderate rain' ||
        condition == 'Heavy rain' ||
        condition == 'Patchy rain possible') {
      return Colors.blue;
    } else if (condition == 'Sleet' ||
        condition == 'Snow' ||
        condition == 'Hail') {
      return Colors.blue;
    } else {
      return Colors.orange;
    }
  }
}
