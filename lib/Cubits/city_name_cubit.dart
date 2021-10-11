import 'package:bloc/bloc.dart';

class CityNameCubit extends Cubit<String> {
  String _cityName = "Paris";

  CityNameCubit() : super("Paris");

  set cityName(String value) {
    _cityName = value;
  }

  void emitCityName() {
    print(_cityName);
    emit(_cityName);
  }
}
