import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imc_calculator/src/ui/view/calculator_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp(
      title: "Calculadora IMC",
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const CalculatorPage(),
    );
  }
}
