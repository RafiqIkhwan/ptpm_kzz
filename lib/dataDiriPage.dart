import 'package:flutter/material.dart';

class OurTeamPage extends StatelessWidget {
  const OurTeamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color.fromARGB(255, 231, 183, 206), // Warna latar belakang
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "OUR TEAM",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildTeamMember("assets/profile.jpg", "Rafiq Ikhwan Nugraha",
                    "123220071", "IF-B", "Mendaki Gunung"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTeamMember(
      String imagePath, String name, String id, String kelas, String hobby) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(imagePath),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.purple.shade100,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Text(
                  name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(id),
                Text(kelas),
                Text(hobby),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
