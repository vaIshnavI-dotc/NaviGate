import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRScanScreen extends StatefulWidget {
  const QRScanScreen({super.key});

  @override
  State<QRScanScreen> createState() => _QRScanScreenState();
}

class _QRScanScreenState extends State<QRScanScreen> {
  bool _handled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan QR Code'),
      ),
      body: MobileScanner(
        onDetect: (BarcodeCapture capture) {
          if (_handled) return;

          final List<Barcode> barcodes = capture.barcodes;
          if (barcodes.isEmpty) return;

          final String? code = barcodes.first.rawValue;
          if (code == null || code.isEmpty) return;

          _handled = true;

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Scanned: $code')),
          );

          Navigator.pop(context, code);
        },
      ),
    );
  }
}