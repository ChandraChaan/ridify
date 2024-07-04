import 'package:flutter/material.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _contactNumberController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _contactNumberFocus = FocusNode();
  final FocusNode _confirmPasswordFocus = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _contactNumberController.dispose();
    _confirmPasswordController.dispose();

    _emailFocus.dispose();
    _passwordFocus.dispose();
    _contactNumberFocus.dispose();
    _confirmPasswordFocus.dispose();

    super.dispose();
  }

  void _login() {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    String contactNumber = _contactNumberController.text.trim();
    String confirmPassword = _confirmPasswordController.text.trim();

    // Example validation
    if (email.isEmpty || password.isEmpty || contactNumber.isEmpty || confirmPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }

    // Validate email format
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid email')),
      );
      return;
    }

    // Validate password length or complexity
    if (password.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password should be at least 6 characters')),
      );
      return;
    }

    // Validate contact number format
    if (!RegExp(r'^[0-9]{10}$').hasMatch(contactNumber)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid 10-digit contact number')),
      );
      return;
    }

    // Validate password confirmation
    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Passwords do not match')),
      );
      return;
    }

    // Example: Navigate to home screen on successful login
    Navigator.of(context).pushReplacementNamed('/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              focusNode: _emailFocus,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(_passwordFocus),
            ),
            const SizedBox(height: 20),

            TextFormField(
              controller: _contactNumberController,
              focusNode: _contactNumberFocus,
              decoration: const InputDecoration(
                labelText: 'Contact Number',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(_confirmPasswordFocus),
            ),
            const SizedBox(height: 20),

            TextFormField(
              controller: _passwordController,
              focusNode: _passwordFocus,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(_contactNumberFocus),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _confirmPasswordController,
              focusNode: _confirmPasswordFocus,
              decoration: const InputDecoration(
                labelText: 'Confirm Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (_) => _login(),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _login,
                child: const Text('Login'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


