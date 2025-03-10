import 'package:flutter/material.dart';
import 'main.dart'; // Import the main.dart file to access MainMenu

void main() {
  runApp(const TrapesiumApp());
}

class TrapesiumApp extends StatelessWidget {
  const TrapesiumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const TrapesiumPage(),
    );
  }
}

class TrapesiumPage extends StatefulWidget {
  const TrapesiumPage({super.key});

  @override
  _TrapesiumPageState createState() => _TrapesiumPageState();
}

class _TrapesiumPageState extends State<TrapesiumPage> {
  final TextEditingController _base1Controller = TextEditingController();
  final TextEditingController _base2Controller = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _side1Controller = TextEditingController();
  final TextEditingController _side2Controller = TextEditingController();
  String _areaResult = "";
  String _perimeterResult = "";

  void _calculate() {
    setState(() {
      double? base1 = double.tryParse(_base1Controller.text);
      double? base2 = double.tryParse(_base2Controller.text);
      double? height = double.tryParse(_heightController.text);
      double? side1 = double.tryParse(_side1Controller.text);
      double? side2 = double.tryParse(_side2Controller.text);

      if (base1 != null &&
          base2 != null &&
          height != null &&
          side1 != null &&
          side2 != null) {
        double area = 0.5 * (base1 + base2) * height;
        double perimeter = base1 + base2 + side1 + side2;
        _areaResult = "Luas: $area";
        _perimeterResult = "Keliling: $perimeter";
      } else {
        _areaResult = "Input tidak valid.";
        _perimeterResult = "";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hitung Trapesium"),
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
              controller: _base1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Masukkan panjang sisi atas",
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _base2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Masukkan panjang sisi bawah",
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Masukkan tinggi",
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _side1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Masukkan panjang sisi miring 1",
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _side2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Masukkan panjang sisi miring 2",
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculate,
              child: const Text("Hitung"),
            ),
            const SizedBox(height: 20),
            Text(
              _areaResult,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              _perimeterResult,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
