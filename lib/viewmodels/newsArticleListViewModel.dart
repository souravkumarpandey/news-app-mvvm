import 'package:flutter/material.dart';
import 'package:newsapp/models/newsArticle.dart';
import 'package:newsapp/services/webservices.dart';
import 'package:newsapp/viewmodels/newsArticleViewModel.dart';

  enum LoadingStatus{
    completed,
    searching,
    empty
   }
class NewArticleListViewModel extends ChangeNotifier{

  var loadingStatus= LoadingStatus.searching;
   
  List<NewsArticleViewModel> article= [];
  // NewArticleListViewModel(){
  //   _pipulateTopHeadlines();
  // }
  Future<void> search(String keyword)async{
    this.loadingStatus= LoadingStatus.searching;
   List<NewsArticle> newsArticle= await Webservice().fetchHeadlineBYkeyword(keyword);
   this.article= newsArticle.map((article) => NewsArticleViewModel(article: article)).toList();
      this.loadingStatus= this.article.isEmpty? LoadingStatus.empty: LoadingStatus.completed;
   notifyListeners();
  }

  void pipulateTopHeadlines()async{
    this.loadingStatus= LoadingStatus.searching;
    List<NewsArticle> newsArticle= await Webservice().fetchTopHeadlines();
    this.article =newsArticle.map((article) => NewsArticleViewModel(
      article: article)).toList();
     this.loadingStatus= this.article.isEmpty? LoadingStatus.empty: LoadingStatus.completed;
    notifyListeners();

  }
}