import 'dart:io';

import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:news_app/common/navigation.dart';
import 'package:news_app/data/model/article.dart';
import 'package:news_app/ui/article_webview.dart';
import 'package:news_app/ui/article_detail_page.dart';
import 'package:news_app/ui/home_page.dart';
import 'package:flutter/material.dart';
import 'package:news_app/common/style.dart';
import 'package:news_app/utils/background_service.dart';
import 'package:news_app/utils/notification_helper.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final NotificationHelper _notificationHelper = NotificationHelper();
  final BackgroundService _service = BackgroundService();

  _service.initializeIsolate();

  if (Platform.isAndroid) {
    await AndroidAlarmManager.initialize();
  }

  await _notificationHelper.initNotification(flutterLocalNotificationsPlugin);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primaryColor: primaryColor,
          accentColor: secondaryColor,
          scaffoldBackgroundColor: Colors.white,
          textTheme: myTextTheme,
          appBarTheme: AppBarTheme(
              textTheme: myTextTheme.apply(bodyColor: Colors.black),
              elevation: 0),
          buttonTheme: ButtonThemeData(
              buttonColor: secondaryColor,
              textTheme: ButtonTextTheme.primary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(0)))),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              selectedItemColor: secondaryColor,
              unselectedItemColor: Colors.grey)),
      navigatorKey: navigatorKey,
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => HomePage(),
        ArticleDetailPage.routeName: (context) => ArticleDetailPage(
            article: ModalRoute.of(context)?.settings.arguments as Article),
        ArticleWebView.routeName: (context) => ArticleWebView(
            url: ModalRoute.of(context)?.settings.arguments as String)
      },
      // home: MyHomePage(),
    );
  }
}
