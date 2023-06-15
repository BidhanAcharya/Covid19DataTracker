import 'package:covid_data_tracker/StatesScreen.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
 final String image;
  final String name;
  final String continent;
 final int totalCases,totalDeaths,totalRecovered, active, critical, todayRecovered, test;






   const DetailScreen({super.key,required this.image,required this.name,required this.continent,required this.totalCases,required this.totalDeaths, required this.todayRecovered,required this.active, required this.critical,required this.totalRecovered, required this.test});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
     appBar: AppBar(
       title: Text(name),
       centerTitle:true ,

     ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Card(
                child: Column(
                  children: [
                    ReusuableRow(title: 'Cases', value:totalCases.toString() ),
                    ReusuableRow(title: 'Continent', value:continent.toString() ),
                    ReusuableRow(title: 'Deaths', value:totalDeaths.toString() ),
                    ReusuableRow(title: 'Recovered', value:totalRecovered.toString() ),
                    ReusuableRow(title: 'Active', value:active.toString() ),
                    ReusuableRow(title: 'Critical', value:critical.toString() ),
                    ReusuableRow(title: 'Today Recovered', value:todayRecovered.toString() ),
                    ReusuableRow(title: 'Vaccinated', value:test.toString() ),


                  ],
                ),
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(image) ,
              ),

            ],
          )
        ],


      ),
    );
  }
}
