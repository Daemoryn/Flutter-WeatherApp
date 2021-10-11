import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/Models/current_weather_model.dart';
import 'package:weather_app/Models/seven_days_forecast_model.dart';
import 'package:weather_app/Requests/http_request.dart';
import 'package:weather_app/Cubits/city_name_cubit.dart';
import 'package:weather_icons/weather_icons.dart';

class WeatherHomePage extends StatefulWidget {
  const WeatherHomePage({Key? key}) : super(key: key);

  @override
  _WeatherHomePageState createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  TextEditingController _controller = TextEditingController();
  final _myNetwork = new Network();
  CurrentWeatherModel old_data = new CurrentWeatherModel(
      new Coord(0, 0),
      [],
      "",
      new Main(0, 0, 0, 0, 0, 0),
      0,
      new Wind(0, 0),
      new Clouds(0),
      new Rain(0, 0),
      0,
      new Sys(0, 0, "", 0, 0),
      0,
      0,
      "",
      0);

  SevenDaysForecastModel old_forecast =
      new SevenDaysForecastModel(0, 0, "", 0, []);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/sun.jpeg'), fit: BoxFit.cover),
          ),
          height: MediaQuery.of(context).size.height * 1.2,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.05),
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          fillColor: Colors.white.withOpacity(0.5),
                          filled: true,
                          border: OutlineInputBorder(),
                          hintText: "City name",
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 50,
                          ),
                        ],
                      ),
                      child: IconButton(
                        onPressed: () {
                          context.read<CityNameCubit>().cityName =
                              _controller.text;
                          context.read<CityNameCubit>().emitCityName();
                        },
                        icon: FaIcon(
                          FontAwesomeIcons.search,
                          color: Colors.white,
                          size: MediaQuery.of(context).size.height * 0.03,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              BlocBuilder<CityNameCubit, String>(
                builder: (context, cityName) {
                  return FutureBuilder<CurrentWeatherModel>(
                      future: _myNetwork.getCurrentWeatherFromCityName(
                          cityName: cityName),
                      builder: (BuildContext context,
                          AsyncSnapshot<CurrentWeatherModel> snapshot) {
                        if (snapshot.hasData && old_data != snapshot.data) {
                          old_data = snapshot.data!;
                          var currentWeather = snapshot.data!;
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color.fromRGBO(0x00, 0x00, 0x00, 0.2),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.01,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          "Today",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.08,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          new DateFormat('EE, d MMM')
                                              .format(DateTime.now()),
                                          style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.05,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.05,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${convertFahrenheitToCelcius(currentWeather.main.temp).toStringAsFixed(0)}",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.15,
                                                ),
                                              ),
                                              Icon(
                                                WeatherIcons.celsius,
                                                color: Colors.white70,
                                                size: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.1,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: getWeatherIcon(
                                              weatherDescription: currentWeather
                                                  .weather.first.main,
                                              size: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.2),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.05,
                                    ),
                                    Text(
                                      currentWeather.weather.first.main,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.2,
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.05,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Column(
                                          children: [
                                            Text(
                                              "${convertMSToKmH(currentWeather.wind.speed).toStringAsFixed(0)} Km/h",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.05,
                                              ),
                                            ),
                                            Icon(
                                              WeatherIcons.day_windy,
                                              color: Colors.blueGrey,
                                            ),
                                          ],
                                        )),
                                        Expanded(
                                            child: Column(
                                          children: [
                                            Text(
                                              "${currentWeather.main.humidity}%",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.05,
                                              ),
                                            ),
                                            Icon(
                                              WeatherIcons.day_fog,
                                              color: Colors.lightBlue,
                                            ),
                                          ],
                                        )),
                                        if (currentWeather.weather.first.main ==
                                            "Rain")
                                          if (currentWeather.rain.d1h != 0.0)
                                            Expanded(
                                                child: Column(
                                              children: [
                                                Text(
                                                  "${currentWeather.rain.d1h} mm",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.05,
                                                  ),
                                                ),
                                                Icon(
                                                  WeatherIcons.day_rain_wind,
                                                  color: Colors.blueAccent,
                                                ),
                                              ],
                                            )),
                                        if (currentWeather.weather.first.main ==
                                            "Rain")
                                          if (currentWeather.rain.d3h != 0.0)
                                            Expanded(
                                                child: Column(
                                              children: [
                                                Text(
                                                  "${currentWeather.rain.d3h} mm",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.05,
                                                  ),
                                                ),
                                                Icon(
                                                  WeatherIcons.day_rain,
                                                  color: Colors.lightBlue,
                                                ),
                                              ],
                                            )),
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.03,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(
                                                bottom: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.08,
                                                right: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.04,
                                              ),
                                              child: Icon(WeatherIcons.sunrise,
                                                  size: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.2,
                                                  color: Color.fromRGBO(
                                                      0xF7, 0xCD, 0x5D, 1)),
                                            ),
                                            Text(
                                              DateFormat("HH:mm").format(DateTime
                                                  .fromMillisecondsSinceEpoch(
                                                      currentWeather
                                                              .sys.sunrise *
                                                          1000)),
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.05,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(
                                                bottom: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.08,
                                                right: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.04,
                                              ),
                                              child: Icon(
                                                WeatherIcons.sunset,
                                                size: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.2,
                                                color: Color.fromRGBO(
                                                    0xEE, 0x5D, 0x6C, 1),
                                              ),
                                            ),
                                            Text(
                                              DateFormat("HH:mm").format(DateTime
                                                  .fromMillisecondsSinceEpoch(
                                                      currentWeather
                                                              .sys.sunset *
                                                          1000)),
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.05,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.03,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          FontAwesomeIcons.mapMarkerAlt,
                                          color: Colors.red,
                                        ),
                                        Text(
                                          " ${currentWeather.name}, ${currentWeather.sys.country}",
                                          style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.08,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.02,
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.03,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(0, 0),
                                    ),
                                  ],
                                ),
                                child: Text(
                                  "7 day forecast",
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.05,
                                    color: Colors.white,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.03,
                              ),
                              FutureBuilder<SevenDaysForecastModel>(
                                future: _myNetwork
                                    .getSevenDaysForecastFromLongAndLat(
                                        lon: currentWeather.coord.lon,
                                        lat: currentWeather.coord.lat,
                                        cityName: currentWeather.name),
                                builder: (BuildContext context,
                                    AsyncSnapshot<SevenDaysForecastModel>
                                        snapshot) {
                                  if (snapshot.hasData &&
                                      old_forecast != snapshot.data!) {
                                    old_forecast = snapshot.data!;
                                    var actualForecast = snapshot.data!;
                                    return Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.2,
                                      padding: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.02,
                                        right:
                                            MediaQuery.of(context).size.width *
                                                0.02,
                                        bottom:
                                            MediaQuery.of(context).size.width *
                                                0.02,
                                      ),
                                      child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount:
                                              actualForecast.daily.length - 1,
                                          itemBuilder: (context, index) {
                                            var daily =
                                                actualForecast.daily[index + 1];
                                            return Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Color.fromRGBO(
                                                    0x00, 0x00, 0x00, 0.3),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black
                                                        .withOpacity(0.3),
                                                    spreadRadius: 5,
                                                    blurRadius: 7,
                                                    offset: Offset(0, 3),
                                                  ),
                                                ],
                                              ),
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.4,
                                              margin: EdgeInsets.symmetric(
                                                  horizontal:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.02),
                                              child: Container(
                                                alignment: Alignment.center,
                                                child: SingleChildScrollView(
                                                  child: Column(
                                                    children: [
                                                      SizedBox(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.01,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          getWeatherIcon(
                                                              weatherDescription:
                                                                  daily
                                                                      .weather
                                                                      .first
                                                                      .main,
                                                              size: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.05),
                                                          SizedBox(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.05,
                                                          ),
                                                          Text(
                                                            new DateFormat(
                                                                    'EEEE')
                                                                .format(DateTime
                                                                    .fromMillisecondsSinceEpoch(
                                                                        daily.dt *
                                                                            1000)),
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.01,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            "${convertFahrenheitToCelcius(daily.temp.min).toStringAsFixed(0)}°C",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          Icon(
                                                              WeatherIcons
                                                                  .thermometer_exterior,
                                                              color:
                                                                  Colors.blue),
                                                          SizedBox(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.01,
                                                          ),
                                                          Text(
                                                            "${convertFahrenheitToCelcius(daily.temp.max).toStringAsFixed(0)}°C",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          Icon(
                                                              WeatherIcons
                                                                  .thermometer,
                                                              color:
                                                                  Colors.red),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.01,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            "${daily.humidity}%",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.01,
                                                          ),
                                                          Icon(
                                                            FontAwesomeIcons
                                                                .tint,
                                                            color:
                                                                Colors.blueGrey,
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.01,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            "${convertMSToKmH(daily.windSpeed).toStringAsFixed(0)} Km/h",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.01,
                                                          ),
                                                          Icon(
                                                              WeatherIcons
                                                                  .strong_wind,
                                                              color: Colors
                                                                  .white38),
                                                        ],
                                                      ),
                                                      if (daily.rain != 0.0)
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              "${daily.rain} mm",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.01,
                                                            ),
                                                            Icon(
                                                              WeatherIcons
                                                                  .day_rain_wind,
                                                              color: Colors
                                                                  .blueGrey,
                                                            ),
                                                          ],
                                                        ),
                                                      if (daily.rain != 0.0)
                                                        SizedBox(
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.01,
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          }),
                                    );
                                  } else if (snapshot.hasError) {
                                    print(
                                        "Error ->" + snapshot.error.toString());
                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.error_outline,
                                          color: Colors.red,
                                          size: 60,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 16),
                                          child: Text(
                                            'Error: ${snapshot.error}',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        )
                                      ],
                                    );
                                  } else {
                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          child: CircularProgressIndicator(),
                                          width: 60,
                                          height: 60,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 16),
                                          child: Text(
                                            "Loading data...",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        )
                                      ],
                                    );
                                  }
                                },
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.0005,
                              ),
                            ],
                          );
                        } else if (snapshot.hasError) {
                          print("Error ->" + snapshot.error.toString());
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.error_outline,
                                  color: Colors.red,
                                  size: 60,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 16),
                                  child: Text(
                                    'Error: ${snapshot.error}',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        } else {
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  child: CircularProgressIndicator(),
                                  width: 60,
                                  height: 60,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 16),
                                  child: Text(
                                    "Loading data...",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        }
                      });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getWeatherIcon(
      {required String weatherDescription, required double size}) {
    print(weatherDescription);
    switch (weatherDescription) {
      case "Clear":
        return Icon(WeatherIcons.day_sunny, color: Colors.orange, size: size);
      case "Clouds":
        return Icon(WeatherIcons.day_cloudy,
            color: Colors.blueAccent, size: size);
      case "Rain":
        return Icon(WeatherIcons.day_rain, color: Colors.blue, size: size);
      case "Snow":
        return Icon(WeatherIcons.day_snow, color: Colors.grey, size: size);
      default:
        return Icon(WeatherIcons.day_sunny_overcast,
            color: Colors.orange, size: size);
    }
  }

  double convertFahrenheitToCelcius(double usTemp) {
    return (usTemp - 273.15);
  }

  double convertMSToKmH(double speed) {
    return (speed * 3.6);
  }
}
