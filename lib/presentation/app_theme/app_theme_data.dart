

import 'package:flutter/material.dart';

class AppThemeData{


  static Color primary = const Color(0xFF2011B0);
  static Color iconAdd=  const Color(0xFF150C73);
  static Color appBarTitleColor = const Color(0xFF06004F);
  static Color primaryDark = const Color(0xFF06004F);
  static Color primaryText =Colors.black;
  static Color secondaryText =Colors.white;
  static Color iconStar =Colors.yellow;
  static Color borderColor =const Color(0xFF8AA6C7);



  static final ThemeData lightTheme= ThemeData(
    appBarTheme: AppBarTheme(
      color: primary
    ),

    textTheme: TextTheme(

      titleLarge: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          fontFamily:'Poppins' ,
          color: secondaryText
      ),

      bodyMedium:TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          fontFamily: 'Poppins',
          color: primaryText,
      ),
      bodySmall:TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        fontFamily: 'Poppins',
        color: primaryText,
      ),
    ),

    scaffoldBackgroundColor: Colors.white,

  );

}
