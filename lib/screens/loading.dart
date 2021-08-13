

import 'package:flutter/material.dart';
import 'package:weatherapp/screens/locaton.dart';
import 'package:weatherapp/services/weather.dart';



class Loadingscreen extends StatefulWidget {
  const Loadingscreen({Key? key}) : super(key: key);

  @override
  _LoadingscreenState createState() => _LoadingscreenState();
}

class _LoadingscreenState extends State<Loadingscreen> {
  
  double? lat;
  double? lang;
  @override
  initState() {
    super.initState();
    getlocationdata();
  }

  void getlocationdata() async {
   
   var weather = await WeatherModel().getweatherdata();
    Navigator.push(context,
    MaterialPageRoute(builder:(context){
      return LocationScreen(weather);
    }));
    
  }

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(value: 7,)
      ),
    );
  }
}
