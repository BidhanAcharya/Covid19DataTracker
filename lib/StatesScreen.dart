import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class StatesScreen extends StatefulWidget {
  const StatesScreen({super.key});

  @override
  State<StatesScreen> createState() => _StatesScreenState();
}

class _StatesScreenState extends State<StatesScreen> with  TickerProviderStateMixin{
  //late final AnimationController _controller=AnimationController(duration:const Duration(seconds: 8) ,vsync: this)..repeat();


  // List can contain anything it can also store the value for class which is defined in another  dart file
  final colorsList =[
    Color(0xff4285F4),
    Color(0xff1aa260),
    Color(0xffde5246),
  ]; //semicolon for list

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('States'),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.all(10.0),
          child: Column(
            children: [
            SizedBox(height: 10,),

              PieChart(
                //This animationDuration,chartType,chartRadius  is defined in piechart , you dont need to define any AnimataionController
                  dataMap:{
                "Total":50,
                "Recovered":49,
                "Deaths":5,
              } ,
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
                      ReusuableRow(title: 'Total',value: '200',),
                      ReusuableRow(title: 'Total',value: '200',),
                     ReusuableRow(title: 'Total',value: '200',),
                    ],
                  ),
                ),
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xff1aa260),
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Center(
                  child: Text('Track Countries'),
                ),
              )
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

