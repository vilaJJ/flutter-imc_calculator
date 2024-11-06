import 'package:flutter/material.dart';
import 'package:imc_calculator/src/entity/model/imc_calculate_result_model.dart';

class CalculateResultWidget extends StatelessWidget {
  const CalculateResultWidget({
    super.key,
    required this.result,
  });

  final ImcCalculateResultModel? result;

  @override
  Widget build(BuildContext context) {
    if (this.result == null) {
      return const SizedBox.shrink();
    }

    final result = this.result!;

    return Column(
      children: [
        Text(
          result.value.toStringAsFixed(2),
          style: TextStyle(
            color: result.classification.color,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(result.classification.description),
      ],
    );
  }
}
