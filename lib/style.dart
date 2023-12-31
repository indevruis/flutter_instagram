import 'package:flutter/material.dart';

var theme = ThemeData(
    iconTheme: IconThemeData(color: Colors.black, size: 30),
    textTheme:
        TextTheme(bodyMedium: TextStyle(fontSize: 16.0, color: Colors.black)),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0.0,
      titleTextStyle: TextStyle(
          color: Colors.black,
          fontFamily: "PacificoRegular",
          fontSize: 30,
          fontWeight: FontWeight.w300),
      actionsIconTheme: IconThemeData(color: Colors.black, size: 30.0),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black,
      selectedIconTheme: IconThemeData(size: 30),
      unselectedIconTheme: IconThemeData(size: 27),
      type: BottomNavigationBarType.fixed,
    ));
