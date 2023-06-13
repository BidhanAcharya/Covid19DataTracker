import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math'as math ;
import 'StatesScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>with TickerProviderStateMixin {
  late final AnimationController _controller=AnimationController(duration:const Duration(seconds: 8) ,vsync: this)..repeat();
  @override
 void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds:8),()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> StatesScreen() )));
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AnimatedBuilder(
          child: Container(
            height: 250,
            width: 250,
            child: Center(
              child: Image(image:  AssetImage('assets/corona.png'),),
            ),
          ),
            animation: _controller, builder: (BuildContext context, Widget? child){
              return Transform.rotate(angle:_controller.value * 2.0 * math.pi , child: child,);
        }),
       //SizedBox(height: MediaQuery.of(context).size.height * 0.8),
        SizedBox(height: 20,),
         Align(
           alignment: Alignment.center,
             child: Text('Covid Data Tracker',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),))


       ],
        ),
      ),
    );
  }
}
