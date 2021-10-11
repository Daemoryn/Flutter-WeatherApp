import 'dart:convert';

import 'package:http/http.dart';
import 'package:weather_app/Models/current_weather_model.dart';
import 'package:weather_app/Models/seven_days_forecast_model.dart';

class Network {
  // String apiKey = "";

  Future<CurrentWeatherModel> getCurrentWeatherFromCityName(
      {required String cityName}) async {
    var url =
        "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey";
    final response = await get(Uri.parse(url));

    if (response.statusCode == 200) {
      return CurrentWeatherModel.fromJson(json.decode(response.body));
    } else {
      throw Exception(
          "Erreur en essayant d'obtenir la météo actuelle de $cityName");
    }
  }

  Future<SevenDaysForecastModel> getSevenDaysForecastFromLongAndLat(
      {required double lon,
      required double lat,
      required String cityName}) async {
    var url =
        "https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&exclude=hourly,minutely,alerts,current&appid=$apiKey";
    final response = await get(Uri.parse(url));

    if (response.statusCode == 200) {
      return SevenDaysForecastModel.fromJson(json.decode(response.body));
    } else {
      throw Exception(
          "Erreur en essayant d'obtenir la météo actuelle de $cityName");
    }
  }
}
