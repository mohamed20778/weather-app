import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherapp/models/weatherModel.dart';
class WeatherService
{
  String apiKey='e117f9a90efe46a39cb151139230708';
  String baseUrl='http://api.weatherapi.com/v1';
    Future<WeatherModel?> getWeather({required String cityName})
  async {
    WeatherModel? weatherData;
   try{
     Uri url=Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&aqi=no');
     http.Response response=await http.get(url) ;
     Map<String,dynamic>data=jsonDecode(response.body);
     weatherData=WeatherModel.fromjson(data);
   }catch(e)
   {
     print('error is $e');
   }
  return weatherData;

  }
}
// class WeatherService {
//   Future<void> getWeather({required String cityName}) async {
//     Uri url = Uri.parse(
//         'http://api.weatherapi.com/v1/current.json?key=e117f9a90efe46a39cb151139230708&q=London&aqi=no');
//     http.Response response = await http.get(url);
//     Map<String,dynamic>data=jsonDecode(response.body);
//   }
// }
