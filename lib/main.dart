import 'package:flutter/material.dart';
import 'dataDiriPage.dart';
import 'hitungHariPage.dart';
import 'trapesiumPage.dart';
import 'kubusPage.dart';
import 'loginPage.dart';
import 'menu.dart';
import 'histori.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(), // Aplikasi dimulai dari halaman login
    );
  }
}

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  final List<Pesanan> _pesananList = [];

  void _addPesanan(Pesanan pesanan) {
    setState(() {
      _pesananList.add(pesanan);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(49, 97, 83, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(5, 131, 5, 1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                "Menu Utama",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: [
                _buildMenuItem(Icons.group, "DATA DIRI", () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OurTeamPage()),
                  );
                }),
                _buildMenuItem(Icons.cable, "KUBUS", () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const KubusPage()),
                  );
                }),
                _buildMenuItem(Icons.calculate, "TRAPESIUM", () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TrapesiumPage()),
                  );
                }),
                _buildMenuItem(Icons.calendar_today, "HITUNG HARI", () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HitungHariPage()),
                  );
                }),
                _buildMenuItem(Icons.calendar_today, "MENU", () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MenuScreen(
                        addPesanan: _addPesanan,
                        pesananList: _pesananList,
                      ),
                    ),
                  );
                }),
                _buildMenuItem(Icons.calendar_today, "HISTORI", () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Histori(pesananList: _pesananList),
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 60, color: Colors.white),
          const SizedBox(height: 10),
          Text(
            label,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
