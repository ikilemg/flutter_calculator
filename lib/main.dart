import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter anan',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String output = "0";
  String aoutput = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonPressed(String buttonText) {
    if (buttonText == "CLEAR") {
      aoutput = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "/" ||
        buttonText == "X") {
      num1 = double.parse(output);

      operand = buttonText;

      aoutput = "0";
    } else if (buttonText == ".") {
      if (aoutput.contains(".")) {
        print("Already contains a decimals");
        return;
      } else {
        aoutput = aoutput + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(output);

      if (operand == "+") {
        aoutput = (num1 + num2).toString();
      }
      if (operand == "-") {
        aoutput = (num1 - num2).toString();
      }
      if (operand == "X") {
        aoutput = (num1 * num2).toString();
      }
      if (operand == "/") {
        aoutput = (num1 / num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      aoutput = aoutput + buttonText;
    }

    print(aoutput);
    setState(() {
      output = double.parse(aoutput).toStringAsFixed(2);
    });
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () => buttonPressed(buttonText),
        style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.all(24.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.0))),
        child: Text(
          buttonText,
          style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: <Widget>[
            Container(
                alignment: Alignment.centerRight,
                padding:
                    new EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
                child: Text(
                  output,
                  style: const TextStyle(
                    fontSize: 36.0,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            const Expanded(
              child: Divider(),
            ),
            Column(
              children: [
                Row(children: [
                  buildButton("7"),
                  buildButton("8"),
                  buildButton("9"),
                  buildButton("/"),
                ]),
                Row(children: [
                  buildButton("4"),
                  buildButton("5"),
                  buildButton("6"),
                  buildButton("X"),
                ]),
                Row(children: [
                  buildButton("1"),
                  buildButton("2"),
                  buildButton("3"),
                  buildButton("-"),
                ]),
                Row(children: [
                  buildButton("."),
                  buildButton("0"),
                  buildButton("00"),
                  buildButton("+"),
                ]),
                Row(children: [
                  buildButton("CLEAR"),
                  buildButton("="),
                ]),
              ],
            )
          ],
        ));
  }
}
