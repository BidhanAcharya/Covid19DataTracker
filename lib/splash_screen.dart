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
  //Animation is defined in TickeyProviderState Mixing
  //Thre must be controller for animation
  late final AnimationController _controller=AnimationController(duration:const Duration(seconds: 8) ,vsync: this)..repeat();
  @override
  // init is the state that only display once before build
 void initState() {
    // TODO: implement initState
    super.initState();
    // splash screen Timer
    Timer(Duration(seconds:5),()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> StatesScreen() )));// after splash screen move to StateScreen
  }


  @override
  //once the display is ut it gets disposedd
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
            //It returns widget
            //math function must be imported dart: math
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
