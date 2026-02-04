import 'package:flutter/material.dart';
import 'ConfirmationScreen.dart';

class PaymentConfirmScreen extends StatefulWidget {
  final Map data;

  const PaymentConfirmScreen({super.key, required this.data});

  @override
  State<PaymentConfirmScreen> createState() => _PaymentConfirmScreenState();
}

class _PaymentConfirmScreenState extends State<PaymentConfirmScreen> {
  int selectedMethod = 0;

  @override
  Widget build(BuildContext context) {
    final data = widget.data;

    return Scaffold(
      backgroundColor: const Color(0xFF1B0A0A),
      appBar: AppBar(
        backgroundColor: const Color(0xda1b0a0a),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Payment Confirmation",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontFamily: 'Gilroy'),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _sectionCard(
              title: "Booking Summary",
              child: Column(
                children: [
                  _row("Service Type", "School Ride"),
                  _row("Student", data["name"]),
                  _row("Schedule",
                      "${data["pickupTime"]} - ${data["dropTime"]}"),
                  _row("Pick-up", data["pickup"]),
                  _row("Drop-off", data["drop"]),
                  _row("Plan", _planName(data["plan"])),
                ],
              ),
            ),
            const SizedBox(height: 12),
            _sectionCard(
              title: "Cost Summary",
              child: Column(
                children: [
                  _row("Subscription", "\$${data["price"]}"),
                  _row("Taxes & Fees", "\$12.50"),
                  const Divider(color: Colors.white24),
                  _row(
                    "Total",
                    "\$${data["price"] + 12.5}",
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            _sectionCard(
              title: "Payment Method",
              child: Column(
                children: [
                  _paymentTile(0, "Apple Pay"),
                  _paymentTile(1, "**** **** 4242"),
                  _paymentTile(2, "Paypal"),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ConfirmationScreen(data: data),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFEB1412),
                ),
                child: Text(
                  "Confirm & Pay \$${data["price"]}",
                  style: const TextStyle(
                      fontSize: 18, color: Colors.white, fontFamily: 'Gilroy'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Helpers
  Widget _row(String l, String r) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(l, style: const TextStyle(color: Colors.white70)),
          Text(r, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  Widget _sectionCard({required String title, required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF2A1414),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(color: Colors.white, fontSize: 16)),
          const SizedBox(height: 8),
          child,
        ],
      ),
    );
  }

  Widget _paymentTile(int index, String text) {
    bool selected = selectedMethod == index;

    return ListTile(
      onTap: () => setState(() => selectedMethod = index),
      title: Text(text, style: const TextStyle(color: Colors.white)),
      trailing:
          selected ? const Icon(Icons.check_circle, color: Colors.red) : null,
    );
  }

  String _planName(int index) {
    switch (index) {
      case 0:
        return "Weekly Plan";
      case 1:
        return "Monthly Plan";
      case 2:
        return "Quarterly Plan";
      default:
        return "";
    }
  }
}
