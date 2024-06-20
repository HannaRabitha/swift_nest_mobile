import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:swift_nest/about.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:swift_nest/option_camera.dart';
// import 'package:swift_nest/screen/splash_screen.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Future.delayed(Duration(seconds: 5));
  FlutterNativeSplash.remove();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Swift's Nest",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: "Swift's Nest"),
      // debugShowCheckedModeBanner: false,
      // home: SplashScreen(),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500));

    final ButtonStyle style2 = ElevatedButton.styleFrom(
      backgroundColor: Colors.teal.shade900,
      foregroundColor: Colors.white,
      //border radius
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
    );

    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        //   title: Text(widget.title),
        // ),
        body: Container(
      padding: const EdgeInsets.all(20),
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
                  color: Colors.teal.shade900,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 40),
            const SizedBox(
                width: double.infinity,
                child: Image(
                  image: AssetImage('assets/images/drawkit1.png'),
                )),
            // Positioned(
            //     left: 50,
            //     right: 50,
            //     top: 0,
            //     bottom: 50,
            //     child: SvgPicture.asset(
            //       'assets/images/nature.svg',
            //       semanticsLabel: 'Swift Nest Logo',
            //       width: 300,
            //       height: 300,
            //     )),
            const SizedBox(height: 20),
            Center(
              child: Text(
                'Klasifikasi Bentuk \n Sarang Burung Walet',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: HexColor('#071330'),
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 5),

            Center(
              child: Text(
                'menggunakan Efficientnet',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: HexColor('#BDBDBD'),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 40),
            // const SizedBox(
            //     width: 60,
            //     child: Image(
            //       image: AssetImage('assets/images/drawkit-clock.png'),
            //     )),
            SizedBox(height: 40),
            SizedBox(
              //full width
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: style2,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AboutPage()),
                  );
                },
                child: const Text('Tentang Walet'),
              ),
            ),

            SizedBox(height: 20),
            SizedBox(
              //full width
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: style,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OptionCameraPage()),
                  );
                },
                child: const Text('Mulai Klasifikasi'),
              ),
            )

            // ElevatedButton(
            //   style: style,
            //   onPressed: _incrementCounter,
            //   child: const Text('Function Btn'),
            // ),
            // const Text(
            //   'Check number test:',
            // ),
            // Text(
            //   '$_counter',
            //   style: Theme.of(context).textTheme.headlineMedium,
            // ),
          ],
        ),
      ),

      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ),
    )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
