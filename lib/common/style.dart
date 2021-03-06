import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final Color primaryColor = Color(0xFFFFFFFF);
final Color secondaryColor = Color(0xFF6B38FB);

final TextTheme myTextTheme = TextTheme(
  headline1: GoogleFonts.merriweather(
      fontSize: 92, fontWeight: FontWeight.w300, letterSpacing: 1.5),
  headline2: GoogleFonts.merriweather(
      fontSize: 57, fontWeight: FontWeight.w300, letterSpacing: -0.5),
  headline3:
      GoogleFonts.merriweather(fontSize: 46, fontWeight: FontWeight.w400),
  headline4: GoogleFonts.merriweather(
      fontSize: 32, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  headline5:
      GoogleFonts.merriweather(fontSize: 323, fontWeight: FontWeight.w400),
  headline6: GoogleFonts.merriweather(
      fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: 0.15),
  subtitle1: GoogleFonts.merriweather(
      fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.15),
  subtitle2: GoogleFonts.merriweather(
      fontSize: 13, fontWeight: FontWeight.w500, letterSpacing: 0.1),
  bodyText1: GoogleFonts.libreFranklin(
      fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
  bodyText2: GoogleFonts.libreFranklin(
      fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  button: GoogleFonts.libreFranklin(
      fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
  caption: GoogleFonts.libreFranklin(
      fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
  overline: GoogleFonts.libreFranklin(
      fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
);

ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: primaryColor,
    accentColor: secondaryColor,
    scaffoldBackgroundColor: Colors.white,
    textTheme: myTextTheme,
    appBarTheme: AppBarTheme(
        textTheme: myTextTheme.apply(bodyColor: Colors.black), elevation: 0),
    buttonTheme: ButtonThemeData(
        buttonColor: secondaryColor,
        textTheme: ButtonTextTheme.primary,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(0)))),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: secondaryColor, unselectedItemColor: Colors.grey));

/* DARK THEME */
final Color darkPrimaryColor = Color(0xFF000000);
final Color darkSecondaryColor = Color(0xFF64FFDA);

ThemeData darkTheme = ThemeData.dark().copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: darkPrimaryColor,
    accentColor: darkSecondaryColor,
    textTheme: myTextTheme,
    appBarTheme: AppBarTheme(
        textTheme: myTextTheme.apply(bodyColor: Colors.white), elevation: 0),
    buttonTheme: ButtonThemeData(
        buttonColor: secondaryColor,
        textTheme: ButtonTextTheme.primary,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(0)))),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: darkSecondaryColor,
        unselectedItemColor: Colors.grey));
