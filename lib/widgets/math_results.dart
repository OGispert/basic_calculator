import 'package:calculadora/controllers/calculator_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'line_separator.dart';
import 'main_result.dart';
import 'sub_result.dart';

class MathResults extends StatelessWidget {
  MathResults({super.key});

  final calculatorCtrl = Get.find<CalculatorController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          SubResult(text: calculatorCtrl.firstNumber.value),
          SubResult(text: calculatorCtrl.operation.value),
          SubResult(text: calculatorCtrl.secondNumber.value),
          LineSeparator(),
          MainResultText(text: calculatorCtrl.result.value),
        ],
      ),
    );
  }
}
