import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 248, 108, 21)),
        useMaterial3: true,
      ),
      home: const calculatorApp(title: 'Calculator App'),
    );
  }
}

class calculatorApp extends StatefulWidget {
  const calculatorApp({super.key, required this.title});

  final String title;

  @override
  State<calculatorApp> createState() => _calculatorAppState();
}

class _calculatorAppState extends State<calculatorApp> {
  // variables declarations
  List _chiffres = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0];

// functions creation
  void _addition() {
    setState(() {});
  }

  void _substraction() {}

  void _multiplication() {}

  void _division() {}

  void _display(int display) {
    int display = 0;
    _chiffres[display];
    return _display(display);
  }

// here start the User Interface
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // operations will be displayed in this screen
            Container(
              alignment: Alignment.center,
              width: 20.5,
              height: 20.5,
            ),

            // calculator buttons here
            // Line 1
            Row(
              children: [
                ElevatedButton(onPressed: _display(1), child: Text("1")),
                ElevatedButton(onPressed: () {}, child: Text("2")),
                ElevatedButton(onPressed: () {}, child: Text("3")),
                ElevatedButton(onPressed: _multiplication, child: Text("X")),
              ],
            ),

            //Line2
            Row(
              children: [
                ElevatedButton(onPressed: () {}, child: Text("4")),
                ElevatedButton(onPressed: () {}, child: Text("5")),
                ElevatedButton(onPressed: () {}, child: Text("6")),
                ElevatedButton(onPressed: _addition, child: Text("+")),
              ],
            ),

            //Line3
            Row(
              children: [
                ElevatedButton(onPressed: () {}, child: Text("7")),
                ElevatedButton(onPressed: () {}, child: Text("8")),
                ElevatedButton(onPressed: () {}, child: Text("9")),
                ElevatedButton(onPressed: _substraction, child: Text("-")),
              ],
            ),

            //Line4
            Row(
              children: [
                ElevatedButton(onPressed: () {}, child: Text("0")),
                ElevatedButton(onPressed: () {}, child: Text("Clear")),
                ElevatedButton(onPressed: () {}, child: Text(".")),
                ElevatedButton(onPressed: _division, child: Text("/")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
