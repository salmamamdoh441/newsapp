import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsapp/Models/newsModel.dart';
import 'package:provider/provider.dart';
import 'package:newsapp/provider/country.dart';

class ApiHelper
{

  String apiKey='738cf74959264ce7b24c30ba7a9a4d87';
getNews(context)async
{List<NewsModel>news=[];
 try{
  var response =await http.get(Uri.parse('https://newsapi.org/v2/top-headlines?country=${Provider.of<CountryProv>(context).country}&apiKey=$apiKey'));
  var body=jsonDecode(response.body);

 if(body['status']=='ok')
 {
   body['articles'].forEach((element){
     NewsModel newsModel=NewsModel(
       title: element['title'],
       time: element['publishedAt'],
       url: element['url'],
       desc: element['description'],
       imageUrl: element['urlToImage'],
       author: element['author'],
       gornal: element['source']['name']
     );
     news.add(newsModel);
   });
 }
 else{
   print('No Data');
 }}
 catch(e){
   print(e);
 }
 return news;
}
  getNewsByCategory(String category,context)async
  {List<NewsModel>news=[];
  var response =await http.get(Uri.parse('https://newsapi.org/v2/top-headlines?country=${Provider.of<CountryProv>(context,listen: false).country}&category=$category&apiKey=$apiKey'));
  var body=jsonDecode(response.body);

  if(body['status']=='ok')
  {
    body['articles'].forEach((element){
      NewsModel newsModel=NewsModel(
          title: element['title'],
          time: element['publishedAt'],
          url: element['url'],
          desc: element['description'],
          imageUrl: element['urlToImage'],
          author: element['author'],
          gornal: element['source']['name']
      );
      news.add(newsModel);
    });
  }
  else{
    print('No Data');
  }
  return news;
  }
}