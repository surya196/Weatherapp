import 'package:weatherapp/services/loc.dart';
import 'package:weatherapp/services/network.dart';

const apikey = '7dd8578ab9e71899bc53be4d7ba1bdb5';
const openweatherurl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getcityname(String cityname) async {
    Networkhelper helper = Networkhelper('$openweatherurl?q=$cityname&appid=$apikey&units=metric');
  
  var data = await helper.getdata();
    return data;
  }
  Future<dynamic> getweatherdata() async {
    Location location = Location();
    await location.getcurrentLocation();

    // ignore: unused_local_variable
    Networkhelper helper = Networkhelper(
        '$openweatherurl?lat=${location.latitude}&lon=${location.longtitude}&appid=$apikey&units=metric');

    // ignore: unused_local_variable
    var weartherdata = await helper.getdata();
    return weartherdata;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
