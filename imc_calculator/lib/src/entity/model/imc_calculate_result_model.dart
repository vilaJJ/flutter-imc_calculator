import 'package:imc_calculator/src/entity/enums/imc_classification_enum.dart';

class ImcCalculateResultModel {
  ImcCalculateResultModel(
    this.classification,
    this.value,
  );

  final ImcClassification classification;
  final double value;
}
