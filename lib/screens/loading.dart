import 'package:flutter/material.dart';
import 'package:weatherapp/services/loc.dart';

class Loadingscreen extends StatefulWidget {
  const Loadingscreen({Key? key}) : super(key: key);

  @override
  _LoadingscreenState createState() => _LoadingscreenState();
}

class _LoadingscreenState extends State<Loadingscreen> {
  @override
  initState() {
    super.initState();
    getlocation();
  }

  void getlocation() async {
    Location location = Location();
    await location.getcurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          child: Text('Location'),
          onPressed: () {
            getlocation();
          },
        ),
      ),
    );
  }
}
