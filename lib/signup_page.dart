import 'package:flutter/material.dart';
import 'package:practice/main.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _isChecked = false;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool isValidEmail(String email) {
    final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return regex.hasMatch(email);
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
      backgroundColor: const Color(0xFF2B0F0F),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 40),
            const Text(
              "Create Account",
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Join TrustyWheels for a Safer Commute.",
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color.fromRGBO(171, 162, 163, 1),
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 20),

            /// Apple Button
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 18),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.apple, color: Colors.black),
                  SizedBox(width: 10),
                  Text(
                    "Continue with Apple",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            /// Google Button
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF3B4A5A),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.g_mobiledata, color: Colors.white, size: 30),
                  SizedBox(width: 10),
                  Text(
                    "Continue with Google",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 15),

            /// OR Divider
            Row(
              children: const [
                Expanded(child: Divider(color: Colors.white54)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text("OR", style: TextStyle(color: Colors.white54)),
                ),
                Expanded(child: Divider(color: Colors.white54)),
              ],
            ),

            const SizedBox(height: 15),

            _buildLabel("Full Name"),
            _buildInput("Enter your full name", controller: nameController),

            const SizedBox(height: 15),

            _buildLabel("Email"),

            _buildInput("Enter your email", controller: emailController),

            const SizedBox(height: 15),

            _buildLabel("Password"),
            _buildInput("Enter your password",
                isPassword: true, controller: passwordController),

            const SizedBox(height: 15),

            _buildLabel("Confirm Password"),
            _buildInput("Confirm your password",
                isPassword: true, controller: confirmPasswordController),

            const SizedBox(height: 15),

            /// Checkbox
            Row(
              children: [
                Checkbox(
                  value: _isChecked,
                  onChanged: (value) {
                    setState(() => _isChecked = value ?? false);
                  },
                  activeColor: Colors.red,
                ),
                const Expanded(
                  child: Text(
                    "I agree to the Terms & Conditions and Privacy Policy",
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 60,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  final name = nameController.text.trim();
                  final email = emailController.text.trim();
                  final password = passwordController.text.trim();
                  final confirmPassword = confirmPasswordController.text.trim();

                  if (name.isEmpty) {
                    showCustomSnackBar(
                      "Full name is required",
                      Colors.red,
                      Icons.error_outline,
                    );
                    return;
                  }

                  if (email.isEmpty) {
                    showCustomSnackBar(
                      "Email is required",
                      Colors.red,
                      Icons.email_outlined,
                    );
                    return;
                  }

                  if (!isValidEmail(email)) {
                    showCustomSnackBar(
                      "Please enter a valid email address",
                      Colors.orange,
                      Icons.warning_amber_outlined,
                    );
                    return;
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

                  if (password != confirmPassword) {
                    showCustomSnackBar(
                      "Passwords do not match",
                      Colors.red,
                      Icons.error_outline,
                    );
                    return;
                  }

                  if (!_isChecked) {
                    showCustomSnackBar(
                      "Please accept Terms & Conditions",
                      Colors.orange,
                      Icons.privacy_tip_outlined,
                    );
                    return;
                  }

                  showCustomSnackBar(
                    "Account created successfully",
                    Colors.green,
                    Icons.check_circle_outline,
                  );

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFEB1412),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    )),
                child: const Text("Sign up",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: "gilroylight",
                    )),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account? ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    );
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      color: Color(0xFFEB1412),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Color.fromRGBO(171, 162, 163, 1),
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _buildInput(
    String hint, {
    bool isPassword = false,
    required TextEditingController controller,
  }) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color.fromRGBO(171, 162, 163, 1)),
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Color.fromRGBO(171, 162, 163, 1)),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
