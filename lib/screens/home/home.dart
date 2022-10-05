import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:rob_bmi/main.dart';
import 'package:rob_bmi/data/theme_default.dart';
import 'package:rob_bmi/screens/home/home_header.dart';


class HomePage extends StatefulWidget { HomePage({Key? key}) : super(key: key);
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double minHeight = 120;
  double maxHeight = 220;
  double minWeight = 40;
  double maxWeight = 160;

  int height = 170;
  int weight = 70;

  String result = "00";
  String result_text = "----------";
  String result_interpretation = "----- ----- -----";


  @override
  void initState() {
    super.initState();
  }

  //--- WIDGET - App Bar -------------------------------------------------------
  PreferredSizeWidget _appBar() {
    return AppBar(
      elevation: 0,                                                           // ombra

      title: Text(AppLocalizations.of(context)!.homeTitle,),                  // Intestazione

      actions: <Widget>[                                                      // Menu DX
        IconButton(
            icon: Icon(RobBmi.themeNotifier.value == ThemeMode.light
                ? Icons.dark_mode
                : Icons.light_mode),
            onPressed: () {
              RobBmi.themeNotifier.value =
              RobBmi.themeNotifier.value == ThemeMode.light
                  ? ThemeMode.dark
                  : ThemeMode.light;
            }
        )
      ],
    );
  }

  Widget _SpinTitle(String _text)  {
    return Center(
      child: Text(
        _text,
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }

  Widget _SpinValue(double _min, double _max, double _value, int retValue) {
    return Container(
      width: AppTheme.fullWidth(context)/3,
      child: SpinBox(
        min: _min,
        max: _max,
        value: _value,
        spacing: 8,
        direction: Axis.vertical,
        textStyle: Theme.of(context).textTheme.headline3,
        incrementIcon: Icon(Icons.keyboard_arrow_up, size: 64),
        decrementIcon: Icon(Icons.keyboard_arrow_down, size: 64),
        iconColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {      // Quando arrivi al min/max si disabilita
            return Colors.grey;
          }
          if (states.contains(MaterialState.error)) {
            return Colors.red;
          }
          if (states.contains(MaterialState.focused)) {       // Manual entry
            return Colors.blue;
          }
          return Colors.black;
        }),
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          contentPadding: const EdgeInsets.all(24),
        ),

        onChanged: (double newValue) {
          setState(() {
            retValue = newValue.round();
          });
        },
      ),
    );
  }

  Widget _SpinUM(String _text)  {
    return Center(
      child: Text(
        _text,
        style: Theme.of(context).textTheme.subtitle2,
      ),
    );
  }

  //--- BODY - Menu ------------------------------------------------------------
  Widget _body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,

      children: <Widget>[

          //--- Data Input -----------------------------------------------------
          Card(
            elevation: 5,
            margin: const EdgeInsets.all(10.0),

            child: SizedBox(
              height: 370,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _SpinTitle(AppLocalizations.of(context)!.height),

                      Container(
                        width: AppTheme.fullWidth(context)/3,
                        child: SpinBox(
                          min: this.minHeight,
                          max: this.maxHeight,
                          value: 170,
                          spacing: 8,
                          direction: Axis.vertical,
                          textStyle: Theme.of(context).textTheme.headline3,
                          incrementIcon: Icon(Icons.keyboard_arrow_up, size: 64),
                          decrementIcon: Icon(Icons.keyboard_arrow_down, size: 64),
                          iconColor: MaterialStateProperty.resolveWith((states) {
                            if (states.contains(MaterialState.disabled)) {      // Quando arrivi al min/max si disabilita
                              return Colors.grey;
                            }
                            if (states.contains(MaterialState.error)) {
                              return Colors.red;
                            }
                            if (states.contains(MaterialState.focused)) {       // Manual entry
                              return Colors.blue;
                            }
                            return Colors.black;
                          }),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            contentPadding: const EdgeInsets.all(24),
                          ),

                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          },
                        ),
                      ),

                      _SpinUM('Cm'),
                    ],
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _SpinTitle(AppLocalizations.of(context)!.weight),

                      //_SpinValue(this.minWeight, this.maxWeight, 70, this.weight),
                      Container(
                        width: AppTheme.fullWidth(context)/3,
                        child: SpinBox(
                          min: this.minWeight,
                          max: this.maxWeight,
                          value: 70,
                          spacing: 8,
                          direction: Axis.vertical,
                          textStyle: Theme.of(context).textTheme.headline3,
                          incrementIcon: Icon(Icons.keyboard_arrow_up, size: 64),
                          decrementIcon: Icon(Icons.keyboard_arrow_down, size: 64),
                          iconColor: MaterialStateProperty.resolveWith((states) {
                            if (states.contains(MaterialState.disabled)) {      // Quando arrivi al min/max si disabilita
                              return Colors.grey;
                            }
                            if (states.contains(MaterialState.error)) {
                              return Colors.red;
                            }
                            if (states.contains(MaterialState.focused)) {       // Manual entry
                              return Colors.blue;
                            }
                            return Colors.black;
                          }),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            contentPadding: const EdgeInsets.all(24),
                          ),

                           onChanged: (double newValue) {
                             setState(() {
                               weight = newValue.round();
                             });
                           },
                        ),
                      ),

                      _SpinUM('Kg'),
                    ],
                  )

                ],
              ),
            )

          ),

          //--- RESULTS --------------------------------------------------------
          Card(
            elevation: 5,
            margin: const EdgeInsets.all(10.0),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child:
                  Text(
                    AppLocalizations.of(context)!.result,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),

                Container(                                                      // risultato numerico
                  padding: EdgeInsets.all(15),
                  child: Text(
                    result,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),

                Container(                                                      // risultato testuale
                  padding: EdgeInsets.all(15),
                  child: Text(
                    result_text,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
              ],
            ),

          ),

      ],
    );
  }

  //--- BODY - Bottom ----------------------------------------------------------
   Widget _bottom() {
     return
       Row(
         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
           Container(
             height: 55,
             width: 240,
             margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
             child:
             ElevatedButton(
               onPressed: () {
                 setState(() {
                   BmiCalculator calc = BmiCalculator(h: this.height, w: this.weight);
                   result = calc.calculateBMI();
                   result_text = calc.getResult();
                 });
               },
               child:  Text(
                 AppLocalizations.of(context)!.cmdCalculate,
               ),
             ),
           ),
         ],
       );
   }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar(),

        body: Column(
          children: [
            Home_Header(),
            _body(),
            _bottom(),
          ],
        )

    );
  }
}


class BmiCalculator {
  int h;
  int w;

  double _bmi = 0.0;

  BmiCalculator({required this.h, required this.w});

  String calculateBMI() {
    _bmi = w / pow(h / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'OVERWEIGHT';
    } else if (_bmi > 18.5) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }
}