import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/api/model/NewsResponse.dart';
import 'package:news_app/api/model/SourcesResponse.dart';

class ApiManger {
  static const String Base_Url = 'newsapi.org';
  static const String Api_Key = '38df2afc789e4fad8e32f9e43c1461b0';

  // هعمل فانشكن عشان اجيب بيها api
  // &category=sports
  static Future<SourcesResponse> getNewsSource(String catogyId) async {
    var uri = Uri.https(Base_Url, '/v2/top-headlines/sources',
        // بعدين البراميتر
        {'apiKey': Api_Key, 'category': catogyId});
    // هخليها await وانادى على response
    var response = await http.get(uri);
    // بعدين هاخد  response احولو (map)json
    var json = jsonDecode(response.body);
    // بعدين هاخد json امررو ل SourcesResponse اللى فى الداتا بتاع api
    SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
    return sourcesResponse;
  }

  // فانكشن بتاعت الداتا اللى جوا tap
  static Future<NewsResponse> getNewsBySourceId(String sourceId) async {
    var uri = Uri.https(Base_Url, '/v2/everything',
        // بعدين البراميتر
        {'apiKey': Api_Key, 'sources': sourceId});
    // هخليها await وانادى على response
    var response = await http.get(uri);
    // بعدين هاخد  response احولو (map)json
    var json = jsonDecode(response.body);
    // بعدين هاخد json امررو ل SourcesResponse اللى فى الداتا بتاع api
    NewsResponse newsResponse = NewsResponse.fromJson(json);
    return newsResponse;
  }
}
