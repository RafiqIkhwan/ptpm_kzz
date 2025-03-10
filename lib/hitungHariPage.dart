import 'package:flutter/material.dart';

class HitungHariPage extends StatefulWidget {
  const HitungHariPage({super.key});

  @override
  _HitungHariPageState createState() => _HitungHariPageState();
}

class _HitungHariPageState extends State<HitungHariPage> {
  TextEditingController inputController = TextEditingController();
  String result = "";

  void calculateResult() {
    setState(() {
      int? dayNumber = int.tryParse(inputController.text);
      if (dayNumber != null && dayNumber >= 1 && dayNumber <= 7) {
        switch (dayNumber) {
          case 1:
            result = "Senin";
            break;
          case 2:
            result = "Selasa";
            break;
          case 3:
            result = "Rabu";
            break;
          case 4:
            result = "Kamis";
            break;
          case 5:
            result = "Jumat";
            break;
          case 6:
            result = "Sabtu";
            break;
          case 7:
            result = "Minggu";
            break;
        }
      } else {
        result = "Input tidak valid. Masukkan angka antara 1 dan 7.";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hitung Hari"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: inputController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Masukkan angka (1-7)",
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateResult,
              child: const Text("Hitung"),
            ),
            const SizedBox(height: 20),
            Text(
              result,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
