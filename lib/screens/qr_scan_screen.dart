import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'voice_input_screen.dart';

class QRScanScreen extends StatelessWidget {
  const QRScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scan QR Code"),
      ),
      body: MobileScanner(
        onDetect: (barcode, args) {
  final String? code = barcode.rawValue;

  if (code != null) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VoiceInputScreen(location: code),
      ),
    );
  }
}
      ),
    );
  }
}