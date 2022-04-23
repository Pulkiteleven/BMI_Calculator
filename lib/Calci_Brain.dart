import 'dart:math';

class Calci_Brain {
  Calci_Brain(this.weight, this.height);

  final int weight;
  final int height;



  late double bmi;



  String BMICalculator() {
    bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (bmi >= 25) {
      return 'Genda ho tum excersise kia karo';
    } else if (bmi > 18.5) {
      return 'Saabash';
    } else {
      return 'Kadi ho tum thoda zyada khaya karo';
    }
  }

  String getshort() {
    if (bmi >= 25) {
      return 'OverWeight';
    } else if (bmi > 18.5) {
      return 'Normal';
    } else {
      return 'UnderWeight';
    }
  }
}
