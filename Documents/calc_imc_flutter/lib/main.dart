import 'package:calc_imc_flutter/pages/login/login_page.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(
     const MaterialApp(
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
      color: Colors.pink,
      scrollBehavior: ScrollBehaviorModified(),
    ),
  );
}


class ScrollBehaviorModified extends ScrollBehavior {
  const ScrollBehaviorModified();

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    switch (getPlatform(context)) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
      case TargetPlatform.android:
        return const BouncingScrollPhysics();
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return const ClampingScrollPhysics();
      default:
        return const ClampingScrollPhysics();
    }
  }
}

