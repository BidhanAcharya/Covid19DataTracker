import 'dart:convert';

import 'package:covid_data_tracker/utilities/app_url.dart';
import 'package:http/http.dart' as http;
import 'package:covid_data_tracker/Model/WorldStateModel.dart';
class StatesServices{

//Future function defination
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


}

