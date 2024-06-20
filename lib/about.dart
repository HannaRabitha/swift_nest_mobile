import 'dart:convert';

import 'package:flutter/material.dart';

class DataWalet {
  final String title;
  final String image;
  final String description;

  DataWalet({
    required this.title,
    required this.image,
    required this.description,
  });

  factory DataWalet.fromJson(Map<String, dynamic> json) {
    return DataWalet(
      title: json['title'],
      image: json['image'],
      description: json['description'],
    );
  }
}

class AboutPage extends StatelessWidget {
  AboutPage({super.key});

  var mangkok = DataWalet(
      title: 'Mangkok', image: 'assets/images/mangkok.png', description: '');
  var oval = DataWalet(
      title: 'Oval', image: 'assets/images/oval.png', description: '');
  var sudut = DataWalet(
      title: 'Sudut', image: 'assets/images/sudut.png', description: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[900],
        foregroundColor: Colors.white,
        // title: const Text('About Page'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.teal[900],
        ),
        child: const Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // const Text(
            //   'You have pushed the button this many times:',
            // ),
            SizedBox(
                width: 150,
                child: Image(
                  image: AssetImage('assets/images/drawkit-lamp.png'),
                )),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: Text(
                'Sarang Burung Walet',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CardExample(dataWalet: ''),
            CardExample(dataWalet: ''),
            CardExample(dataWalet: ''),
          ],
        ),
      ),
    );
  }
}

class CardExample extends StatelessWidget {
  const CardExample({super.key, required this.dataWalet});

  final dataWalet;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        // clipBehavior is necessary because, without it, the InkWell's animation
        // will extend beyond the rounded edges of the [Card] (see https://github.com/flutter/flutter/issues/109776)
        // This comes with a small performance cost, and you should not set [clipBehavior]
        // unless you need it.
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            //open dialog

            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Dialog Title'),
                    content: Text('This is the content of the dialog'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Close'),
                      ),
                    ],
                  );
                });
          },
          child: const SizedBox(
              width: double.infinity,
              child: Image(
                height: 150,
                image: AssetImage('assets/images/mangkok.png'),
              )),
        ),
      ),
    );
  }
}
