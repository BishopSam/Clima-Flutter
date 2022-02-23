import 'dart:io';

import 'package:clima/services/weather.dart';
import 'package:clima/utilities/show_alert_dialog.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';



class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  void getLocationData () async {
  
  try {var weatherData = await WeatherModel().getLocationWeather();
   Navigator.push(context, MaterialPageRoute(builder: (context) => LocationScreen(locationWeather: weatherData,)));
   } on SocketException catch (_) {
           showAlertDialog(context: context, title: 'Connection Error', content: 'Ensure you\'re connected to the internet', defaultActionText: 'OK');
   } catch (_) {
           showAlertDialog(context: context, title: 'Error', content: 'An Unkown Error Occured', defaultActionText: 'OK');
   }
  }


  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Center(child: SpinKitDoubleBounce(color: Colors.white, size: 100,),),
    );
  }
}
