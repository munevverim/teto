import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    clientId: 'YOUR_CLIENT_ID',
    scopes: [
      'email',
      'profile',
    ],
  );

  Future<void> _handleSignIn() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        // Do something with the signed-in user
        print("User signed in: ${googleUser.displayName}");
      }
    } catch (error) {
      print("Error signing in with Google: $error");
    }
  }

  Future<void> _handleSignOut() async {
    await _googleSignIn.signOut();
  }

  Future<void> _handleAppleSignIn() async {
    try {
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );
      // Do something with the signed-in user
      print("User signed in: ${credential.userIdentifier}");
    } catch (error) {
      print("Error signing in with Apple: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Tetto',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                foreground: Paint()..shader = LinearGradient(
                  colors: <Color>[Color(0xff00C6FF), Color(0xff0072FF)],
                ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Şifre',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
                suffixIcon: Icon(Icons.visibility_off),
              ),
              obscureText: true,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Switch(value: false, onChanged: (bool value) {}),
                    Text('Beni Hatırla'),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('Şifremi Unuttum'),
                ),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff0072FF),
                padding: EdgeInsets.symmetric(vertical: 16),
                textStyle: TextStyle(fontSize: 18),
              ),
              child: Text('GİRİŞ YAP'),
            ),
            SizedBox(height: 16),
            Row(
              children: <Widget>[
                Expanded(child: Divider()),
                Text(" ya da "),
                Expanded(child: Divider()),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Image.asset('assets/google.png'),
                  iconSize: 50,
                  onPressed: _handleSignIn,
                ),
                SizedBox(width: 16),
                IconButton(
                  icon: Image.asset('assets/apple.png'),
                  iconSize: 50,
                  onPressed: _handleAppleSignIn,
                ),
              ],
            ),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Hesabın yok mu?'),
                TextButton(
                  onPressed: () {},
                  child: Text('Üye Ol'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
