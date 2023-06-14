# amazing_calendar

This is a calendar widget that is designed in white-black themed UI design.

## Introduction

This package is used as a calendar widget and developers don't have to code a single line to make the algorithm work. The default date is set for today.

IMP: FOR NOW THE THE OUTPUT DATA IS IN THE FORM OF A TEXT. CLICK THE TEXT TO VIEW CALENDAR.

To know more, view the screenshots:


<p>
<img src="https://github.com/gauthiii/fibonacci/assets/35861219/22fb5364-6618-44ce-806c-0c50379966ec" height="400">
  <img src="https://github.com/gauthiii/fibonacci/assets/35861219/80fe8304-af4f-4cc8-94ac-1c09e2d463c3" height="400">
  <img src="https://github.com/gauthiii/fibonacci/assets/35861219/be993134-58fc-4160-9afa-0a560797fc9d" height="400">
<br>
</p>

## Installation

```yaml
dependecies:
  amazing_calendar: 0.0.1
```

## Example

See `example/main.dart`

```dart
import 'package:flutter/material.dart';
import 'package:amazing_calendar/amazing_calendar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Amazing Calendar',
      theme: ThemeData.dark(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController con = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Amazing Calendar'),
        backgroundColor: Colors.grey[900],
      ),
      backgroundColor: _getColorFromHex("#8E150D"),
      body: Center(
        child: ListView(
          children: <Widget>[
            Container(height: 50),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 75),
                child: Container(
                  color: Colors.black,
                  width: 85,
                  height: 50,
                  alignment: Alignment.center,
                  child: const AmazingCalendar(
                    textStyle: TextStyle(
                        fontFamily: "Poppins-Regular",
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                )),
            const Center(
                child: SelectableText("\nClick the text to change date",
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black))),
            Container(height: 30),
            const Center(
                child: SelectableText(
                    "Package created By: Gauthiii's Applications",
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black))),
            Container(height: 30),
          ],
        ),
      ),
    );
  }
}

_getColorFromHex(String hexColor) {
  hexColor = hexColor.replaceAll("#", "");
  if (hexColor.length == 6) {
    hexColor = "FF$hexColor";

    return Color(int.parse("0x$hexColor"));
  }

  if (hexColor.length == 8) {
    return Color(int.parse("0x$hexColor"));
  }
}

```
