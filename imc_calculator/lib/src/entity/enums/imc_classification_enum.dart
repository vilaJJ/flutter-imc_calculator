import 'package:flutter/material.dart';

enum ImcClassification {
  belowNormalWeight(
    minimium: null,
    maximium: 18.5,
    description: "Abaixo do peso normal",
    color: Colors.amber,
  ),
  normalWeight(
    minimium: 18.5,
    maximium: 25,
    description: "Peso normal",
    color: Colors.green,
  ),
  overweight(
    minimium: 25,
    maximium: 30,
    description: "Acima do peso",
    color: Colors.orange,
  ),
  obesity1(
    minimium: 30,
    maximium: 35,
    description: "Obesidade 1",
    color: Colors.deepOrange,
  ),
  obesity2(
    minimium: 35,
    maximium: 40,
    description: "Obesidade 2",
    color: Colors.red,
  ),
  obesity3(
    minimium: 40,
    maximium: null,
    description: "Obesidade 3 (mórbida)",
    color: Colors.black,
  );

  const ImcClassification({
    required this.minimium,
    required this.maximium,
    required this.description,
    required this.color,
  });

  final double? minimium;
  final double? maximium;
  final String description;
  final Color color;

  static ImcClassification getByImcValue(double imcValue) {
    return ImcClassification.values.firstWhere(
      (e) => (e.minimium == null || e.minimium! <= imcValue) && (e.maximium == null || e.maximium! > imcValue),
    );
  }
}
