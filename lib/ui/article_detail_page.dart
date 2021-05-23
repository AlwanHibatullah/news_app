import 'package:news_app/common/navigation.dart';
import 'package:news_app/data/model/article.dart';
import 'package:news_app/ui/article_webview.dart';
import 'package:flutter/material.dart';

class ArticleDetailPage extends StatelessWidget {
  static const routeName = '/article_detail';

  final Article article;

  const ArticleDetailPage({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: article.urlToImage!,
              child: Image.network(article.urlToImage!)
            ),
            Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(article.description ?? "-"),
                    Divider(color: Colors.grey),
                    Text(
                      article.title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Divider(color: Colors.grey),
                    Text('Date: ${article.publishedAt}'),
                    SizedBox(height: 10,),
                    Text('Author: ${article.author}'),
                    Divider(color: Colors.grey),
                    Text(
                      article.content ?? "-",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                        child: Text('Read More'),
                        onPressed: () {
                          Navigation.intentWithData(
                            ArticleWebView.routeName, article.url);
                        }
                    )
                  ],
                ),
            )
          ],
        ),
      ),
    );
  }

}