import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key, required this.imageFile});
  final File imageFile;

  @override
  State<ResultPage> createState() => _ResultPage();
}

class _ResultPage extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Scaffold(
        appBar: AppBar(
          title: Text('Result Page'),
        ),
        body: Container(
          decoration: const BoxDecoration(
              // gradient: LinearGradient(
              //     begin: Alignment.topRight,
              //     end: Alignment.bottomLeft,
              //     colors: [Colors.tealAccent, Colors.teal]),
              ),
          child: Center(
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Text(
                    'Welcome!',
                    style: TextStyle(
                      color: HexColor('#071330'),
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Positioned(
                    left: 50,
                    right: 50,
                    top: 0,
                    bottom: 50,
                    child: Image.file(
                      widget.imageFile,
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    )),
                SizedBox(height: 40),
                ElevatedButton(
                  style: style,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('New Image'),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
