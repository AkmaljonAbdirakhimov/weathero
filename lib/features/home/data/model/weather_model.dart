import 'package:weathero/core/enum/weather_state.dart';
import 'package:weathero/features/home/data/model/weather_theme.dart';

class OpenMeteoCurrentResponse {
  String time;
  num temperature;
  int isDay;
  int weatherCode;

  OpenMeteoCurrentResponse({
    required this.time,
    required this.temperature,
    required this.isDay,
    required this.weatherCode,
  });

  factory OpenMeteoCurrentResponse.fromJson(Map<String, dynamic> json) {
    return OpenMeteoCurrentResponse(
      time: json['current']['time'],
      temperature: json['current']['temperature_2m'],
      isDay: json['current']['is_day'],
      weatherCode: json['current']['weather_code'],
    );
  }
}

class WeatherData {
  final String date;
  final num temperature;
  final WeatherState weatherState;
  final WeatherTheme theme;
  final bool isDay;

  WeatherData({
    required this.date,
    required this.temperature,
    required this.weatherState,
    required this.theme,
    required this.isDay,
  });
}
