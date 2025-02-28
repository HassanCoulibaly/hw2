import 'package:flutter/material.dart';

// Foungnigue Souleymane Hassan Coulibaly

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const CalculatorApp(),
    );
  }
}

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  String displayText = "";
  double? firstOperand;
  String operator = "";
  double? secondOperand;

  /// Function to handle button presses
  void _onButtonPressed(String value) {
    setState(() {
      if (value == "CLR") {
        // condition is CLR is pressed
        displayText = "";
        firstOperand = null;
        secondOperand = null;
        operator = "";
      } else if (value == "+" || value == "-" || value == "X" || value == "/") {
        //condition if either + - X or  / are pressed
        if (displayText.isNotEmpty) {
          firstOperand = double.parse(displayText);
          operator = value;
          displayText = "";
        }
      } else if (value == "=") {
        // condition to handle calculations and give a result
        if (displayText.isNotEmpty && operator.isNotEmpty) {
          secondOperand = double.parse(displayText);
          _calculateResult();
        }
      } else if (value == ".") {
        // Condition here to make sure that only one "." is considered
        if (!displayText.contains(".")) {
          displayText += ".";
        }
      } else {
        displayText += value;
      }
    });
  }

  /// Perform calculation based on operator
  void _calculateResult() {
    double result = 0;
    switch (operator) {
      case "+":
        result = firstOperand! + secondOperand!;
        break;
      case "-":
        result = firstOperand! - secondOperand!;
        break;
      case "X":
        result = firstOperand! * secondOperand!;
        break;
      case "/":
        if (secondOperand == 0) {
          displayText = "Error";
          return;
        }
        result = firstOperand! / secondOperand!;
        break;
    }
    setState(() {
      displayText = result.toString();
      firstOperand = null;
      secondOperand = null;
      operator = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Calculator")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Display screen
          Container(
            padding: const EdgeInsets.all(16),
            alignment: Alignment.centerRight,
            width: double.infinity,
            height: 80,
            color: Colors.black12,
            child: Text(displayText, style: const TextStyle(fontSize: 32)),
          ),
          const SizedBox(height: 20), // Space between display and buttons

          // Buttons Layout
          buildRow(["7", "8", "9", "X"]),
          const SizedBox(height: 10),
          buildRow(["4", "5", "6", "-"]),
          const SizedBox(height: 10),
          buildRow(["1", "2", "3", "+"]),
          const SizedBox(height: 10),
          buildRow(["CLR", "0", ".", "/"]),
          const SizedBox(height: 10),
          buildRow(["="]),
        ],
      ),
    );
  }

  // I setted here a Rows of buttons to be able to handle the buttons
  Widget buildRow(List<String> texts) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: texts
          .map(
            (text) => SizedBox(
              width: 70,
              height: 70,
              child: ElevatedButton(
                // My fonction to make calculations is called here
                onPressed: () => _onButtonPressed(text),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(text, style: const TextStyle(fontSize: 24)),
              ),
            ),
          )
          .toList(),
    );
  }
}
