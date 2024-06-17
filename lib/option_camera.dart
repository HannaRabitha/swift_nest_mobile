import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:swift_nest/result.dart';

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
              ElevatedButton(
                onPressed: () {
                  _pickImagefromGallery();
                },
                child: const Text('Image from Gallery'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _openCamera();
                },
                child: const Text('Open Camera'),
              ),
              SizedBox(height: 20),
              _selectedImage == null
                  ? const Text('No image selected.')
                  : Image.file(
                      _selectedImage!,
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
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

    _navigateToResultPage();
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

    _navigateToResultPage();
  }

  void _navigateToResultPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultPage(
          imageFile: _selectedImage!,
        ),
      ),
    );
  }
}
