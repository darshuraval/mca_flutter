import 'package:flutter/material.dart';

// void main() {
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: SignUpScreen(),
//   ));
// }

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailPhoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  void navigateToOTPPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => OTPVerificationPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3E8876),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white, size: 28),
                onPressed: () {},
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Welcome to ArtHub',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 10),
            Text('Signup to your account', style: TextStyle(color: Colors.white)),
            SizedBox(height: 20),
            buildTextField('First Name', firstNameController),
            buildTextField('Last Name', lastNameController),
            buildTextField('Email ID/Phone Number', emailPhoneController),
            buildTextField('Password', passwordController, isPassword: true),
            buildTextField('Re-enter Password', confirmPasswordController, isPassword: true),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Color(0xFF3E8876),
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 80),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              onPressed: navigateToOTPPage,
              child: Text('Create', style: TextStyle(fontSize: 18)),
            ),
            SizedBox(height: 20),
            Text('Have an account? ', style: TextStyle(color: Colors.white)),
            GestureDetector(
              onTap: () {},
              child: Text('Sign in',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            )
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String hint, TextEditingController controller, {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: Colors.white),
          filled: true,
          fillColor: Colors.transparent,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.white, width: 2),
          ),
        ),
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class OTPVerificationPage extends StatelessWidget {
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3E8876),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Verify OTP',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 10),
              Text('Enter the OTP sent to your phone', style: TextStyle(color: Colors.white)),
              SizedBox(height: 20),
              TextField(
                controller: otpController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Enter OTP',
                  hintStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.transparent,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.white, width: 2),
                  ),
                ),
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Color(0xFF3E8876),
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 80),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                onPressed: () {},
                child: Text('Verify', style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}