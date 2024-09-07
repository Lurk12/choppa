import 'package:choppa_app/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:choppa_app/screens/dashboard.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isEmailValid = true;
  bool _isEmailEmpty = true;
  bool _isPasswordVisible = false;
  bool _isRememberMeChecked = false;

  void _validateEmail(String input) {
    final RegExp emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    setState(() {
      _isEmailEmpty = input.isEmpty;
      _isEmailValid = _isEmailEmpty || emailRegex.hasMatch(input);
    });
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 255, 253, 1),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 400,
                  color: const Color.fromRGBO(12, 81, 63, 1),
                ),
                Positioned(
                  top: 140,
                  left: 80,
                  child: Image.asset(
                    'assets/images/choppa-logo.png',
                    width: 120,
                  ),
                ),
                const Positioned(
                  top: 170,
                  left: 185,
                  child: Text(
                    'Choppa',
                    style: TextStyle(
                      fontFamily: 'CircularStd',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Login',
                  style: GoogleFonts.nunito(fontSize: 24),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Email address',
                  style: TextStyle(
                    fontFamily: 'CircularStd',
                    fontSize: 16,
                    color: (_isEmailEmpty || _isEmailValid)
                        ? const Color.fromRGBO(1, 24, 18, 0.8)
                        : Colors.red,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: CustomTextField(
                    controller: _emailController,
                    labelText: 'Enter your email address',
                    isValid: _isEmailValid,
                    icon: Icons.email,
                    onChanged: _validateEmail)),
            const SizedBox(
              height: 5,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Password',
                  style: TextStyle(
                    fontFamily: 'CircularStd',
                    fontSize: 16,
                    color: Color.fromRGBO(1, 24, 18, 0.8),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextField(
                obscureText: !_isPasswordVisible,
                controller: _passwordController,
                decoration: InputDecoration(
                    labelText:'Enter password',
                    suffixIcon: GestureDetector(
                      onTap: _togglePasswordVisibility,
                      child: Icon(
                        _isPasswordVisible ? Icons.lock_open : Icons.lock,
                        size: 18,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.never),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Row(
                children: [
                  Checkbox(
                    value: _isRememberMeChecked,
                    activeColor: const Color.fromRGBO(12, 81, 63, 1),
                    onChanged: (newValue) {
                      setState(() {
                        _isRememberMeChecked = newValue!;
                      });
                    },
                  ),
                  const Text('Remember me',
                      style: TextStyle(
                          fontFamily: 'CircularStd',
                          fontSize: 15,
                          color: Color.fromRGBO(51, 51, 51, 0.7))),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                          fontFamily: 'CircularStd',
                          fontSize: 15,
                          color: Color.fromRGBO(51, 51, 51, 0.7)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Dashboard(),
                  ));
                },
                style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 160, vertical: 15),
                    backgroundColor: const Color.fromRGBO(255, 197, 1, 1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16))),
                child: const Text(
                  'Login',
                  style: TextStyle(
                      fontFamily: 'CircularStd',
                      fontSize: 20,
                      color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 13,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account? ",
                  style: TextStyle(
                    fontFamily: 'CircularStd',
                    fontSize: 16,
                  ),
                ),
                GestureDetector(
                  child: const Text(
                    'Create one',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(12, 82, 63, 1)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      // bottomNavigationBar: ,
    );
  }
}
