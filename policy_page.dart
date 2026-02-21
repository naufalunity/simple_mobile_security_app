import 'package:flutter/material.dart';

class PolicyPage extends StatelessWidget {
  const PolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Policies")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "User Policy",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "This app provides basic device security information. "
                "It does not collect, store, or share personal data. "
                "Use this app only on devices you own or have permission to analyze.",
              ),
              SizedBox(height: 25),

              Text(
                "Developer Policy",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "Developers must ensure responsible use of the app. "
                "Do not modify this app to perform unauthorized surveillance, "
                "data collection, or device tampering. "
                "Any improvements must maintain transparency and user consent.",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
