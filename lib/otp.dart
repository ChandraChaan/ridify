import 'package:flutter/material.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late String otp = ''; // Variable to store OTP

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F1F8),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Page Title'),
        centerTitle: false,
        elevation: 2,
      ),
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: 397,
                  height: 445,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white, // Adjust as per your design
                  ),
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Enter Verification code',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Code was sent to info@gmail.com',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 16),
                      Container(
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
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          // Handle OTP submission logic here
                          if (otp.length == 6) {
                            // Example validation logic
                            showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                title: Text('OTP Verified'),
                                content: Text('You have entered a valid OTP: $otp'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          } else {
                            // Show error message if OTP is not valid
                            showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                title: Text('Invalid OTP'),
                                content: Text('Please enter a valid OTP.'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          }
                        },
                        child: Text('Submit'),
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
