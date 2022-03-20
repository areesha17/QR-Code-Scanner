import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String qrCode = "Unkmown";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "QR Code Scanner",
          style: TextStyle(
              fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(100),
            child: QrImage(
              data: "1234567890",
              version: QrVersions.auto,
              size: 200.0,
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {
              _qrscanner();
            },
            icon: Icon(
              Icons.scanner_outlined,
              color: Colors.white,
              size: 30,
            ),
            label: Text("Scan your QR code",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
            style: ElevatedButton.styleFrom(
                primary: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
          ),
        ],
      ),
    );
  }

  Future<void> _qrscanner() async {
    try {
      final QrCode = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      if (!mounted) return;
      setState(() {
        this.qrCode;
      });
    } on PlatformException {
      qrCode = "Failed to get platform version";
    }
  }
}