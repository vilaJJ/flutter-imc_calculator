import 'dart:math';

import 'package:imc_calculator/src/entity/enums/imc_classification_enum.dart';
import 'package:imc_calculator/src/entity/model/imc_calculate_result_model.dart';
import 'package:imc_calculator/src/entity/model/person_model.dart';

class CalculatorViewModel {
  ImcCalculateResultModel calculate(PersonModel person) {
    final imcValue = person.weight * pow(person.height, 2);
    final classification = ImcClassification.getByImcValue(imcValue);
    return ImcCalculateResultModel(classification, imcValue);
  }
}
