import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/provider/preferences_provider.dart';
import 'package:news_app/provider/scheduling_provider.dart';
import 'package:news_app/widgets/custom_dialog.dart';
import 'package:news_app/widgets/platform_widget.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlatformWidgets(
        androidBuilder: _buildAndroid, iosBuilder: _buildIOS);
  }

  Widget _buildList(BuildContext context) {
    return Consumer<PreferencesProvider>(builder: (context, provider, _) {
      return ListView(
        children: [
          Material(
            child: ListTile(
              title: Text('Dark Theme'),
              trailing: Switch.adaptive(
                  value: provider.isDarkTheme,
                  onChanged: (value) => provider.enableDarkTheme(value)),
            ),
          ),
          Material(
            child: ListTile(
              title: Text('Scheduling News'),
              trailing: Consumer<SchedulingProvider>(
                builder: (context, scheduled, _) {
                  return Switch.adaptive(
                      value: provider.isDailyNewsActive,
                      onChanged: (value) async {
                        if (Platform.isIOS) {
                          customDialog(context);
                        } else {
                          scheduled.scheduledNews(value);
                          provider.enableDailyNews(value);
                        }
                      });
                },
              ),
            ),
          ),
        ],
      );
    });
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: _buildList(context),
    );
  }

  Widget _buildIOS(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Settings'),
        ),
        child: _buildList(context));
  }
}
