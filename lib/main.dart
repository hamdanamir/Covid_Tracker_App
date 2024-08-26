import 'package:covidapp4/view/splash_screen.dart';
import 'package:flutter/material.dart';
void main()
{
  runApp(const Hello());
}
class Hello extends StatelessWidget {
  const Hello({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
