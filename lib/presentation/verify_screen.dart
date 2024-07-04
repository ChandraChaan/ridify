import 'package:flutter/material.dart';
import 'package:rydify/presentation/profile_screen.dart';

class VerifyScreen extends StatefulWidget {
  final String email;

  const VerifyScreen({super.key, required this.email});

  @override
  _VerifyScreenState createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  late String otp = ''; // Variable to store OTP

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F1F8),
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: 397,
                  height: 445,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white, // Adjust as per your design
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        'Enter Verification code',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Code was sent to ${widget.email}',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: 250, // Adjust as per your design
                        child: TextField(
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          maxLength: 6,
                          onChanged: (value) {
                            setState(() {
                              otp = value;
                            });
                          },
                          decoration: InputDecoration(
                            hintText: 'Enter OTP',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          // Handle OTP submission logic here
                          if (otp.length == 6) {
                            // Example validation logic
                            // showDialog(
                            //   context: context,
                            //   builder: (_) => AlertDialog(
                            //     title: const Text('OTP Verified'),
                            //     content: Text('You have entered a valid OTP: $otp'),
                            //     actions: <Widget>[
                            //       TextButton(
                            //         onPressed: () {
                            //           Navigator.of(context).pop();
                            //         },
                            //         child: const Text('OK'),
                            //       ),
                            //     ],
                            //   ),
                            // );
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const ProfileScreen()));
                          } else {
                            // Show error message if OTP is not valid
                            showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                title: const Text('Invalid OTP'),
                                content:
                                    const Text('Please enter a valid OTP.'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          }
                        },
                        child: const Text('Submit'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
