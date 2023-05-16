import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsapp/models/newsArticle.dart';
import 'package:newsapp/utils/constants.dart';

class Webservice {

  Future<List<NewsArticle>> fetchHeadlineBYkeyword(String keyword)async{
   
    final response= await http.get(Uri.parse(Constant.headlineFor(keyword)));
    if(response.statusCode==200){
      final result = jsonDecode(response.body);
      Iterable list =result["articles"];
      return list.map((json) => NewsArticle.fromJSON(json)).toList();

    }else{
      throw Exception("no data fount");
    }
    
  }

  Future<List<NewsArticle>> fetchTopHeadlines()  async{
    
    final response= await http.get(Uri.parse(Constant.TOP_HEADLINE_URL));

    if(response.statusCode==200){
       final result= jsonDecode(response.body);
       Iterable list= result['articles'];
       return list.map((article) => NewsArticle.fromJSON(article)).toList();
    }else{
      throw Exception("Failed to get top news");
    }
  }
}
