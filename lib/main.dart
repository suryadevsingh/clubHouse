import 'package:flutter/material.dart';

import 'pages/welcome_page.dart';
import 'utils/style.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: " Clubhouse ",
      theme: ThemeData(
          scaffoldBackgroundColor: Style.LightBrown,
          appBarTheme: AppBarTheme(
              color: Style.LightBrown,
              elevation: 0,
              iconTheme: IconThemeData(color: Colors.black))),
      home: WelcomePage(),
    );
  }
}
