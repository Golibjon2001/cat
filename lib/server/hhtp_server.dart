import 'dart:convert';
import 'package:yangi_prekt/model/model.dart';
import 'package:http/http.dart'as http;

class Respons{
  String uri="https://cat-fact.herokuapp.com/facts/random";
  Future getData()async{
    try {
      final response =await http.get(Uri.parse(uri));print(response.body);
      if(response.statusCode==200){
        Map<String, dynamic> jsonData = jsonDecode(response.body);
        final result = CatFactModel.fromJson(jsonData);
        return result;
      }else{
        throw Exception("Failed to load data");
      }
    }catch(e){
      return e.toString();
    }
  }
}