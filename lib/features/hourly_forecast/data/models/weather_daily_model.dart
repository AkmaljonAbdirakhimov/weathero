import 'package:weathero/features/home/data/model/weather_theme.dart';

class WeatherDaily {
  final List<String> time;
  final List<num> temperature2mMax;
  final List<num> temperature2mMin;
  final List<num> apparentTemperatureMax;
  final List<num> apparentTemperatureMin;
  final List<String> sunrise;
  final List<String> sunset;
  final List<num> daylightDuration;
  final List<num> sunshineDuration;
  final List<num> uvIndexMax;
  final List<num?> rainSum;
  final List<num?> windSpeed;

  WeatherDaily(
      {required this.time,
      required this.temperature2mMax,
      required this.temperature2mMin,
      required this.apparentTemperatureMax,
      required this.apparentTemperatureMin,
      required this.sunrise,
      required this.sunset,
      required this.daylightDuration,
      required this.sunshineDuration,
      required this.uvIndexMax,
      required this.rainSum,
      required this.windSpeed});

  factory WeatherDaily.fromJson(Map<String, dynamic> json) {
    return WeatherDaily(
      time: List<String>.from(json['time']),
      temperature2mMax: List<num>.from(json['temperature_2m_max']),
      temperature2mMin: List<num>.from(json['temperature_2m_min']),
      apparentTemperatureMax: List<num>.from(json['apparent_temperature_max']),
      apparentTemperatureMin: List<num>.from(json['apparent_temperature_min']),
      sunrise: List<String>.from(json['sunrise']),
      sunset: List<String>.from(json['sunset']),
      daylightDuration: List<num>.from(json['daylight_duration']),
      sunshineDuration: List<num>.from(json['sunshine_duration']),
      uvIndexMax: List<num>.from(json['uv_index_max']),
      rainSum: List<num>.from(json['rain_sum']),
      windSpeed: List<num>.from(json['wind_speed_10m_max']),
    );
  }
}

class Daily {
  final String date;
  final num temperatureMax;
  final num temperatureMin;
  final num apparentTemperature;
  final String sunrise;
  final String sunset;
  final num daylightDuration;
  final num sunshineDuration;
  final num uvIndexMax;
  final num? humidity;
  final num? windSpeed;
  final WeatherTheme theme;

  Daily(
      {required this.date,
      required this.temperatureMax,
      required this.temperatureMin,
      required this.apparentTemperature,
      required this.sunrise,
      required this.sunset,
      required this.daylightDuration,
      required this.sunshineDuration,
      required this.uvIndexMax,
      required this.theme,
      required this.humidity,
      required this.windSpeed});
}
