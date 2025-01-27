import 'package:flutter/material.dart';
import 'event_registration_screen.dart'; // Import the Event Registration Screen

class EventDetailsScreen extends StatefulWidget {
  @override
  _EventDetailsScreenState createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
  int _currentIndex = 0; // Track the selected tab index

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_currentIndex == 0 ? 'Event Details' : 'Event Registration'),
      ),
      body: _currentIndex == 0
          ? Center(child: Text('Event details will be shown here'))
          : null, // No need to define the content for the second tab as it navigates to a new screen
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // Highlight the selected tab
        onTap: (index) {
          if (index == 1) {
            // Navigate to the Event Registration Screen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EventRegistrationScreen()),
            );
          } else {
            setState(() {
              _currentIndex = index; // Update the selected tab index
            });
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Event Details',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.app_registration),
            label: 'Event Registration',
          ),
        ],
      ),
    );
  }
}
