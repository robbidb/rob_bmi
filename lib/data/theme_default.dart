import 'package:flutter/material.dart';
import 'package:rob_bmi/data/kColors.dart';


ThemeData myLightTheme() {
  final ThemeData lt = ThemeData.light();

  TextTheme _myTextTheme(TextTheme base) {                                      // TESTI -  copio l'originale e lo modifico
    return base.copyWith(
      button: base.button!.copyWith(fontSize: 22,color: Colors.white,),
      headline4: base.headline4!.copyWith(color: Colors.grey[800]),
      headline6: base.headline6!.copyWith(color: Colors.grey[800]),
      subtitle2: base.subtitle2!.copyWith(color: Colors.grey[800]),
    );
  }

  return lt.copyWith(
    textTheme: _myTextTheme(lt.textTheme),                                      //  TESTI

    scaffoldBackgroundColor: Colors.white38,
    primaryColor: Color(0xffce107c),
    indicatorColor: Color(0xFF807A6B),

    primaryIconTheme: lt.primaryIconTheme.copyWith(
      color: Colors.white,
      size: 20,
    ),
    iconTheme: lt.iconTheme.copyWith(
      color: Colors.white,
    ),
    
    backgroundColor: Colors.white,                                               // Colore sfondo pagina
    tabBarTheme: lt.tabBarTheme.copyWith(
      labelColor: Color(0xffce107c),
      unselectedLabelColor: Colors.grey,
    ),
    buttonTheme: lt.buttonTheme.copyWith(buttonColor: Colors.red),
    errorColor: Colors.red,
  );
}


ThemeData myDarkTheme() {
  final ThemeData dt = ThemeData.dark();

  TextTheme _myTextTheme(TextTheme base) {                                      // TESTI -  copio l'originale e lo modifico
    return base.copyWith(
      button: base.button!.copyWith(fontSize: 22,color: Colors.white),
      headline4: base.headline4!.copyWith(color: Colors.black),
      headline6: base.headline6!.copyWith(color: Colors.black),
      subtitle2: base.subtitle2!.copyWith(color: Colors.black),
    );
  }

  return dt.copyWith(
    textTheme: _myTextTheme(dt.textTheme),                                      // TESTI

    scaffoldBackgroundColor: Colors.black87,
    primaryColor: Colors.black38,

    indicatorColor: Color(0xFF807A6B),
    primaryIconTheme: dt.primaryIconTheme.copyWith(
      color: Colors.green,
      size: 20,
    ),
  );
}






class AppTheme {
  const AppTheme();
  static ThemeData lightTheme = ThemeData.light().copyWith(
    backgroundColor: LightColor.background,
    primaryColor: LightColor.purple,
    cardTheme: CardTheme(color: LightColor.background),
    iconTheme: IconThemeData(color: LightColor.iconColor),
    bottomAppBarColor: LightColor.background,
    dividerColor: LightColor.grey,
  );

  static TextStyle titleStyle =
  const TextStyle(color: LightColor.titleTextColor, fontSize: 16);
  static TextStyle subTitleStyle =
  const TextStyle(color: LightColor.subTitleTextColor, fontSize: 12);

  static TextStyle h1Style =
  const TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  static TextStyle h2Style = const TextStyle(fontSize: 22);
  static TextStyle h3Style = const TextStyle(fontSize: 20);
  static TextStyle h4Style = const TextStyle(fontSize: 18);
  static TextStyle h5Style = const TextStyle(fontSize: 16);
  static TextStyle h6Style = const TextStyle(fontSize: 14);

  static List<BoxShadow> shadow = <BoxShadow>[
    BoxShadow(color: Color(0xfff8f8f8), blurRadius: 10, spreadRadius: 15),
  ];

  static EdgeInsets padding =
  const EdgeInsets.symmetric(horizontal: 20, vertical: 10);
  static EdgeInsets hPadding = const EdgeInsets.symmetric(
    horizontal: 10,
  );

  static double fullWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double fullHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}


//--- HOME style ---------------------------------------------------------------
class homeStyle {

  // static const headerStyle = TextStyle(
  //   fontSize: 22.0,
  //   color: Color.fromRGBO(104, 104, 104, 1),
  //   fontWeight: FontWeight.bold,
  // );

  // static const bottomStyle = TextStyle(
  //   fontSize: 12.0,
  //   color: Color.fromRGBO(104, 104, 104, 1),
  //   fontWeight: FontWeight.w300,
  // );
  //
  // static const btnTitleStyle = TextStyle(
  //   fontSize: 22.0,
  //   color: Colors.white,
  //   fontWeight: FontWeight.w500,
  // );

  static const Color green = Color(0xff4cd1bc);
  static const Color lightGreen = Color(0xff5ed6c3);

  static const Color Blue = Color(0xff71b4fb);
  static const Color lightBlue = Color(0xff7fbcfb);

  static const Color orange = Color(0xfffa8c73);
  static const Color lightOrange = Color(0xfffa9881);

  static const Color purple = Color(0xff8873f4);
  static const Color lightPurple = Color(0xff9489f4);
}


//--- bp style -----------------------------------------------------------------
class bpStyle {
  static const Color cardBg = Color(0xff4cd1bc);

  static const inputTitleStyle = TextStyle(
    fontSize: 26.0,
    color: Colors.black,
  );

  static const inputUMStyle = TextStyle(
    fontSize: 12.0,
    color: Colors.black54,
  );
}


//--- bmi style ----------------------------------------------------------------
class bmiStyle {

  //--- INPUTS -----------------------------------------------------------------
  static const Color green = Color(0xff4cd1bc);
  static const Color inputBg = Color(0xff4cd1bc);

  static const inputTitleStyle = TextStyle(
    fontSize: 24.0,
    color: Colors.black,
  );

  static const inputNumberStyle = TextStyle(
    fontSize: 60.0,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  static const inputUMStyle = TextStyle(
    fontSize: 20.0,
    color: Colors.black54,
  );


  //--- RESULTS ----------------------------------------------------------------
  static const Color resultBg = Color(0xffffffff);

  static const resultTitleStyle = TextStyle(
    fontSize: 24.0,
   // fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const resultValueStyle = TextStyle(
    fontSize: 60.0,
    fontWeight: FontWeight.bold,
    color: Colors.blueAccent,
  );

  static const resultTextStyle = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    color: Colors.black54,
  );

  static const resultInterpretationStyle = TextStyle(
    fontSize: 12.0,
    color: Colors.black38,
  );
}
