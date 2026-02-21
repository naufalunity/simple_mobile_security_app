import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:async';

// Import your PolicyPage
import 'policy_page.dart'; // Make sure policy_page.dart is in the same folder

void main() {
  runApp(const MySecurityApp());
}

class MySecurityApp extends StatelessWidget {
  const MySecurityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SecurityHomePage(),
    );
  }
}

class SecurityHomePage extends StatefulWidget {
  const SecurityHomePage({super.key});

  @override
  _SecurityHomePageState createState() => _SecurityHomePageState();
}

class _SecurityHomePageState extends State<SecurityHomePage> {
  String _rootStatus = "Press Scan to Check Device Status";

  Future<void> _checkRoot() async {
    bool isRooted = await isDeviceRooted();

    setState(() {
      _rootStatus = isRooted
          ? "⚠️ Device is ROOTED (Not Secure)"
          : "✅ Device is SAFE (Not Rooted)";
    });
  }

  Future<bool> isDeviceRooted() async {
    // Check common SU paths
    List<String> paths = [
      "/system/bin/su",
      "/system/xbin/su",
      "/sbin/su",
      "/su/bin/su",
      "/system/su"
    ];

    for (String path in paths) {
      if (File(path).existsSync()) {
        return true;
      }
    }

    // Try executing "su" command
    try {
      ProcessResult result = await Process.run("su", []);
      if (result.exitCode == 0) return true;
    } catch (_) {}

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text("Mobile Security Scanner"),
        actions: [
          IconButton(
            icon: const Icon(Icons.policy),
            tooltip: "View Policies",
            onPressed: () {
              // Navigate to the PolicyPage
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PolicyPage()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _rootStatus,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: _checkRoot,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: const Text(
                "Run Scan",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
