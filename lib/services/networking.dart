import 'dart:convert';
import 'package:http/http.dart' as http;
class NetworkHelper {
  NetworkHelper(this.url);
  final Uri url;
  Future getData() async{
    http.Response response = await http.get(url);
    if(response.statusCode == 200){
      return await jsonDecode(response.body);
    }else{
      print('Page not found ');
      print(response.statusCode);
    }
  }
}