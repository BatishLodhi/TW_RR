import 'package:flutter/material.dart';
import 'signup_page.dart';
import 'homescreen.dart';
import 'school_booking.dart';
import 'Paymentscreen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isValidEmail(String email) {
    final emailRegex = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    );
    return emailRegex.hasMatch(email);
  }

  bool isUsernameValid(String username) {
    return username.length >= 3;
  }

  void showCustomSnackBar(String message, Color color, IconData icon) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: color,
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        content: Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF241011),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "TrustyWheels",
                  style: TextStyle(
                    fontSize: 38,
                    color: Colors.white,
                    fontFamily: "gilroy",
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "your trusted ride, every time",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: "gilroylight",
                  ),
                ),
                const SizedBox(height: 30),
                Align(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Email/Username",
                    style: TextStyle(
                      color: Color(0xffb0adad),
                      fontSize: 18,
                      fontFamily: "gilroylight",
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                TextField(
                  controller: emailController,
                  style: const TextStyle(
                    color: Colors.white, // 👈 typed text color
                    fontSize: 16,
                  ),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.transparent,
                    hintText: "Enter your email or username",
                    hintStyle: const TextStyle(
                      color: Colors.white54, // 👈 hint text color
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.white54),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Align(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Password",
                    style: TextStyle(
                      color: Color(0xffb0adad),
                      fontSize: 18,
                      fontFamily: "gilroylight",
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  style: const TextStyle(
                    color: Colors.white, // 👈 typed text color
                    fontSize: 16,
                  ),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.transparent,
                    hintText: "Enter your password",
                    hintStyle: const TextStyle(
                      color: Colors.white54, // 👈 hint text color
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.white54),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      final input = emailController.text.trim();
                      final password = passwordController.text.trim();

                      if (input.isEmpty) {
                        showCustomSnackBar(
                          "Email or username is required",
                          Colors.red,
                          Icons.error_outline,
                        );
                        return;
                      }

                      // 🔹 If user typed @ → validate as email
                      if (input.contains('@')) {
                        if (!isValidEmail(input)) {
                          showCustomSnackBar(
                            "Please enter a valid email address",
                            Colors.orange,
                            Icons.warning_amber_outlined,
                          );
                          return;
                        }
                      }
                      // 🔹 Otherwise treat as username
                      else {
                        if (!isUsernameValid(input)) {
                          showCustomSnackBar(
                            "Username must be at least 3 characters",
                            Colors.orange,
                            Icons.warning_amber_outlined,
                          );
                          return;
                        }
                      }

                      if (password.isEmpty) {
                        showCustomSnackBar(
                          "Password cannot be empty",
                          Colors.red,
                          Icons.lock_outline,
                        );
                        return;
                      }

                      if (password.length < 6) {
                        showCustomSnackBar(
                          "Password must be at least 6 characters",
                          Colors.orange,
                          Icons.warning_amber_outlined,
                        );
                        return;
                      }

                      // ✅ Success
                      showCustomSnackBar(
                        "Login successful",
                        Colors.green,
                        Icons.check_circle_outline,
                      );

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFEB1412),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        )),
                    child: const Text("Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: "gilroylight",
                        )),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                        child: Divider(
                      color: Colors.grey,
                    )),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "OR",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        )),
                    Expanded(
                        child: Divider(
                      color: Colors.grey,
                    )),
                  ],
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.apple,
                      size: 24,
                      color: Colors.black,
                    ),
                    label: const Text(
                      'Continue with Apple',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black,
                        fontFamily: "Gilroylight",
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffffffff),
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.g_mobiledata,
                      size: 24,
                      color: Colors.white,
                    ),
                    label: const Text(
                      'Continue with Google',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: "Gilroylight",
                        fontSize: 18,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(50, 65, 84, 1),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(
                          color: Colors.white, // border color
                          width: 2, // border thickness
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don’t have an account? ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignupScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "Sign up",
                        style: TextStyle(
                          color: Color(0xFFEB1412),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
