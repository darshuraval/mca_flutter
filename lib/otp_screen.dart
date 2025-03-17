import 'package:flutter/material.dart';

class OTPScreen extends StatefulWidget {
  final String phoneNumber;

  OTPScreen({required this.phoneNumber});

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final TextEditingController otpController = TextEditingController();
  bool isLoading = false;

  void verifyOTP() async {
    setState(() {
      isLoading = true;
    });

    String enteredOTP = otpController.text.trim();
    
    // Replace with actual OTP validation logic (backend call)
    bool isOTPValid = await fakeOTPVerification(enteredOTP);

    setState(() {
      isLoading = false;
    });

    if (isOTPValid) {
      // Navigate to the success screen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => OTPVerificationSuccessScreen()),
      );
    } else {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Invalid OTP! Please try again."))
      );
    }
  }

  Future<bool> fakeOTPVerification(String otp) async {
    await Future.delayed(Duration(seconds: 2)); // Simulate network delay
    return otp == "622222"; // Replace with backend validation
  }

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
                'Verify your phone number',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 10),
              Text(
                'We have sent an SMS to ${widget.phoneNumber}',
                style: TextStyle(fontSize: 16, color: Colors.white70),
              ),
              SizedBox(height: 30),
              TextField(
                controller: otpController,
                maxLength: 6,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'Enter OTP',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                ),
              ),
              SizedBox(height: 20),
              isLoading
                  ? CircularProgressIndicator(color: Colors.white)
                  : ElevatedButton(
                      onPressed: verifyOTP,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      ),
                      child: Text("Verify", style: TextStyle(color: Color(0xFF3E8876), fontSize: 18)),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

// OTP Success Page
class OTPVerificationSuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3E8876),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle, color: Colors.white, size: 100),
            SizedBox(height: 20),
            Text(
              "OTP Verified Successfully!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Navigate to the home screen or dashboard
                Navigator.pushReplacementNamed(context, "/home");
              },
              child: Text("Continue"),
            ),
          ],
        ),
      ),
    );
  }
}
