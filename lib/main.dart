
import 'package:flutter/material.dart';
import 'package:invoice_final_app/view/screen/add_screen.dart';
import 'package:invoice_final_app/view/screen/edit_screen.dart';
import 'package:invoice_final_app/view/screen/home_screen.dart';
import 'package:invoice_final_app/view/screen/pdf_screen.dart';
import 'package:invoice_final_app/view/screen/product_screne.dart';


void main() {
  runApp(
    MaterialApp(
    debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      initialRoute: 'home',
      routes: {

        'home': (context) => HomeScreen(),
        'edit':(context) => edit(),
        'item': (context) => ItemScreen(),
        'cart': (context) => CartScreen(),
         'pdf': (context) => PdfScreen(),
      },
    ),
  );
}
