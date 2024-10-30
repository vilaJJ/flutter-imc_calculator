enum ImcClassification {
  belowNormalWeight(
    minimium: null,
    maximium: 18.5,
    description: "Abaixo do peso normal",
  ),
  normalWeight(
    minimium: 18.5,
    maximium: 25,
    description: "Peso normal",
  ),
  overweight(
    minimium: 25,
    maximium: 30,
    description: "Acima do peso",
  ),
  obesity1(
    minimium: 30,
    maximium: 35,
    description: "Obesidade 1",
  ),
  obesity2(
    minimium: 35,
    maximium: 40,
    description: "Obesidade 2",
  ),
  obesity3(
    minimium: 40,
    maximium: null,
    description: "Obesidade 3 (mórbida)",
  );

  const ImcClassification({
    required this.minimium,
    required this.maximium,
    required this.description,
  });

  final double? minimium;
  final double? maximium;
  final String description;

  static ImcClassification getByImcValue(double imcValue) {
    return ImcClassification.values.firstWhere(
      (e) => (e.minimium == null || e.minimium! >= imcValue) && (e.maximium == null || e.maximium! < imcValue),
    );
  }
}
