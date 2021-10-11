class SevenDaysForecastModel {
  late double _lat;
  late double _lon;
  late String _timezone;
  late int _timezoneOffset;
  late List<Daily> _daily;

  SevenDaysForecastModel(
      this._lat, this._lon, this._timezone, this._timezoneOffset, this._daily);

  double get lat => _lat;

  set lat(double lat) => _lat = lat;

  double get lon => _lon;

  set lon(double lon) => _lon = lon;

  String get timezone => _timezone;

  set timezone(String timezone) => _timezone = timezone;

  int get timezoneOffset => _timezoneOffset;

  set timezoneOffset(int timezoneOffset) => _timezoneOffset = timezoneOffset;

  List<Daily> get daily => _daily;

  set daily(List<Daily> daily) => _daily = daily;

  SevenDaysForecastModel.fromJson(Map<String, dynamic> json) {
    _lat = (json['lat'] != null) ? json['lat'].toDouble() : 0;
    _lon = (json['lon'] != null) ? json['lon'].toDouble() : 0;
    _timezone = (json['timezone'] != null) ? json['timezone'] : 0;
    _timezoneOffset =
        (json['timezone_offset'] != null) ? json['timezone_offset'] : 0;
    if (json['daily'] != null) {
      _daily = [];
      json['daily'].forEach((v) {
        _daily.add(new Daily.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this._lat;
    data['lon'] = this._lon;
    data['timezone'] = this._timezone;
    data['timezone_offset'] = this._timezoneOffset;
    if (this._daily != null) {
      data['daily'] = this._daily.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Daily {
  late int _dt;
  late int _sunrise;
  late int _sunset;
  late int _moonrise;
  late int _moonset;
  late double _moonPhase;
  late Temp _temp;
  late FeelsLike _feelsLike;
  late int _pressure;
  late int _humidity;
  late double _dewPoint;
  late double _windSpeed;
  late int _windDeg;
  late double _windGust;
  late List<Weather> _weather;
  late int _clouds;
  late double _pop;
  late double _uvi;
  late double _rain;

  Daily(
      this._dt,
      this._sunrise,
      this._sunset,
      this._moonrise,
      this._moonset,
      this._moonPhase,
      this._temp,
      this._feelsLike,
      this._pressure,
      this._humidity,
      this._dewPoint,
      this._windSpeed,
      this._windDeg,
      this._windGust,
      this._weather,
      this._clouds,
      this._pop,
      this._uvi,
      this._rain);

  int get dt => _dt;

  set dt(int dt) => _dt = dt;

  int get sunrise => _sunrise;

  set sunrise(int sunrise) => _sunrise = sunrise;

  int get sunset => _sunset;

  set sunset(int sunset) => _sunset = sunset;

  int get moonrise => _moonrise;

  set moonrise(int moonrise) => _moonrise = moonrise;

  int get moonset => _moonset;

  set moonset(int moonset) => _moonset = moonset;

  double get moonPhase => _moonPhase;

  set moonPhase(double moonPhase) => _moonPhase = moonPhase;

  Temp get temp => _temp;

  set temp(Temp temp) => _temp = temp;

  FeelsLike get feelsLike => _feelsLike;

  set feelsLike(FeelsLike feelsLike) => _feelsLike = feelsLike;

  int get pressure => _pressure;

  set pressure(int pressure) => _pressure = pressure;

  int get humidity => _humidity;

  set humidity(int humidity) => _humidity = humidity;

  double get dewPoint => _dewPoint;

  set dewPoint(double dewPoint) => _dewPoint = dewPoint;

  double get windSpeed => _windSpeed;

  set windSpeed(double windSpeed) => _windSpeed = windSpeed;

  int get windDeg => _windDeg;

  set windDeg(int windDeg) => _windDeg = windDeg;

  double get windGust => _windGust;

  set windGust(double windGust) => _windGust = windGust;

  List<Weather> get weather => _weather;

  set weather(List<Weather> weather) => _weather = weather;

  int get clouds => _clouds;

  set clouds(int clouds) => _clouds = clouds;

  double get pop => _pop;

  set pop(double pop) => _pop = pop;

  double get uvi => _uvi;

  set uvi(double uvi) => _uvi = uvi;

  double get rain => _rain;

  set rain(double rain) => _rain = rain;

  Daily.fromJson(Map<String, dynamic> json) {
    _dt = (json['dt'] != null) ? json['dt'] : 0;
    _sunrise = (json['sunrise'] != null) ? json['sunrise'] : 0;
    _sunset = (json['sunset'] != null) ? json['sunset'] : 0;
    _moonrise = (json['moonrise'] != null) ? json['moonrise'] : 0;
    _moonset = (json['moonset'] != null) ? json['moonset'] : 0;
    _moonPhase =
        (json['moon_phase'] != null) ? json['moon_phase'].toDouble() : 0;
    _temp = json['temp'] != null
        ? new Temp.fromJson(json['temp'])
        : new Temp(0, 0, 0, 0, 0, 0);
    _feelsLike = json['feels_like'] != null
        ? new FeelsLike.fromJson(json['feels_like'])
        : new FeelsLike(0, 0, 0, 0);
    _pressure = (json['pressure'] != null) ? json['pressure'] : 0;
    _humidity = (json['humidity'] != null) ? json['humidity'] : 0;
    _dewPoint = (json['dew_point'] != null) ? json['dew_point'].toDouble() : 0;
    _windSpeed =
        (json['wind_speed'] != null) ? json['wind_speed'].toDouble() : 0;
    _windDeg = (json['wind_deg'] != null) ? json['wind_deg'] : 0;
    _windGust = (json['wind_gust'] != null) ? json['wind_gust'].toDouble() : 0;
    if (json['weather'] != null) {
      _weather = [];
      json['weather'].forEach((v) {
        _weather.add(new Weather.fromJson(v));
      });
    }
    _clouds = (json['clouds'] != null) ? json['clouds'] : 0;
    _pop = (json['pop'] != null) ? json['pop'].toDouble() : 0;
    _uvi = (json['uvi'] != null) ? json['uvi'].toDouble() : 0;
    _rain = (json['rain'] != null) ? json['rain'].toDouble() : 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dt'] = this._dt;
    data['sunrise'] = this._sunrise;
    data['sunset'] = this._sunset;
    data['moonrise'] = this._moonrise;
    data['moonset'] = this._moonset;
    data['moon_phase'] = this._moonPhase;
    if (this._temp != null) {
      data['temp'] = this._temp.toJson();
    }
    if (this._feelsLike != null) {
      data['feels_like'] = this._feelsLike.toJson();
    }
    data['pressure'] = this._pressure;
    data['humidity'] = this._humidity;
    data['dew_point'] = this._dewPoint;
    data['wind_speed'] = this._windSpeed;
    data['wind_deg'] = this._windDeg;
    data['wind_gust'] = this._windGust;
    if (this._weather != null) {
      data['weather'] = this._weather.map((v) => v.toJson()).toList();
    }
    data['clouds'] = this._clouds;
    data['pop'] = this._pop;
    data['uvi'] = this._uvi;
    data['rain'] = this._rain;
    return data;
  }
}

class Temp {
  late double _day;
  late double _min;
  late double _max;
  late double _night;
  late double _eve;
  late double _morn;

  Temp(this._day, this._min, this._max, this._night, this._eve, this._morn);

  double get day => _day;

  set day(double day) => _day = day;

  double get min => _min;

  set min(double min) => _min = min;

  double get max => _max;

  set max(double max) => _max = max;

  double get night => _night;

  set night(double night) => _night = night;

  double get eve => _eve;

  set eve(double eve) => _eve = eve;

  double get morn => _morn;

  set morn(double morn) => _morn = morn;

  Temp.fromJson(Map<String, dynamic> json) {
    _day = (json['day'] != null) ? json['day'].toDouble() : 0;
    _min = (json['min'] != null) ? json['min'].toDouble() : 0;
    _max = (json['max'] != null) ? json['max'].toDouble() : 0;
    _night = (json['night'] != null) ? json['night'].toDouble() : 0;
    _eve = (json['eve'] != null) ? json['eve'].toDouble() : 0;
    _morn = (json['morn'] != null) ? json['morn'].toDouble() : 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this._day;
    data['min'] = this._min;
    data['max'] = this._max;
    data['night'] = this._night;
    data['eve'] = this._eve;
    data['morn'] = this._morn;
    return data;
  }
}

class FeelsLike {
  late double _day;
  late double _night;
  late double _eve;
  late double _morn;

  FeelsLike(this._day, this._night, this._eve, this._morn);

  double get day => _day;

  set day(double day) => _day = day;

  double get night => _night;

  set night(double night) => _night = night;

  double get eve => _eve;

  set eve(double eve) => _eve = eve;

  double get morn => _morn;

  set morn(double morn) => _morn = morn;

  FeelsLike.fromJson(Map<String, dynamic> json) {
    _day = (json['day'] != null) ? json['day'].toDouble() : 0;
    _night = (json['night'] != null) ? json['night'].toDouble() : 0;
    _eve = (json['eve'] != null) ? json['eve'].toDouble() : 0;
    _morn = (json['morn'] != null) ? json['morn'].toDouble() : 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this._day;
    data['night'] = this._night;
    data['eve'] = this._eve;
    data['morn'] = this._morn;
    return data;
  }
}

class Weather {
  late int _id;
  late String _main;
  late String _description;
  late String _icon;

  Weather(this._id, this._main, this._description, this._icon);

  int get id => _id;

  set id(int id) => _id = id;

  String get main => _main;

  set main(String main) => _main = main;

  String get description => _description;

  set description(String description) => _description = description;

  String get icon => _icon;

  set icon(String icon) => _icon = icon;

  Weather.fromJson(Map<String, dynamic> json) {
    _id = (json['id'] != null) ? json['id'] : 0;
    _main = (json['main'] != null) ? json['main'] : "";
    _description = (json['description'] != null) ? json['description'] : "";
    _icon = (json['icon'] != null) ? json['icon'] : "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['main'] = this._main;
    data['description'] = this._description;
    data['icon'] = this._icon;
    return data;
  }
}
