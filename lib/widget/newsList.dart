import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/pages/newsArticleDetailsPage.dart';
import 'package:newsapp/viewmodels/newsArticleViewModel.dart';

class NewsList extends StatelessWidget {
  final List<NewsArticleViewModel> article;
  const NewsList({super.key, required this.article});
 
 void _shownewsArticleDetials(BuildContext context, NewsArticleViewModel vm){
  Navigator.push(context, MaterialPageRoute(builder:(context)=>NewsArticleDetailsPage(article:vm)));
 }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: article.length,
        itemBuilder:(context, index){
          final arti= article[index];
          return ListTile(
            onTap: () {
              _shownewsArticleDetials(context,arti);
            },
            leading: Container(
              width: 100,
              height: 100,
              child:article[index].urlToImage!=null? Image.network(article[index].urlToImage):
              Image.asset("images/news-placeholder.png"),
              ),
            title: Text(article[index].title),
          );
        } ,
        );
  }
}