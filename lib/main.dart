import 'package:flutter/material.dart';
import 'ProfilePage.dart';

main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColorDark: Colors.black12,
        fontFamily: "GoogleSansRegular",
      ),
      home: ProfilePage(),
    );
  }
}