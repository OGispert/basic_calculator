import 'package:get/get.dart';

class CalculatorController extends GetxController {
  var firstNumber = ''.obs;
  var secondNumber = ''.obs;
  var operation = ''.obs;
  var result = '0'.obs;

  resetAll() {
    firstNumber.value = '';
    secondNumber.value = '';
    operation.value = '';
    result.value = '0';
  }

  addNumber(String number) {
    if (result.value == '0') {
      return result.value = number;
    }

    if (result.value == '-0') {
      return result.value = '-' + number;
    }

    result.value = result.value + number;
  }

  addDot() {
    if (result.contains('.')) return;

    result.value = result.value + '.';
  }

  changePositiveNegative() {
    if (result.startsWith('-')) {
      result.value = result.value.replaceFirst('-', '');
    } else {
      result.value = '-' + result.value;
    }
  }

  deleteLast() {
    if (result.value == '0') {
      return;
    }

    if ((result.startsWith('-') && result.value.length == 2) ||
        result.value.length == 1) {
      return result.value = '0';
    }

    if (result.value.endsWith('.')) {
      return result.value = result.value.replaceFirst('.', '');
    }

    result.value = result.value.replaceFirstMapped(
      RegExp(r'(\d+)'),
      (m) => '',
      result.value.length - 1,
    );
  }

  addOperation(String operator) {
    operation.value = operator;
    firstNumber.value = result.value;
    result.value = '0';
  }

  doTheMath() {
    var mathResult = '';
    final num1 = double.parse(firstNumber.value);
    final num2 = double.parse(result.value);
    secondNumber.value = result.value;

    switch (operation.value) {
      case '/':
        mathResult = (num1 / num2).toString();
      case 'X':
        mathResult = (num1 * num2).toString();
      case '-':
        mathResult = (num1 - num2).toString();
      case '+':
        mathResult = (num1 + num2).toString();
    }

    result.value = mathResult.replaceFirst('.0', '');
  }
}
