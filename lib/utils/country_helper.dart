import 'dart:convert';

import 'package:http/http.dart' as http;
class ApiHelper
{
   Future<void>countryApiCall(String country)
   async{
     String countrylink="https://newsapi.org/v2/everything?q=country&from=2023-03-06&sortBy=publishedAt&apiKey=636f6723f76b4c25b6a155415cef45f8";
      Uri uri = Uri.parse(countrylink);
      var responce= await http.get(uri);
      print(responce.body);
      var json = jsonDecode(responce.body);
   }
}