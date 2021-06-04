import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/provider/database_provider.dart';
import 'package:news_app/utils/result_state.dart';
import 'package:news_app/widgets/card_article.dart';
import 'package:news_app/widgets/platform_widget.dart';
import 'package:provider/provider.dart';

class BookmarksPage extends StatelessWidget {
  static const String bookmarksTitle = 'Bookmarks';

  Widget _buildList() {
    return Consumer<DatabaseProvider>(builder: (context, provider, _) {
      if (provider.state == ResultState.HasData) {
        return ListView.builder(
            itemCount: provider.bookmarks.length,
            itemBuilder: (context, index) {
              return CardArticle(article: provider.bookmarks[index]);
            });
      } else {
        return Center(
          child: Text(provider.message),
        );
      }
    });
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(bookmarksTitle),
      ),
      body: _buildList(),
    );
  }

  Widget _buildIOS(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(bookmarksTitle),
        ),
        child: _buildList());
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidgets(
        androidBuilder: _buildAndroid, iosBuilder: _buildIOS);
  }
}
