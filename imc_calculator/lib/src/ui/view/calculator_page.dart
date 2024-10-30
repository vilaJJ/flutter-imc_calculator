import 'package:flutter/material.dart';
import 'package:imc_calculator/src/ui/view_model/calculator_view_model.dart';
import 'package:imc_calculator/src/ui/widgets/calculate_text_field_widget.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  late final CalculatorViewModel viewModel;
  late final TextEditingController heightTextController;
  late final TextEditingController weightTextController;

  @override
  void initState() {
    viewModel = CalculatorViewModel();
    heightTextController = TextEditingController();
    weightTextController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora de IMC"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const Icon(
              Icons.person_2_outlined,
              size: 128,
            ),
            CalculateTextFieldWidget(
              controller: heightTextController,
              prefixIcon: Icons.monitor_weight_rounded,
              labelText: "Altura (m)",
            ),
            CalculateTextFieldWidget(
              controller: weightTextController,
              prefixIcon: Icons.height_rounded,
              labelText: "Peso (kg)",
            ),
          ],
        ),
      ),
    );
  }
}
