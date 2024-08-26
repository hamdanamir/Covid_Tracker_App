import 'dart:convert';

import 'package:covidapp4/modal/WorldStatesApi.dart';
import 'package:http/http.dart' as http;
import 'utilities/appurl.dart';

class StatesServices {
  Future<WorldStatesModal> fetchworldstatesrecords() async {
    final response = await http.get(Uri.parse(Appurl.worldstatesapi));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body.toString());
      return WorldStatesModal.fromJson(data);
    } else {
      return throw Exception("Error Occurred");
    }
  }
  Future<List<dynamic>> fetchcountrieslistapi()async
  {
    var data;
    final response=await http.get(Uri.parse(Appurl.countrieslist));
    if(response.statusCode==200)
      {
        data=jsonDecode(response.body.toString());
        return data;
      }
    else{
      return throw Exception("Error Occurred");
    }
  }
}
