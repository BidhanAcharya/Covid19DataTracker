import 'package:covid_data_tracker/Services/states_services.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'details_screen.dart';

class CountriesList extends StatefulWidget {
   CountriesList({super.key});

  @override
  State<CountriesList> createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList> {
  TextEditingController  searchController =TextEditingController();

  @override
  Widget build(BuildContext context) {
  StatesServices statesServices=StatesServices();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: TextFormField(

              controller: searchController,
              onChanged: (value){
                setState((){});
              },
              decoration: InputDecoration(
                hintText:'Search Country ' ,
                border:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                )
              ),
            ),
          ),
          Expanded(

              child:FutureBuilder(
                future: statesServices.countrieslistapi(),
                builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {

                if (!snapshot.hasData){
               return  ListView.builder(

                 //  itemCount:snapshot.data!.length , until the data arrives it shows an error so
                   itemCount:100 ,// 100 shimeer effect are created until data loads
                   itemBuilder: (context, index){
                     return Shimmer.fromColors( baseColor: Colors.grey.shade700, highlightColor: Colors.grey.shade100,child: Column(

                       children: [
                         ListTile(
                           title: Container(
                         height: 10,
                       width: 80,
                             color: Colors.white,
                     ),
                           subtitle:Container(
                             height: 40,
                             width: 40,
                             color: Colors.white,
                           ) ,
                           leading: Container(
                             height: 50,
                             width: 50,
                             color: Colors.white,
                           )
                           ),

                       ],
                     ),);




                   });
                }else{
                  print(snapshot.data);
                  return ListView.builder(
                      itemCount:snapshot.data!.length ,
                      itemBuilder: (context, index){
                        String name =snapshot.data![index]['country'];
                        if(searchController.text.isEmpty){
                          return Column(

                            children: [
                              InkWell(
                                onTap:(){
                                  print(snapshot.data);
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailScreen(

                                    name:snapshot.data!['country'] ,
                                    image: snapshot.data!['countryInfo']['flag'],
                                    totalCases: snapshot.data!['cases'],
                                    critical: snapshot.data!['critical'],
                                    todayRecovered: snapshot.data!['todayRecovered'],
                                    active: snapshot.data!['active'],
                                    test: snapshot.data!['tests'],
                                    totalDeaths: snapshot.data!['deaths'],
                                    totalRecovered: snapshot.data!['recovered'],
                                    continent: snapshot.data!['continent'],





                                  )));

                                },
                                child: ListTile(
                                  title: Text(snapshot.data![index]['country']),
                                  subtitle: Text(snapshot.data![index]['cases'].toString()),
                                  leading: Image(
                                    height: 50,
                                    width: 50,
                                    image: NetworkImage(
                                        snapshot.data![index]['countryInfo']['flag']
                                    ),
                                  ),
                                ),),

                            ],
                          );
                        }else if(name.toLowerCase().contains(searchController.text.toLowerCase())){
                          return Column(

                            children: [
                              ListTile(
                                title: Text(snapshot.data![index]['country']),
                                subtitle: Text(snapshot.data![index]['cases'].toString()),
                                leading: Image(
                                  height: 50,
                                  width: 50,
                                  image: NetworkImage(
                                      snapshot.data![index]['countryInfo']['flag']
                                  ),
                                ),
                              )
                            ],
                          );
                        }else {
                          return Container();
                        }





                      });
                }

              },

              ) )
        ],
      ),
    );
  }
}
