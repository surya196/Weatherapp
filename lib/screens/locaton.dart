import 'dart:js';

import 'package:flutter/material.dart';
import 'package:weatherapp/screens/city.dart';
import 'package:weatherapp/services/weather.dart';

import 'package:weatherapp/utilities/constant.dart';

class LocationScreen extends StatefulWidget {
  final locationdata;

  LocationScreen(this.locationdata);
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  int? temperature;
  String? condition;
  String? cityname;

  @override
  void initState() {
    super.initState();
    update(widget.locationdata);
  }

  void update(dynamic data) {
    setState(() {
      temperature = weather.getMessage(data['main']['temp']) as int?;
      condition = weather.getWeatherIcon(data['weather'][0]['id']);

      cityname = data['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/images1.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      var weatherdata = await weather.getweatherdata();
                      update(weatherdata);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      var typedname = await Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CityScreen();
                      }));
                      if(typedname!=null){
                        var data=await weather.getcityname(typedname);
                        update(data);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature',
                      style: kTempTextStyle,
                    ),
                    Text(
                      condition!,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  '$temperature in $cityname',
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
