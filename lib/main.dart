import 'package:flutter/material.dart';
import 'package:news_app/home/home_screen.dart';
import 'package:news_app/home/news/news_details_screen.dart';

main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      title: 'بسم الله الرحمن الرحيم',
      initialRoute: Home_Screen.Routname,
      routes: {
        // هنا بعرف كل الاسكرين اللى عندى عشان اربطهم ببعض عشان اعرف اتنقل بينهم
        Home_Screen.Routname: (_) => Home_Screen(),
        NewsDwetailsScreen.Routname: (_) => NewsDwetailsScreen(),

      },
    );
  }
}
