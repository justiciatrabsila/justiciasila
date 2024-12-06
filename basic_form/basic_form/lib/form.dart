import 'package:flutter/material.dart';

class SweetizStoreFormWidget extends StatefulWidget {
  @override
  _SweetizStoreFormWidgetState createState() => _SweetizStoreFormWidgetState();
}

class _SweetizStoreFormWidgetState extends State<SweetizStoreFormWidget> {
  // Form Controllers
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _dateAvailableController =
      TextEditingController();

  // Job Positions Dropdown
  List<String> _jobPositions = [
    'Chef',
    'Baker',
    'Waiter',
    'Cashier',
    'Cake Decorator',
    'Pâtissier',
    'Delivery Person',
    'Cleaner'
  ];
  String? _selectedJobPosition;

  // Employment Type Switch
  bool _isFullTime = true;

  // Experience Level Radio
  String? _experienceLevel = 'Entry Level';

  // Relocation Checkbox
  bool _willingToRelocate = false;

  // Date of Availability
  DateTime? _selectedDate;

  // Show BottomSheet for Additional Information
  void _showAdditionalInfoBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Additional Information',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 16),
                Text(
                    'Please prepare your resume and portfolio for further review.'),
                ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Close'))
              ],
            ),
          );
        });
  }

  // Show Application Submitted Dialog
  void _showApplicationSubmittedDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Application Submitted'),
            content: Text(
                'Thank you for your application. We will review your submission and contact you soon.'),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context), child: Text('OK'))
            ],
          );
        });
  }

  // Show SnackBar for Form Validation
  void _showValidationSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Please fill in all fields.')));
  }

  // Date Picker for Availability
  Future<void> _selectAvailableDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateAvailableController.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sweetiz Store'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Full Name TextField
            TextField(
              controller: _fullNameController,
              decoration: InputDecoration(
                labelText: 'Your Full Name',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            SizedBox(height: 16),

            // Email TextField
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email Address',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
            ),
            SizedBox(height: 16),

            // Phone TextField
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.phone),
              ),
            ),
            SizedBox(height: 16),

            // Job Position Dropdown
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Choose Your Favorite Job Position',
                border: OutlineInputBorder(),
              ),
              value: _selectedJobPosition,
              items: _jobPositions
                  .map((position) => DropdownMenuItem(
                        value: position,
                        child: Text(position),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedJobPosition = value;
                });
              },
            ),
            SizedBox(height: 16),

            // Experience Level Radio
            Text('Choose', style: TextStyle(fontWeight: FontWeight.bold)),
            Row(
              children: [
                Radio<String>(
                  value: 'Full Time',
                  groupValue: _experienceLevel,
                  onChanged: (value) {
                    setState(() {
                      _experienceLevel = value;
                    });
                  },
                ),
                Text('Full Time'),
                Radio<String>(
                  value: 'Part Time',
                  groupValue: _experienceLevel,
                  onChanged: (value) {
                    setState(() {
                      _experienceLevel = value;
                    });
                  },
                ),
                Text('Part Time'),
              ],
            ),
            SizedBox(height: 16),

            // Date of Availability
            TextField(
              controller: _dateAvailableController,
              decoration: InputDecoration(
                labelText: 'Date When Available',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.calendar_today),
                  onPressed: () => _selectAvailableDate(context),
                ),
              ),
              readOnly: true,
            ),
            SizedBox(height: 16),

            // Button Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Additional Info Button
                ElevatedButton(
                  onPressed: () => _showAdditionalInfoBottomSheet(context),
                  child: Text('Additional Info'),
                ),

                // Submit Application Button
                ElevatedButton(
                  onPressed: () {
                    // Basic form validation
                    if (_fullNameController.text.isEmpty ||
                        _emailController.text.isEmpty ||
                        _phoneController.text.isEmpty ||
                        _selectedJobPosition == null) {
                      _showValidationSnackBar(context);
                    } else {
                      _showApplicationSubmittedDialog(context);
                    }
                  },
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: Text('Submit Application'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: SweetizStoreFormWidget(),
  ));
}