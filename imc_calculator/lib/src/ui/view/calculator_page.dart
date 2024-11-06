import 'package:flutter/material.dart';
import 'package:imc_calculator/src/entity/model/imc_calculate_result_model.dart';
import 'package:imc_calculator/src/entity/model/person_model.dart';
import 'package:imc_calculator/src/ui/view_model/calculator_view_model.dart';
import 'package:imc_calculator/src/ui/widgets/calculate_result_widget.dart';
import 'package:imc_calculator/src/ui/widgets/calculate_text_field_widget.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  late final CalculatorViewModel viewModel;
  late final GlobalKey<FormState> formKey;
  late final TextEditingController heightTextController;
  late final TextEditingController weightTextController;
  late final FocusNode heightFocusNode;
  late final FocusNode weightFocusNode;

  ImcCalculateResultModel? calculateResult;

  @override
  void initState() {
    viewModel = CalculatorViewModel();
    formKey = GlobalKey<FormState>();
    heightTextController = TextEditingController();
    weightTextController = TextEditingController();
    heightFocusNode = FocusNode();
    weightFocusNode = FocusNode();

    heightTextController.addListener(updateView);
    weightTextController.addListener(updateView);

    super.initState();
  }

  @override
  void dispose() {
    heightTextController.removeListener(updateView);
    weightTextController.removeListener(updateView);

    heightTextController.dispose();
    weightTextController.dispose();
    heightFocusNode.dispose();
    weightFocusNode.dispose();
    super.dispose();
  }

  bool get isInputInitialized {
    return heightTextController.text.isNotEmpty || weightTextController.text.isNotEmpty || calculateResult != null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora de IMC"),
        centerTitle: true,
        actions: [
          Visibility(
            visible: isInputInitialized,
            child: IconButton(
              onPressed: clearForm,
              icon: const Icon(Icons.refresh_rounded),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 64),
                  child: Icon(
                    Icons.person_2_outlined,
                    color: calculateResult?.classification.color,
                    size: 128,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: CalculateTextFieldWidget(
                    controller: heightTextController,
                    focusNode: heightFocusNode,
                    prefixIcon: Icons.monitor_weight_rounded,
                    labelText: "Altura (m)",
                    onFieldSubmitted: focusWeightField,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: CalculateTextFieldWidget(
                    controller: weightTextController,
                    focusNode: weightFocusNode,
                    prefixIcon: Icons.height_rounded,
                    labelText: "Peso (kg)",
                    onFieldSubmitted: calculate,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 32),
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 64,
                        vertical: 16,
                      ),
                    ),
                    onPressed: calculate,
                    icon: const Icon(Icons.calculate_rounded),
                    label: const Text("Calcular"),
                  ),
                ),
                CalculateResultWidget(
                  result: calculateResult,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void updateView() => setState(() {});

  void clearForm() {
    clearAllFocus();

    calculateResult = null;
    heightTextController.clear();
    weightTextController.clear();
  }

  void focusWeightField() {
    weightFocusNode.requestFocus();
  }

  void clearAllFocus() {
    FocusScope.of(context).unfocus();
  }

  void calculate() {
    if (formKey.currentState?.validate() == false) {
      return;
    }

    clearAllFocus();

    final person = PersonModel(
      weight: double.parse(weightTextController.text),
      height: double.parse(heightTextController.text),
    );

    setState(() {
      calculateResult = viewModel.calculate(person);
    });
  }
}
