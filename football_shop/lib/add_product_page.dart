import 'package:flutter/material.dart';

class AddProductPage extends StatefulWidget {
  /* Boilerplate... */
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _thumbnailController = TextEditingController();
  final _categoryController = TextEditingController();
  late bool _isFeatured;

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    _thumbnailController.dispose();
    _categoryController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _isFeatured = false;
  }

  void _saveProduct() {
    if (_formKey.currentState!.validate()) {
      // load data from controllers into dict
      final productData = {
        'name': _nameController.text,
        'price': double.parse(_priceController.text),
        'description': _descriptionController.text,
        'thumbnail': _thumbnailController.text,
        'category': _categoryController.text,
        'isFeatured': _isFeatured,
      };

      // popup with data
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Product Saved'),
          content: Text(
            'Name: ${productData['name']}\n'
            'Price: \$${productData['price']}\n'
            'Description: ${productData['description']}\n'
            'Thumbnail URL: ${productData['thumbnail']}\n'
            'Category: ${productData['category']}\n'
            'Featured: ${(productData['isFeatured'] as bool) ? "Yes" : "No"}',
          ),
          actions: [
            TextButton(
              // close dialog
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Add new product')),
    body: Padding(
      // padding around form 16px
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            
            /* Name input form */
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'), // this decoration shows a label above the input field
              validator: (value) {
                if (value == null || value.isEmpty) return 'Please enter a product name';
                if (value.length > 100) return 'Name length should be 1-100 chars';
                return null;
              },
            ),

            /* Desc input form */
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
              maxLines: 3,
              validator: (value) {
                if (value == null || value.isEmpty) return 'Pls enter a desc';
                if (value.length < 10 || value.length > 500) return 'Desc should be 10-500 chars';
                return null;
              },
            ),

            /* Price input form */
            TextFormField(
              controller: _priceController,
              decoration: const InputDecoration(labelText: 'Price'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) return 'Price cannot be empty';
                final parsePrice = double.tryParse(value); // final can only be assigned once, safe
                if (parsePrice == null || parsePrice <= 0) return 'Price must be a positive number';
                return null;
              },
            ),

            /* Thumbnail input */
            TextFormField(
              controller: _thumbnailController,
              decoration: const InputDecoration(labelText: 'Thumbnail (URL)'),
              validator: (value) {
                if (value == null || value.isEmpty) return 'Thumbnail cannot be empty';
                // Add URL validation if needed, e.g., using a regex
                return null;
              },
            ),
            TextFormField(
              controller: _categoryController,
              decoration: const InputDecoration(labelText: 'Category'),
              validator: (value) {
                if (value == null || value.isEmpty) return 'Category cannot be empty';
                return null;
              },
            ),
            CheckboxListTile(
              title: const Text('Is Featured'),
              value: _isFeatured,
              onChanged: (value) => setState(() => _isFeatured = value ?? false),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveProduct,
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    ),
  );
}