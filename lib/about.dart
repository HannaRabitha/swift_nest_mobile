import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:swift_nest/data_walet.dart';

class AboutPage extends StatelessWidget {
  AboutPage({super.key});

  // var mangkok = DataWalet(
  //     title: 'Mangkok', image: 'assets/images/mangkok.png', description: '');
  // var oval = DataWalet(
  //     title: 'Oval', image: 'assets/images/oval.png', description: '');
  // var sudut = DataWalet(
  //     title: 'Sudut', image: 'assets/images/sudut.png', description: '');

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
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // const Text(
            //   'You have pushed the button this many times:',
            // ),
            const SizedBox(
                width: 150,
                child: Image(
                  image: AssetImage('assets/images/drawkit-lamp.png'),
                )),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
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
            const SizedBox(
              height: 20,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 6,
                  child: ListTile(
                    leading: Image(
                      width: 100,
                      image: AssetImage(dataWalet[index]['image']),
                    ),
                    title: Text(dataWalet[index]['title'],
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 203, 130, 3)),
                        textAlign: TextAlign.left),
                    subtitle: Text(dataWalet[index]['description']),
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(dataWalet[index]['title'],
                                  style: const TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 203, 130, 3))),
                              // content: Text(dataWalet[index]['description']),
                              content: Image(
                                image: AssetImage(dataWalet[index]['image']),
                              ),
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
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
