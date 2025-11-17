import 'package:flutter/material.dart';
import 'main_layout.dart'; // Importa el "cascarón" principal

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Escolar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // La app inicia en MainLayout
      home: const MainLayout(),
    );
  }
}