import 'package:flutter/material.dart';
import 'package:uiux/loginPage/login_page.dart';
import 'package:uiux/sideNavigation/side_Navigation.dart';

import 'accordion/accordion.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new SideNavigation(),
    );
  }
}

