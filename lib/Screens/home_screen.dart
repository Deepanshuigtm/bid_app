import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';

import 'package:path/path.dart' as path;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  final _nameController = TextEditingController();
  final _descController = TextEditingController();
  final _priceController = TextEditingController();
  String? _selectedCategory;
  File? _image;
  final _picker = ImagePicker();
  bool _isLoading = false;

  final List<String> _categories = [
    'Electronics',
    'Clothing',
    'Furniture',
    'Books',
    'Other'
  ];

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() => _image = File(pickedFile.path));
    }
  }

  Future<String> _saveImageLocally(File image) async {
    try {
      // Get the app's documents directory
      final directory = await getApplicationDocumentsDirectory();
      final String storagePath = '${directory.path}/product_images';

      // Create directory if it doesn't exist
      await Directory(storagePath).create(recursive: true);

      // Generate unique filename
      String fileName = '${DateTime.now().millisecondsSinceEpoch}${path.extension(image.path)}';
      String filePath = '$storagePath/$fileName';

      // Copy the image to local storage
      await image.copy(filePath);

      return filePath;
    } catch (e) {
      throw Exception('Failed to save image locally: $e');
    }
  }

  Future<void> _uploadProduct() async {
    if (_nameController.text.isEmpty ||
        _priceController.text.isEmpty ||
        _selectedCategory == null ||
        _image == null) {
      Fluttertoast.showToast(msg: "Please fill all fields");
      return;
    }

    setState(() => _isLoading = true);

    try {
      // Save image locally and get its path
      String imagePath = await _saveImageLocally(_image!);

      // Save product details to Firestore with local image path
      await FirebaseFirestore.instance.collection('products').add({
        'name': _nameController.text,
        'description': _descController.text,
        'price': double.parse(_priceController.text),
        'category': _selectedCategory,
        'imagePath': imagePath,  // Store local path instead of URL
        'timestamp': FieldValue.serverTimestamp(),
      });

      _clearForm();
      Fluttertoast.showToast(msg: "Product uploaded successfully");
    } catch (e) {
      print('error: $e');
      Fluttertoast.showToast(msg: "Error: ${e.toString()}");
    }

    setState(() => _isLoading = false);
  }

  void _clearForm() {
    _nameController.clear();
    _descController.clear();
    _priceController.clear();
    setState(() {
      _selectedCategory = null;
      _image = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
        backgroundColor: const Color(0xFF0057FF),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Product Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _descController,
              decoration: const InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _priceController,
              decoration: const InputDecoration(
                labelText: 'Price',
                border: OutlineInputBorder(),
                prefixText: '\$ ',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _selectedCategory,
              decoration: const InputDecoration(
                labelText: 'Category',
                border: OutlineInputBorder(),
              ),
              items: _categories.map((category) => DropdownMenuItem(
                value: category,
                child: Text(category),
              )).toList(),
              onChanged: (value) => setState(() => _selectedCategory = value),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: _pickImage,
              child: Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: _image != null
                    ? Image.file(_image!, fit: BoxFit.cover)
                    : const Icon(Icons.add_a_photo, size: 50, color: Color(0xFF1A2B3C)),
              ),
            ),
            const SizedBox(height: 24),
            _isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
              onPressed: _uploadProduct,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0057FF),
                padding: const EdgeInsets.symmetric(
                    horizontal: 32, vertical: 16),
              ),
              child: const Text(
                'Upload Product',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}