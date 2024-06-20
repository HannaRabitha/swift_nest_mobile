import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:swift_nest/result.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:hexcolor/hexcolor.dart';

class OptionCameraPage extends StatefulWidget {
  const OptionCameraPage({super.key});

  @override
  State<OptionCameraPage> createState() => _OptionCameraPage();
}

class _OptionCameraPage extends State<OptionCameraPage> {
  File? _selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Klasifikasi'),
      ),
      body: Container(
        decoration: const BoxDecoration(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                  width: 200,
                  child: Image(
                    image: AssetImage('assets/images/drawkit-circle.png'),
                  )),
              const SizedBox(height: 40),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.teal.shade900),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  textStyle: MaterialStateProperty.all<TextStyle>(
                      const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500)),
                ),
                onPressed: () {
                  _pickImagefromGallery();
                },
                child: const Text('Image from Gallery',
                    style: TextStyle(fontSize: 20)),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  _openCamera();
                },
                child:
                    const Text('Open Camera', style: TextStyle(fontSize: 20)),
              ),
              SizedBox(height: 30),
              Center(
                child: Text(
                  'Select a Picture',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: HexColor('#BDBDBD'),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              // _selectedImage == null
              //     ? const Text('No image selected.')
              //     : Image.file(
              //         _selectedImage!,
              //         width: 200,
              //         height: 200,
              //         fit: BoxFit.cover,
              //       ),
            ],
          ),
        ),
      ),
    );
  }

  Future _pickImagefromGallery() async {
    // ignore: deprecated_member_use
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (returnedImage == null) {
      return;
    }

    setState(() {
      _selectedImage = File(
        returnedImage!.path,
      );
    });

    _uploadImage(_selectedImage!);
  }

  Future _openCamera() async {
    // ignore: deprecated_member_use
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (returnedImage == null) {
      return;
    }

    setState(() {
      _selectedImage = File(
        returnedImage!.path,
      );
    });

    _uploadImage(_selectedImage!);
  }

  void _uploadImage(File imageFile) async {
    // loading dialog
    showDialog(
      context: this.context,
      builder: (BuildContext context) {
        return const AlertDialog(
          title: Text('Loading'),
          content: Text('Please wait...'),
          // actions: <Widget>[
          //   TextButton(
          //     onPressed: () {
          //       Navigator.of(context).pop();
          //     },
          //     child: const Text('OK'),
          //   ),
          // ],
        );
      },
    );

    var uri = Uri.parse('https://e6d8-118-136-245-162.ngrok-free.app/walet');
    // print('connection established.');
    var request = http.MultipartRequest('POST', uri);
    request.files
        .add(await http.MultipartFile.fromPath('file', imageFile.path));

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    final result = jsonDecode(response.body) as Map<String, dynamic>;

    print(result);
    print('response received.');

    if (response.statusCode == 200) {
      print('Uploaded!');

      // close dialog
      Navigator.of(this.context).pop();

      Navigator.push(
          this.context,
          MaterialPageRoute(
              builder: (context) => ResultPage(
                  imageFile: _selectedImage!,
                  prediction: result['prediction'])));
    } else {
      print('Failed!');
      //alert dialog
      showDialog(
        context: this.context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Failed to upload image.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}
