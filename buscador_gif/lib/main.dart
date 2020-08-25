import 'package:flutter/material.dart';
import 'package:buscadorgif/ui/home_page.dart';
import 'package:buscadorgif/ui/gif_page.dart';

void main() {
  runApp(MaterialApp(
    title: "Buscador de GIF",
    home: HomePage(),
    theme: ThemeData(
        hintColor: Colors.white,
       inputDecorationTheme: InputDecorationTheme(
         enabledBorder: OutlineInputBorder(
           borderSide: BorderSide(color: Colors.white)
         )
       )
    ),
  ));
}
