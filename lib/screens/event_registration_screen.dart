import 'package:flutter/material.dart';

class EventRegistrationScreen extends StatelessWidget {
  final _nameController = TextEditingController();
  final _batchController = TextEditingController();
  final _departmentController = TextEditingController();
  final _eventCategoryController = TextEditingController();
  final _eventPurposeController = TextEditingController();
  final _eventNameController = TextEditingController();
  final _eventDateController = TextEditingController();
  final _eventVenueController = TextEditingController();

  EventRegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register for Event')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Your Name'),
            ),
            TextField(
              controller: _batchController,
              decoration: InputDecoration(labelText: 'Batch'),
            ),
            TextField(
              controller: _departmentController,
              decoration: InputDecoration(labelText: 'Department'),
            ),
            TextField(
              controller: _eventCategoryController,
              decoration: InputDecoration(labelText: 'Event Category'),
            ),
            TextField(
              controller: _eventPurposeController,
              decoration: InputDecoration(labelText: 'Event Purpose'),
            ),
            TextField(
              controller: _eventNameController,
              decoration: InputDecoration(labelText: 'Event Name'),
            ),
            TextField(
              controller: _eventDateController,
              decoration: InputDecoration(
                labelText: 'Event Date',
                hintText: 'YYYY-MM-DD', // Example date format hint
              ),
            ),
            TextField(
              controller: _eventVenueController,
              decoration: InputDecoration(labelText: 'Event Venue'),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Simulate registration success
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Registration Successful'),
                        content: Text(
                            'You have successfully registered for the event.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text('Submit Registration'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
