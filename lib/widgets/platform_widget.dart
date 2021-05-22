import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class PlatformWidgets extends StatelessWidget {
  final WidgetBuilder androidBuilder;
  final WidgetBuilder iosBuilder;

  PlatformWidgets({
    required this.androidBuilder,
    required this.iosBuilder
  });

  @override
  Widget build(BuildContext context) {
    switch(defaultTargetPlatform){
      case TargetPlatform.android:
        return androidBuilder(context);
      case TargetPlatform.iOS:
        return iosBuilder(context);
      default :
        return androidBuilder(context);
    }
  }

}