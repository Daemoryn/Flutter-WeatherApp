class CurrentWeatherModel {
  late Coord _coord;
  late List<Weather> _weather;
  late String _base;
  late Main _main;
  late int _visibility;
  late Wind _wind;
  late Clouds _clouds;
  late Rain _rain;
  late int _dt;
  late Sys _sys;
  late int _timezone;
  late int _id;
  late String _name;
  late int _cod;

  CurrentWeatherModel(
      this._coord,
      this._weather,
      this._base,
      this._main,
      this._visibility,
      this._wind,
      this._clouds,
      this._rain,
      this._dt,
      this._sys,
      this._timezone,
      this._id,
      this._name,
      this._cod);

  Coord get coord => _coord;

  set coord(Coord coord) => _coord = coord;

  List<Weather> get weather => _weather;

  set weather(List<Weather> weather) => _weather = weather;

  String get base => _base;

  set base(String base) => _base = base;

  Main get main => _main;

  set main(Main main) => _main = main;

  int get visibility => _visibility;

  set visibility(int visibility) => _visibility = visibility;

  Wind get wind => _wind;

  set wind(Wind wind) => _wind = wind;

  Clouds get clouds => _clouds;

  set clouds(Clouds clouds) => _clouds = clouds;

  Rain get rain => _rain;

  set rain(Rain value) {
    _rain = value;
  }

  int get dt => _dt;

  set dt(int dt) => _dt = dt;

  Sys get sys => _sys;

  set sys(Sys sys) => _sys = sys;

  int get timezone => _timezone;

  set timezone(int timezone) => _timezone = timezone;

  int get id => _id;

  set id(int id) => _id = id;

  String get name => _name;

  set name(String name) => _name = name;

  int get cod => _cod;

  set cod(int cod) => _cod = cod;

  CurrentWeatherModel.fromJson(Map<String, dynamic> json) {
    _coord = json['coord'] != null
        ? new Coord.fromJson(json['coord'])
        : new Coord(0, 0);
    if (json['weather'] != null) {
      _weather = [];
      json['weather'].forEach((v) {
        _weather.add(new Weather.fromJson(v));
      });
    }
    _base = (json['base'] != null) ? json['base'] : "";
    _main = json['main'] != null
        ? new Main.fromJson(json['main'])
        : new Main(0, 0, 0, 0, 0, 0);
    _visibility = json['visibility'];
    _wind =
        json['wind'] != null ? new Wind.fromJson(json['wind']) : new Wind(0, 0);
    _clouds = json['clouds'] != null
        ? new Clouds.fromJson(json['clouds'])
        : new Clouds(0);
    _rain = (json['rain'] != null
        ? new Rain.fromJson(json['rain'])
        : new Rain(0, 0));
    _dt = json['dt'];
    _sys = json['sys'] != null
        ? new Sys.fromJson(json['sys'])
        : new Sys(0, 0, "", 0, 0);
    _timezone = (json['timezone'] != null) ? json['timezone'] : 0;
    _id = (json['id'] != null) ? json['id'] : 0;
    _name = (json['name'] != null) ? json['name'] : "";
    _cod = (json['cod'] != null) ? json['cod'] : 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._coord != null) {
      data['coord'] = this._coord.toJson();
    }
    if (this._weather != null) {
      data['weather'] = this._weather.map((v) => v.toJson()).toList();
    }
    data['base'] = this._base;
    if (this._main != null) {
      data['main'] = this._main.toJson();
    }
    data['visibility'] = this._visibility;
    if (this._wind != null) {
      data['wind'] = this._wind.toJson();
    }
    if (this._clouds != null) {
      data['clouds'] = this._clouds.toJson();
    }
    if (this._rain != null) {
      data['rain'] = this._rain.toJson();
    }
    data['dt'] = this._dt;
    if (this._sys != null) {
      data['sys'] = this._sys.toJson();
    }
    data['timezone'] = this._timezone;
    data['id'] = this._id;
    data['name'] = this._name;
    data['cod'] = this._cod;
    return data;
  }
}

class Coord {
  late double _lon;
  late double _lat;

  Coord(this._lon, this._lat);

  double get lon => _lon;

  set lon(double lon) => _lon = lon;

  double get lat => _lat;

  set lat(double lat) => _lat = lat;

  Coord.fromJson(Map<String, dynamic> json) {
    _lon = (json['lon'] != null) ? json['lon'].toDouble() : 0;
    _lat = (json['lat'] != null) ? json['lat'].toDouble() : 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lon'] = this._lon;
    data['lat'] = this._lat;
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
    _main = (json['main'] != null) ? json['main'] : 0;
    _description = (json['description'] != null) ? json['description'] : 0;
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

class Main {
  late double _temp;
  late double _feelsLike;
  late double _tempMin;
  late double _tempMax;
  late int _pressure;
  late int _humidity;

  Main(this._temp, this._feelsLike, this._tempMin, this._tempMax,
      this._pressure, this._humidity);

  double get temp => _temp;

  set temp(double temp) => _temp = temp;

  double get feelsLike => _feelsLike;

  set feelsLike(double feelsLike) => _feelsLike = feelsLike;

  double get tempMin => _tempMin;

  set tempMin(double tempMin) => _tempMin = tempMin;

  double get tempMax => _tempMax;

  set tempMax(double tempMax) => _tempMax = tempMax;

  int get pressure => _pressure;

  set pressure(int pressure) => _pressure = pressure;

  int get humidity => _humidity;

  set humidity(int humidity) => _humidity = humidity;

  Main.fromJson(Map<String, dynamic> json) {
    _temp = (json['temp'] != null) ? json['temp'].toDouble() : 0;
    _feelsLike =
        (json['feels_like'] != null) ? json['feels_like'].toDouble() : 0;
    _tempMin = (json['temp_min'] != null) ? json['temp_min'].toDouble() : 0;
    _tempMax = (json['temp_max'] != null) ? json['temp_max'].toDouble() : 0;
    _pressure = (json['pressure'] != null) ? json['pressure'] : 0;
    _humidity = (json['humidity'] != null) ? json['humidity'] : 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['temp'] = this._temp;
    data['feels_like'] = this._feelsLike;
    data['temp_min'] = this._tempMin;
    data['temp_max'] = this._tempMax;
    data['pressure'] = this._pressure;
    data['humidity'] = this._humidity;
    return data;
  }
}

class Wind {
  late double _speed;
  late int _deg;

  Wind(this._speed, this._deg);

  double get speed => _speed;

  set speed(double speed) => _speed = speed;

  int get deg => _deg;

  set deg(int deg) => _deg = deg;

  Wind.fromJson(Map<String, dynamic> json) {
    _speed = (json['speed'] != null) ? json['speed'].toDouble() : 0;
    _deg = (json['deg'] != null) ? json['deg'] : 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['speed'] = this._speed;
    data['deg'] = this._deg;
    return data;
  }
}

class Clouds {
  late int _all;

  Clouds(this._all);

  int get all => _all;

  set all(int all) => _all = all;

  Clouds.fromJson(Map<String, dynamic> json) {
    _all = (json['all'] != null) ? json['all'] : 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['all'] = this._all;
    return data;
  }
}

class Sys {
  late int _type;
  late int _id;
  late String _country;
  late int _sunrise;
  late int _sunset;

  Sys(this._type, this._id, this._country, this._sunrise, this._sunset);

  int get type => _type;

  set type(int type) => _type = type;

  int get id => _id;

  set id(int id) => _id = id;

  String get country => _country;

  set country(String country) => _country = country;

  int get sunrise => _sunrise;

  set sunrise(int sunrise) => _sunrise = sunrise;

  int get sunset => _sunset;

  set sunset(int sunset) => _sunset = sunset;

  Sys.fromJson(Map<String, dynamic> json) {
    _type = (json['type'] != null) ? json['type'] : 0;
    _id = (json['id'] != null) ? json['id'] : 0;
    _country = (json['country'] != null) ? json['country'] : "";
    _sunrise = (json['sunrise'] != null) ? json['sunrise'] : 0;
    _sunset = (json['sunset'] != null) ? json['sunset'] : 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this._type;
    data['id'] = this._id;
    data['country'] = this._country;
    data['sunrise'] = this._sunrise;
    data['sunset'] = this._sunset;
    return data;
  }
}

class Rain {
  late double _d3h;
  late double _d1h;

  Rain(this._d3h, this._d1h);

  double get d3h => _d3h;

  set d3h(double d3h) => _d3h = d3h;

  double get d1h => _d1h;

  set d1h(double value) {
    _d1h = value;
  }

  Rain.fromJson(Map<String, dynamic> json) {
    _d3h = (json['3h'] != null) ? json['3h'].toDouble() : 0;
    _d1h = (json['1h'] != null) ? json['1h'].toDouble() : 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['3h'] = this._d3h;
    data['1h'] = this._d1h;
    return data;
  }
}
