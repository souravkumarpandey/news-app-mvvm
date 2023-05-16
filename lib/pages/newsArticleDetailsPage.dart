import 'package:flutter/material.dart';
import 'package:newsapp/models/newsArticle.dart';
import 'package:newsapp/viewmodels/newsArticleViewModel.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsArticleDetailsPage extends StatelessWidget {
  final NewsArticleViewModel article;
  const NewsArticleDetailsPage({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${this.article.title}"),),
      body: WebViewWidget(
        controller: WebViewController()..loadRequest(Uri.parse(this.article.url)),
        
        ),
      
    );
  }
}