import 'dart:html';

import 'package:flutter/material.dart';
import 'package:practice/homescreen.dart';
import 'package:practice/main.dart';

class ConfirmationScreen extends StatelessWidget {
  final Map data;

  const ConfirmationScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1B0A0A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B0A0A),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Confirmation",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontFamily: 'Gilroy'),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 40),
            const CircleAvatar(
              radius: 40,
              backgroundColor: Colors.green,
              child: Icon(Icons.check, color: Colors.white, size: 40),
            ),
            const SizedBox(height: 20),
            const Text(
              "Booking Confirmed!",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "Your ride is scheduled.",
              style: TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 30),
            _infoCard(data),
            const Spacer(),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFEB1412),
                minimumSize: const Size(double.infinity, 55),
              ),
              child: const Text(
                "View Trip Details",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 12),
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(double.infinity, 55),
                side: const BorderSide(color: Colors.white24),
              ),
              child: const Text("Go To Dashboard",
                  style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoCard(Map data) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF2A1414),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          _row(Icons.location_on, data["pickup"]),
          _row(Icons.flag, data["drop"]),
          _row(
              Icons.access_time, "${data["pickupTime"]} - ${data["dropTime"]}"),
        ],
      ),
    );
  }

  Widget _row(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, color: Colors.red),
          const SizedBox(width: 8),
          Expanded(
            child: Text(text, style: const TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
