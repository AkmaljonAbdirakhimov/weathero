import 'package:weathero/core/helper/env_helper.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/network/network.dart';
import '../models/open_meteo_hourly_response_model.dart';
import '../models/weather_news_model.dart';
import 'hourly_forecast_repo.dart';

class HourlyForecastRepoImpl extends HourlyForecastRepository {
  @override
  Future<Either<Failure, OpenMeteoHourlyResponse>> fetchWeatherData(
      double? latitude, double? longitude) async {
    try {
      var result = await NetworkHelper.instance.get(
        endPoint: EndPoints.forecast,
        params: {
          'hourly': 'temperature_2m,relative_humidity_2m,weather_code,is_day',
          'daily':
              'weather_code,temperature_2m_max,temperature_2m_min,apparent_temperature_max,apparent_temperature_min,sunrise,sunset,daylight_duration,sunshine_duration,uv_index_max,rain_sum,wind_speed_10m_max',
          'timezone': 'auto',
          'forecast_days': 1,
          'forecast_hours': 24,
          'latitude': latitude,
          'longitude': longitude,
        },
      );
      final data = OpenMeteoHourlyResponse.fromJson(result.data);
      return right(data);
    } catch (e) {
      return left(ErrorHandler.handle(e).failure!);
    }
  }

  @override
  Future<Either<Failure, WeatherNewsModel>> fetchWeatherNews() async {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: NEWS_BASE_URL,
        receiveDataWhenStatusError: true,
      ),
    );
    try {
      var result = await dio.get(
        EndPoints.weatherNews,
        queryParameters: {'q': 'weather', 'apiKey': EnvHelper.NEWS_API_KEY},
      );
      final data = WeatherNewsModel.fromJson(result.data);
      print(data.title);
      return right(data);
    } catch (e) {
      return left(ErrorHandler.handle(e).failure!);
    }
  }
}
