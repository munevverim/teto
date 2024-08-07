import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/event_creation_screen.dart';
import 'package:flutter_application_2/screens/event_date_location_screen.dart';
import 'package:flutter_application_2/screens/event_detail_screen.dart';
import 'package:flutter_application_2/screens/home_page.dart';
import 'package:flutter_application_2/screens/home_screen1.dart';
import 'package:flutter_application_2/screens/login_screen.dart';
import 'package:flutter_application_2/screens/messages_screen.dart';
import 'package:flutter_application_2/screens/password_reset_screen.dart';
import 'package:flutter_application_2/screens/profile_photo_screen.dart';
import 'package:flutter_application_2/screens/profile_screen.dart';
import 'package:flutter_application_2/screens/register_screen.dart';
import 'package:flutter_application_2/screens/terms_privacy_screen.dart';
import 'package:flutter_application_2/screens/verification_screen.dart';
import 'package:flutter_application_2/screens/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tetto',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) =>EventDateLocationScreen (),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/password-reset': (context) => PasswordResetScreen(),
        '/verification': (context) => VerificationScreen(),
        '/home': (context) => HomePage(),
        '/profile-photo': (context) => ProfilePhotoScreen(),
        '/profile': (context) => ProfileScreen(),
        '/terms-privacy': (context) => TermsPrivacyScreen(),
        '/home-screen1': (context) => HomeScreen(),
      },
    );
  }
}
