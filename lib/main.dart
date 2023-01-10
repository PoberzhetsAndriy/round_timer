import 'package:flutter/material.dart';
import 'package:round_timer/screens/timer_screen.dart';
import 'package:round_timer/widgets/round_timer_icons.dart';
import 'package:round_timer/screens/home.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'round timer',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w400, fontSize: 18),
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
            elevation: 0,
          ),
          primaryColor: Colors.white,
          scaffoldBackgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Color(0xFF74717D), size: 28),
        ),
        home: const Home());
  }
}
