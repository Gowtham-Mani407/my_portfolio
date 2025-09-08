import 'package:flutter/material.dart';
import 'package:my_portfolio/portfolio.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Gowtham Mani Portfolio",
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const PortfolioPage(),
    );
  }
}
