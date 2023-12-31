import 'package:flutter/material.dart';
import 'package:shop_app_tharwat/screens/home_page.dart';
import 'package:shop_app_tharwat/screens/update_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomePage.id:(context)=>HomePage(),
        UpdateScreen.id:(context)=>UpdateScreen(),
      },
      initialRoute:HomePage.id,
    );
  }
}
