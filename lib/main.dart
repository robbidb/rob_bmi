import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:rob_bmi/screens/home/home.dart';
import 'package:rob_bmi/data/kRoute.dart';
import 'package:rob_bmi/data/theme_default.dart';

void main() async {
  runApp(const RobBmi());
}

class RobBmi extends StatelessWidget {
  static final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(
      ThemeMode.light);

  const RobBmi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,

        builder: (_, ThemeMode currentMode, __) {
          return MaterialApp(
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,

            ],
            supportedLocales: [
              Locale('en', ''),                                                 // English, no country code
              Locale('it', ''),                                                 // Italian, no country code
            ],
            //locale: Locale('en', ''),
            locale: Locale('it', ''),
            title: 'rob_BMI',
            debugShowCheckedModeBanner: false,                                  // banner debug (NO)

            theme: myLightTheme(),
            // Theming
            darkTheme: myDarkTheme(),
            themeMode: currentMode,

            routes: {
              AppRoutes.HomeRoute: (context) => HomePage()
            },

            initialRoute: AppRoutes.HomeRoute, // Start Home Page
          );
        }
    );
  }
}