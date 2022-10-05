import 'package:flutter/material.dart';

ThemeData myLightTheme() {
  final ThemeData lt = ThemeData.light();

  TextTheme _myTextTheme(TextTheme base) {                                      // TESTI -  copio l'originale e lo modifico
    return base.copyWith(
      button: base.button!.copyWith(fontSize: 22,color: Colors.white,),
      headline2: base.headline2!.copyWith(color: Colors.blueAccent),
      headline4: base.headline4!.copyWith(color: Colors.grey[800]),
      headline6: base.headline6!.copyWith(color: Colors.grey[800]),
      subtitle2: base.subtitle2!.copyWith(color: Colors.grey[800]),
    );
  }

  return lt.copyWith(
    textTheme: _myTextTheme(lt.textTheme),                                      //  TESTI
    scaffoldBackgroundColor: Colors.white38,
    cardTheme: CardTheme(color: Colors.white),
  );
}


ThemeData myDarkTheme() {
  final ThemeData dt = ThemeData.dark();

  TextTheme _myTextTheme(TextTheme base) {                                      // TESTI -  copio l'originale e lo modifico
    return base.copyWith(
      button: base.button!.copyWith(fontSize: 22,color: Colors.white),
      headline2: base.headline2!.copyWith(color: Colors.orangeAccent),
      headline4: base.headline4!.copyWith(color: Colors.white),
      headline6: base.headline6!.copyWith(color: Colors.white),
      subtitle2: base.subtitle2!.copyWith(color: Colors.white),
    );
  }

  return dt.copyWith(
    textTheme: _myTextTheme(dt.textTheme),                                      // TESTI
    scaffoldBackgroundColor: Colors.black87,
    cardTheme: CardTheme(color: Colors.grey[800]),
  );
}





class AppTheme {
  const AppTheme();

  static double fullWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double fullHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
