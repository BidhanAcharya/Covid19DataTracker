import 'package:covid_data_tracker/Model/WorldStateModel.dart';
import 'package:covid_data_tracker/Services/states_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:pie_chart/pie_chart.dart';

import 'Countries_List.dart';

class StatesScreen extends StatefulWidget {
  const StatesScreen({super.key});

  @override
  State<StatesScreen> createState() => _StatesScreenState();
}

class _StatesScreenState extends State<StatesScreen> with  TickerProviderStateMixin{
  late final AnimationController _controller=AnimationController(duration:const Duration(seconds: 8) ,vsync: this)..repeat();
// this controller is for spinkit

  // List can contain anything it can also store the value for class which is defined in another  dart file
  final colorsList =[
    Color(0xff4285F4),
    Color(0xff1aa260),
    Color(0xffde5246),

  ]; //semicolon for list

  @override
  Widget build(BuildContext context) {
    StatesServices statesServices =StatesServices();

    //statesServices is object which is calling the constructor of StatesServices
    return Scaffold(
      appBar: AppBar(
        title: Text('Covid-19'),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.all(10.0),
          child: Column(
            children: [
            SizedBox(height: 10,),
              FutureBuilder(
                  future: statesServices.fetchWorldStates(),
                  // snapshot  returns the data that is return by future function here futurefunction is fetchWorldStates()
                  builder: (context, AsyncSnapshot<WorldStateModel>snapshot){

                if(!snapshot.hasData){
                  return Expanded(child: SpinKitCircle(
                    color: Colors.black45,
                    controller: _controller,
                    size: 70.0,
                  ));
                } else{
                  return Column(
                    children: [
                      PieChart(
                        //This animationDuration,chartType,chartRadius  is defined in piechart , you dont need to define any AnimataionController
                        dataMap:{
                          "Total":double.parse(snapshot.data!.cases!.toString()),
                          "Recovered":double.parse(snapshot.data!.recovered!.toString()),
                          "Deaths":double.parse(snapshot.data!.deaths!.toString()),


                        } ,
                        chartValuesOptions: ChartValuesOptions(
                          showChartValuesInPercentage: true,
                        ),
                        chartRadius: MediaQuery.of(context).size.width/3.2,
                        legendOptions:const  LegendOptions(

                          legendPosition: LegendPosition.left,
                        ),
                        animationDuration:Duration(milliseconds: 1800) ,
                        chartType: ChartType.ring,
                        colorList: colorsList,

                      ),
                      Padding(
                        padding:EdgeInsets.fromLTRB(15, 20, 15, 35),
                        child: Card(
                          child: Column(
                            children: [
                              ReusuableRow(title: 'Total',value: snapshot.data!.cases.toString(),),
                              ReusuableRow(title: 'Deaths',value: snapshot.data!.deaths.toString(),),
                              ReusuableRow(title: 'Recovered',value: snapshot.data!.recovered.toString(),),
                              ReusuableRow(title: "Today's Cases",value: snapshot.data!.todayCases.toString(),),
                              ReusuableRow(title: "Today's Death",value: snapshot.data!.todayCases.toString(),),
                              ReusuableRow(title: "Test Per Million",value: snapshot.data!.testsPerOneMillion.toString(),),

                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                          onTap:(){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> CountriesList()),);

                    },
                    child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                    color: Color(0xff1aa260),
                    borderRadius: BorderRadius.circular(12)
                    ),
                    child: Center(
                    child: Text('Track Countries'),
                    ),
                    ),



                      )


                    ],
                  );
                }
              }),



            ],
          ),
        ),

      ),
    );
  }
}
class ReusuableRow extends StatelessWidget {
  String title,value;
  ReusuableRow({super.key,required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 15, 5, 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Text(value),
            ],
          ),
          SizedBox(height:10 ,),
          Divider()

        ],
      ),
    );
  }
}

