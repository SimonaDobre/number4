import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Check number',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int? inputNumber = 0;
  int nonNullNumber = 0;
  String checkMessage = 'here will be the message';
  final TextEditingController myController = TextEditingController();

  void checkNumber() {
    setState(() {
      inputNumber = int.tryParse(myController.text);
      if (inputNumber == null) {
        checkMessage = 'Please enter a valid number';
      } else {
        if (inputNumber == 1 ||
            inputNumber == 0 ||
            isSquareNumber() && isCubicNumber()) {
          checkMessage = 'The number $inputNumber is both a square and a cubic';
        } else if (isSquareNumber()) {
          checkMessage = 'The number $inputNumber is a square, but not a cubic';
        } else if (isCubicNumber()) {
          checkMessage = 'The number $inputNumber is  cubic, but not a square';
        } else {
          checkMessage =
              'The number $inputNumber is neither a square, nor a cubic';
        }
      }
    });
  }

  bool isSquareNumber() {
    for (int i = 0; i <= inputNumber! / 2; i++) {
      if (i * i == inputNumber) {
        return true;
      }
    }
    return false;
  }

  bool isCubicNumber() {
    for (int i = 0; i < inputNumber! / 3; i++) {
      if (i * i * i == inputNumber) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Please input a number to check whether it is a square or a cubic:',
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              style: const TextStyle(fontSize: 30),
              controller: myController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              checkMessage,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        ],
      ),
      floatingActionButton: Builder(
        builder: (BuildContext context2) {
          return FloatingActionButton(
            onPressed: () {
              checkNumber();
            },
            child: const Icon(Icons.add),
          );
        },
      ),
    );
  }
}
