import 'package:flutter/material.dart';
import 'package:weatherapp/screens/loading.dart';
void main(){
  MyApp();
}
class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Loadingscreen(),

      
    );
  }
}

