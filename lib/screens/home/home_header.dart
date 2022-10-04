import 'dart:io';

import 'package:flutter/material.dart';


class Home_Header extends StatefulWidget {

  @override
  _Home_Header_State createState() => _Home_Header_State();
}

class _Home_Header_State extends State<Home_Header> {

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(                                                           // Titolo Pagina (da rimuovere)
      padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
      child:
      SizedBox(height: 10,),
    );
  }
}
