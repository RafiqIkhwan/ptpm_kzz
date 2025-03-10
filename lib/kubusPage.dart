import 'package:flutter/material.dart';
import 'main.dart'; // Import the main.dart file to access MainMenu

void main() {
  runApp(const KubusApp());
}

class KubusApp extends StatelessWidget {
  const KubusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const KubusPage(),
    );
  }
}

class KubusPage extends StatefulWidget {
  const KubusPage({super.key});

  @override
  _KubusPageState createState() => _KubusPageState();
}

class _KubusPageState extends State<KubusPage> {
  final TextEditingController _sideController = TextEditingController();
  String _volumeResult = "";
  String _kelilingResult = "";

  void _calculate() {
    setState(() {
      double? side = double.tryParse(_sideController.text);
      if (side != null) {
        double volume = side * side * side;
        double keliling = 12 * side;
        _volumeResult = "Volume: $volume";
        _kelilingResult = "Keliling: $keliling";
      } else {
        _volumeResult = "Input tidak valid.";
        _kelilingResult = "";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hitung Kubus"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _sideController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Masukkan panjang sisi kubus",
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculate,
              child: const Text("Hitung"),
            ),
            const SizedBox(height: 20),
            Text(
              _volumeResult,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              _kelilingResult,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
