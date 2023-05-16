import 'package:flutter/material.dart';
import 'package:newsapp/viewmodels/newsArticleListViewModel.dart';
import 'package:newsapp/widget/newsList.dart';
import 'package:provider/provider.dart';

class NewsListPage extends StatefulWidget {
  @override
  State<NewsListPage> createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {
  final _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    Provider.of<NewArticleListViewModel>(context, listen: false)
        .pipulateTopHeadlines();
  }
  Widget _buildList(NewArticleListViewModel vm){
    switch(vm.loadingStatus){
      case LoadingStatus.searching:
      return Align(child: CircularProgressIndicator(),);
      case LoadingStatus.empty:
      return Align(child: Text('No search result'),);
      case LoadingStatus.completed:
      return Expanded(child: NewsList(article: vm.article)) ;
    }
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<NewArticleListViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Top News'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _controller,
            onSubmitted: (value) {
              if(value!=null){
                vm.search(value);
              }
            },
            decoration: InputDecoration(
              labelText: "Enter search term",
              icon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.search),
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  _controller.clear();
                },
                icon: Icon(Icons.clear),
              ),
            ),
          ),
          _buildList(vm),
        ],
      ),
    );
  }
}
