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
  Widget buildButton() {
    return Expanded(
      child: OutlinedButton(
        onPressed: () => {},
        child: const Text("2"),
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
            const Text("0"),
            const Expanded(
              child: Divider(),
            ),
            Column(
              children: [
                Row(children: [
                  buildButton(),
                  buildButton(),
                  buildButton(),
                  buildButton(),
                ]),
                Row(children: [
                  buildButton(),
                  buildButton(),
                  buildButton(),
                  buildButton(),
                ]),
                Row(children: [
                  buildButton(),
                  buildButton(),
                  buildButton(),
                  buildButton(),
                ]),
                Row(children: [
                  buildButton(),
                  buildButton(),
                  buildButton(),
                  buildButton(),
                ]),
              ],
            )
          ],
        ));
  }
}
