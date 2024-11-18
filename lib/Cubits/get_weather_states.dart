abstract class WeatherState {}

class NoWeatherState extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherSuccessState extends WeatherState {}

class WeatherFailureState extends WeatherState {}
