import 'dart:io';
import 'package:aplikasi_pelaporan_kekerasan/services/cloudinary_service.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CloudinaryTestPage extends StatefulWidget {
  const CloudinaryTestPage({super.key});

  @override
  State<CloudinaryTestPage> createState() => _CloudinaryTestPageState();
}

class _CloudinaryTestPageState extends State<CloudinaryTestPage> {
  final CloudinaryService _cloudinary = CloudinaryService();

  File? _imageFile;
  File? _audioFile;

  String? _imageUrl;
  String? _audioUrl;

  bool _isLoading = false;

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);

    if (picked != null) {
      setState(() {
        _imageFile = File(picked.path);
      });
    }
  }

  Future<void> pickAudio() async {
    final typeGroup = XTypeGroup(
      label: 'audio',
      extensions: ['mp3', 'wav', 'm4a'],
    );

    final file = await openFile(acceptedTypeGroups: [typeGroup]);

    if (file != null) {
      setState(() {
        _audioFile = File(file.path);
      });
    }
  }

  Future<void> upload() async {
    setState(() => _isLoading = true);

    try {
      if (_imageFile != null) {
        final url = await _cloudinary.uploadFile(_imageFile!);
        _imageUrl = url;
      }

      if (_audioFile != null) {
        final url = await _cloudinary.uploadFile(_audioFile!);
        _audioUrl = url;
      }

      setState(() {});
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Upload gagal: $e")));
    }

    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Test Cloudinary Upload")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: pickImage,
              child: const Text("Pilih Gambar"),
            ),

            if (_imageFile != null) ...[
              const SizedBox(height: 10),
              Image.file(_imageFile!, height: 150),
            ],

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: pickAudio,
              child: const Text("Pilih Audio"),
            ),

            if (_audioFile != null) ...[
              const SizedBox(height: 10),
              Text("Audio: ${_audioFile!.path.split('/').last}"),
            ],

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: _isLoading ? null : upload,
              child: _isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text("Upload"),
            ),

            const SizedBox(height: 30),

            if (_imageUrl != null) ...[
              const Text("Image URL:"),
              SelectableText(_imageUrl!),
              const SizedBox(height: 20),
            ],

            if (_audioUrl != null) ...[
              const Text("Audio URL:"),
              SelectableText(_audioUrl!),
            ],
          ],
        ),
      ),
    );
  }
}
