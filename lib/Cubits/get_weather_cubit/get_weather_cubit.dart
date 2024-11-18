import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/Cubits/get_weather_states.dart';
import 'package:weatherapp/models/weatherModel.dart';
import 'package:weatherapp/service/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(NoWeatherState());
  WeatherModel? weathermodel;
  String? cityName;
  void getWeather({required String cityName}) async {
    emit(WeatherLoadingState());
    try {
      WeatherService service = WeatherService();
      weathermodel = (await service.getWeather(cityName: cityName))!;
      emit(WeatherSuccessState());
      // ignore: unused_catch_clause
    } on Exception catch (e) {
      emit(WeatherFailureState());
    }
  }
}
