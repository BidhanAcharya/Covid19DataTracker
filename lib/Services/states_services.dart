import 'dart:convert';

import 'package:covid_data_tracker/utilities/app_url.dart';
import 'package:http/http.dart' as http;
import 'package:covid_data_tracker/Model/WorldStateModel.dart';
class StatesServices{

//Future function defination In this cases all the values in worldstateapi are of same type i.e int so you can write WorldStateModel  as return type, if itwant oof same type you have to use dynamic
// Api fetching can be done in two ways one by making  model if the data are of same time https://disease.sh/v3/covid-19/all this api model is made and if model is made define return type model name
  Future<WorldStateModel> fetchWorldStates()async{
    //async  sync all the components inside of{} with future function
    // await waits for the response because we dont know how much times it takes to return desired result
    //eg await Future.deyaled(Duration(seconds:3)); defined under Future function, then it shows data after 3 seconds
    final response = await http.get(Uri.parse(AppUrl.worldstateApi));
   if(response.statusCode == 200){
     var data=jsonDecode(response.body);
     return WorldStateModel.fromJson(data);


   } else{
     throw Exception('Request Failed');
   }

  }
  //Future function defination
  // Api fetching can be done in two ways another by direct calling since here the value present are of differnt types https://disease.sh/v3/covid-19/countries so use dynamic aand this case you can directly return  data eg here return data in line number 35
  Future<List<dynamic>> countrieslistapi()async{

    //async  sync all the components inside of{} with future function
    // await waits for the response because we dont know how much times it takes to return desired result
    //eg await Future.deyaled(Duration(seconds:3)); defined under Future function, then it shows data after 3 seconds
    final response = await http.get(Uri.parse(AppUrl.countriesList));
    if(response.statusCode == 200){
      var data=jsonDecode(response.body);
      return data;


    } else{
      throw Exception('Request Failed');
    }

  }


}

