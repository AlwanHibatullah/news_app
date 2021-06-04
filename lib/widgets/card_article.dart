import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/common/navigation.dart';

import 'package:news_app/common/style.dart';
import 'package:news_app/data/model/article.dart';
import 'package:news_app/provider/database_provider.dart';
import 'package:news_app/ui/article_detail_page.dart';
import 'package:provider/provider.dart';

class CardArticle extends StatelessWidget {
  final Article article;

  CardArticle({
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(builder: (context, provider, _) {
      return FutureBuilder<bool>(
          future: provider.isBookmarked(article.url),
          builder: (context, snapshot) {
            var isBookmarked = snapshot.data ?? false;
            return Material(
              color: primaryColor,
              child: ListTile(
                trailing: isBookmarked
                    ? IconButton(
                        color: Theme.of(context).accentColor,
                        onPressed: () => provider.removeBookmark(article.url),
                        icon: Icon(Icons.bookmark))
                    : IconButton(
                        color: Theme.of(context).accentColor,
                        onPressed: () => provider.addBookmark(article),
                        icon: Icon(Icons.bookmark_border)),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                leading: Hero(
                  tag: article.urlToImage!,
                  child: Image.network(
                    article.urlToImage!,
                    width: 100,
                  ),
                ),
                title: Text(article.title),
                subtitle: Text(article.author ?? ""),
                onTap: () => Navigation.intentWithData(
                    ArticleDetailPage.routeName, article),
              ),
            );
          });
    });
  }
}
