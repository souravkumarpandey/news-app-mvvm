import 'package:flutter/material.dart';
import 'package:newsapp/pages/newsListPage.dart';
import 'package:newsapp/viewmodels/newsArticleListViewModel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( App());
}

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Fresh News",
      home:ChangeNotifierProvider(
        create: (context) => NewArticleListViewModel(),
        child: NewsListPage(),
      )
      
      
    );
  }
}

