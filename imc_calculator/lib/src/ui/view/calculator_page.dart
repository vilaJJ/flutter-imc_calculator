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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 64),
              child: Icon(
                Icons.person_2_outlined,
                size: 128,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4),
              child: CalculateTextFieldWidget(
                controller: heightTextController,
                prefixIcon: Icons.monitor_weight_rounded,
                labelText: "Altura (m)",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4),
              child: CalculateTextFieldWidget(
                controller: weightTextController,
                prefixIcon: Icons.height_rounded,
                labelText: "Peso (kg)",
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 64,
                    vertical: 16,
                  ),
                ),
                onPressed: () {},
                icon: const Icon(Icons.calculate_rounded),
                label: const Text("Calcular"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
