import 'dart:io';

import 'package:news_app/ui/article_detail_page.dart';
import 'package:news_app/ui/bookmarks_page.dart';
import 'package:news_app/ui/settings_page.dart';
import 'package:news_app/ui/article_list_page.dart';
import 'package:news_app/utils/notification_helper.dart';
import 'package:news_app/widgets/platform_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home_page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _bottomNavIndex = 0;
  static const String _headlineText = 'Headline';
  final NotificationHelper _notificationHelper = NotificationHelper();

  List<BottomNavigationBarItem> _bottomNavBarItems = [
    BottomNavigationBarItem(
        icon: Icon(Platform.isIOS ? CupertinoIcons.news : Icons.public),
        label: _headlineText),
    BottomNavigationBarItem(
        icon: Icon(Platform.isIOS
            ? CupertinoIcons.bookmark
            : Icons.collections_bookmark),
        label: BookmarksPage.bookmarksTitle),
    BottomNavigationBarItem(
        icon: Icon(Platform.isIOS ? CupertinoIcons.settings : Icons.settings),
        label: 'Settings')
  ];

  List<Widget> _listWidget = [
    ArticleListPage(),
    BookmarksPage(),
    SettingsPage()
  ];

  @override
  void initState() {
    super.initState();
    _notificationHelper
        .configureSelectNotificationSubject(ArticleDetailPage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidgets(
        androidBuilder: _buildAndroid, iosBuilder: _buildIOS);
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      body: _listWidget[_bottomNavIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomNavIndex,
        items: _bottomNavBarItems,
        onTap: (selected) {
          setState(() {
            _bottomNavIndex = selected;
          });
        },
      ),
    );
  }

  Widget _buildIOS(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: _bottomNavBarItems,
      ),
      tabBuilder: (context, index) {
        return _listWidget[index];
        /*switch (index) {
          case 0:
            return ArticleListPage();
          case 1:
            return SettingsPage();
          default:
            return null;
        }*/
      },
    );
  }

  @override
  void dispose() {
    selectNotificationSubject.close();
    super.dispose();
  }
}
