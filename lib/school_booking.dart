import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'Paymentscreen.dart';

class SchoolRideBookingScreen extends StatefulWidget {
  const SchoolRideBookingScreen({super.key});

  @override
  State<SchoolRideBookingScreen> createState() =>
      _SchoolRideBookingScreenState();
}

class _SchoolRideBookingScreenState extends State<SchoolRideBookingScreen> {
  bool singleTrip = true;

  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final gradeController = TextEditingController();
  final schoolController = TextEditingController();
  final pickupController = TextEditingController();
  final pickupTimeController = TextEditingController();
  final dropController = TextEditingController();
  final dropTimeController = TextEditingController();

  int selectedPlanIndex = -1;
  int selectedPlanPrice = 0;
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
          "School Pick-up/Drop-off",
          style: TextStyle(
              color: Colors.white, fontSize: 14, fontFamily: 'Gilroy'),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              const Text(
                "Book a Ride for\nSchool",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontFamily: 'Gilroy',
                  //fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 16),

              /// Trip Type Toggle
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: const Color(0xd6321f1f),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    _tripTypeButton("Single Trip", singleTrip, () {
                      setState(() => singleTrip = true);
                    }),
                    _tripTypeButton("Round Trip", !singleTrip, () {
                      setState(() => singleTrip = false);
                    }),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              /// Student Details
              _expandableSection(
                title: "Student Details",
                icon: Icons.school_outlined,
                child: Column(
                  children: [
                    _inputField(
                      "Student’s Full Name",
                      example: "Raheel",
                      controller: nameController,
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: _inputField(
                            "Grade",
                            example: "5th",
                            controller: gradeController,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _inputField(
                            "School Name",
                            example: "City School",
                            controller: schoolController,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    _dashedButton(
                      "+ Add Student",
                      () {
                        print("Tapped");
                      },
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),

              /// Trip Details
              _expandableSection(
                title: "Trip Details",
                icon: Icons.car_rental_outlined,
                child: Column(
                  children: [
                    _inputField(
                      "Pickup Location",
                      example: "Home",
                      controller: pickupController,
                    ),
                    const SizedBox(height: 12),
                    _inputField(
                      "Pickup Time",
                      example: "8:00 AM",
                      controller: pickupTimeController,
                    ),
                    const SizedBox(height: 12),
                    _inputField(
                      "Drop-off Location",
                      example: "School",
                      controller: dropController,
                    ),
                    const SizedBox(height: 12),
                    _inputField(
                      "Drop-off Time",
                      example: "8:00 AM",
                      controller: dropTimeController,
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),

              /// Subscription Plan
              _expandableSection(
                title: "Subscription Plan",
                icon: Icons.card_membership,
                child: Column(
                  children: [
                    _planCard(
                        0, "Weekly Plan", "\$120", "Best for short term", 120),
                    _planCard(
                        1, "Monthly Plan", "\$450", "Most popular plan", 450),
                    _planCard(
                        2, "Quarterly Plan", "\$1200", "Best value", 1200),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              /// Total
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Amount",
                    style: TextStyle(color: Colors.white70),
                  ),
                  Text(
                    "\$$selectedPlanPrice",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              /// Confirm Button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) return;

                    if (selectedPlanIndex == -1) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Select a plan")),
                      );
                      return;
                    }

                    final bookingData = {
                      "name": nameController.text,
                      "grade": gradeController.text,
                      "school": schoolController.text,
                      "pickup": pickupController.text,
                      "pickupTime": pickupTimeController.text,
                      "drop": dropController.text,
                      "dropTime": dropTimeController.text,
                      "plan": selectedPlanIndex,
                      "price": selectedPlanPrice,
                    };

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PaymentConfirmScreen(data: bookingData),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFEB1412),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                  child: const Text(
                    "Proceed To Payment",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Widgets Below
  ///
  ///
  ///
  ///

  Widget _planCard(
      int index, String title, String price, String desc, int amount) {
    bool selected = selectedPlanIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPlanIndex = index;
          selectedPlanPrice = amount;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: selected ? Colors.red.withOpacity(.15) : Color(0xFF1E0D0D),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: selected ? Colors.red : Colors.transparent),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: const TextStyle(color: Colors.white)),
                Text(price, style: const TextStyle(color: Colors.white70)),
              ],
            ),
            const SizedBox(height: 6),
            Text(desc,
                style: const TextStyle(color: Colors.white54, fontSize: 13)),
            const SizedBox(height: 8),
            _feature("Daily pickup & drop"),
            _feature("Driver tracking"),
            _feature("Priority support"),
          ],
        ),
      ),
    );
  }

  Widget _feature(String text) {
    return Row(
      children: [
        const Icon(Icons.check_circle, color: Colors.green, size: 18),
        const SizedBox(width: 6),
        Text(text, style: const TextStyle(color: Colors.white60)),
      ],
    );
  }

  Widget _dotInputField(String label, {String? example}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 26, right: 8),
          child: _glowDot(),
        ),
        Expanded(
          child: _inputField(label, example: example),
        ),
      ],
    );
  }

  Widget _glowDot() {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.red.withOpacity(0.8),
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
    );
  }

  Widget _tripTypeButton(String text, bool active, VoidCallback onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: active ? Colors.black : Colors.transparent,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: active ? Colors.white : Colors.white54,
            ),
          ),
        ),
      ),
    );
  }

  Widget _labeledInput(String label, String example,
      {bool isPassword = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Label above field
        Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 6),

        /// Input field with example
        TextField(
          obscureText: isPassword,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: "e.g $example",
            hintStyle: const TextStyle(color: Colors.white38),
            filled: true,
            fillColor: const Color(0xFF2A1414),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.white24),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.white24),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red),
            ),
          ),
        ),
      ],
    );
  }

  Widget _expandableSection({
    required String title,
    required Widget child,
    required IconData icon,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF2A1414),
        borderRadius: BorderRadius.circular(14),
      ),
      child: ExpansionTile(
        tilePadding: EdgeInsets.zero,
        collapsedIconColor: Colors.white70,
        iconColor: Colors.white,
        title: Row(
          children: [
            Icon(
              icon,
              color: Colors.red,
              size: 20,
            ),
            const SizedBox(width: 10),
            Text(
              title,
              style: const TextStyle(
                fontFamily: 'Gilroy',
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        children: [
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }

  Widget _inputField(
    String label, {
    String? example,
    TextEditingController? controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(color: Colors.white70, fontSize: 14)),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.white24),
          ),
          child: TextFormField(
            controller: controller,
            style: const TextStyle(color: Colors.white),
            validator: (value) =>
                value == null || value.isEmpty ? "Required field" : null,
            decoration: InputDecoration(
              hintText: example != null ? "e.g $example" : null,
              hintStyle: const TextStyle(color: Colors.white38),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }

  Widget _dashedButton(String text, VoidCallback onTap) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: DottedBorder(
        color: Color(0xffbb2f25),
        strokeWidth: 1.5,
        dashPattern: const [6, 4],
        borderType: BorderType.RRect,
        radius: const Radius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          width: double.infinity,
          alignment: Alignment.center,
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.red,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
