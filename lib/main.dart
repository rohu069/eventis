import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/sign_in_screen.dart';
import 'screens/event_details_screen.dart';
import 'screens/event_registration_screen.dart';
import 'screens/add_event_screen.dart';
import 'screens/admin_dashboard_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'College Event Management',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/', // The initial screen route
      routes: {
        '/': (context) => //LoginScreen(), 
        EventDetailsScreen(),  // Login Screen
        '/sign_in': (context) => SignInScreen(), // Sign In Screen
        '/event_details': (context) => //EventDetailsScreen(), 
        LoginScreen(), // Home Screen after login
        '/event_registration': (context) => EventRegistrationScreen(), // Event Registration Screen
        '/add_event': (context) => AddEventScreen(), // Add Event Screen for Admin
        '/admin_dashboard': (context) => AdminDashboardScreen(), // Admin Dashboard Screen
      },
    );
  }
}
