import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:swift_nest/option_camera.dart';

class ResultPage extends StatefulWidget {
  final String imagePath;
  final String prediction;
  const ResultPage(
      {super.key, required this.imagePath, required this.prediction});
  

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
                    'Classification',
                    style: TextStyle(
                      color: HexColor('#071330'),
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    widget.prediction,
                    style: TextStyle(
                      color: HexColor('#028476'),
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Positioned(
                    left: 50,
                    right: 50,
                    top: 0,
                    bottom: 50,
                    child: Image.file(
                      File(widget.imagePath),
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    )),
                const SizedBox(height: 40),
                ElevatedButton(
                  style: style,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OptionCameraPage()));
                  },
                  child: const Text('Back to Camera'),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
