import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
 final String image;
  final String name;
  final String continent;
 final int totalCases,totalDeaths,totalRecovered, active, critical, todayRecovered, test;






   DetailScreen({super.key,required this.image,required this.name,required this.continent,required this.totalCases,required this.totalDeaths, required this.todayRecovered,required this.active, required this.critical,required this.totalRecovered, required this.test});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
     appBar: AppBar(
       title: Text(widget.name),
       centerTitle:true ,
     ),

    );
  }
}
