import 'package:flutter/material.dart';

import '../../../bottom_nav_bar/presentation/pages/bottom_nav_bar.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LogInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;
  bool isShowobscureText = false;
  String? _emailError;
  String? _passwordError;

  void _handleLogin() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const BottomNavBarScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   title: const Text('Sign In'),
      //   centerTitle: true,
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 100),
              const Icon(Icons.medical_information,
                  color: Colors.indigoAccent, size: 20),
              const Text('Adhicine',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.indigoAccent,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 90),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text('Sign In',
                    style:
                        TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                const SizedBox(height: 30),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.radar, color: Colors.green, size: 25),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                        child: TextField(
                      controller: _emailController,
                      onChanged: (value) {
                        setState(() {
                          _onValidateEmail(emailText: value);
                        });
                      },
                      decoration: InputDecoration(
                          hintText: '   Enter your Email',
                          error: _emailError == null
                              ? null
                              : Text(_emailError!,
                                  style: const TextStyle(color: Colors.red)),
                          errorStyle: const TextStyle(color: Colors.red)),
                    )),
                  ],
                ),

                // Password Field
                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.lock,
                        color:
                            _passwordError == null ? Colors.green : Colors.red,
                        size: 25),
                    const SizedBox(width: 15),
                    Expanded(
                        child: TextField(
                      controller: _passwordController,
                      onChanged: (value) {
                        setState(() {
                          _onValidatePassword(passwordText: value);
                        });
                      },
                      obscureText: isShowobscureText,
                      decoration: InputDecoration(
                          hintText: '   Enter your password',
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isShowobscureText = !isShowobscureText;
                              });
                            },
                            icon: Icon(
                                isShowobscureText
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: _passwordError == null
                                    ? Colors.grey
                                    : Colors.red,
                                size: 25),
                          ),
                          error: _passwordError == null
                              ? null
                              : Text(_passwordError!,
                                  style: const TextStyle(color: Colors.red)),
                          errorStyle: const TextStyle(color: Colors.red)),
                    )),
                  ],
                ),
              ]),
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('forgot password?',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.indigoAccent)),
                ],
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: isLoading ? null : _handleLogin,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                      vertical: 11,
                      horizontal: MediaQuery.of(context).size.width * 0.37),
                  backgroundColor: Colors.indigoAccent,
                ), // Disable if loading
                child: isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text('Sign In',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white)),
              ),

              // Line Separator with OR
              const SizedBox(height: 20),
              const Row(
                children: [
                  Expanded(child: Divider(thickness: 1)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text('OR'),
                  ),
                  Expanded(child: Divider(thickness: 1)),
                ],
              ),

              // Continue with Google button
              const SizedBox(height: 20),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.85,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(42),
                    border: Border.all(color: Colors.grey, width: 1.5)),
                child: const Row(
                  children: [
                    SizedBox(width: 50),
                    Icon(Icons.login),
                    SizedBox(width: 20),
                    Text('Continue with Google',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Colors.black)),
                  ],
                ),
              ),

              // Sign up option
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'New to Adhicine?',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigate to sign-up screen
                    },
                    child: const Text(
                      'Sign up',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),

              // Login Button
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  void _onValidateEmail({String emailText = ''}) {
    if (emailText!.isEmpty) {
      _emailError = 'Email is required';
    }
    if (!RegExp(r'^[a-zA-Z0-9._%+-]+@gmail\.com$').hasMatch(emailText!)) {
      _emailError = 'Please enter a valid Gmail address';
    } else {
      _emailError = null;
    }
  }

  void _onValidatePassword({String passwordText = ''}) {
    if (passwordText.isEmpty) {
      _passwordError = 'Password is required';
    } else if (passwordText.length < 6) {
      _passwordError = 'Password must be at least 6 characters';
    } else if (!RegExp(r'^(?=.*[A-Z])').hasMatch(passwordText)) {
      // Check for at least one uppercase letter
      _passwordError = 'Password must contain at least one uppercase letter';
    } else if (!RegExp(r'^(?=.*\d)').hasMatch(passwordText)) {
      // Check for at least one digit
      _passwordError = 'Password must contain at least one digit';
    } else {
      _passwordError = null; // No error, password is valid
    }
  }
}
