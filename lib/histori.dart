import 'package:flutter/material.dart';
import 'menu.dart';

class Histori extends StatefulWidget {
  final List<Pesanan> pesananList;

  Histori({required this.pesananList});

  @override
  _HistoriState createState() => _HistoriState();
}

class _HistoriState extends State<Histori> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Histori Pesanan'),
      ),
      body: ListView.builder(
        itemCount: widget.pesananList.length,
        itemBuilder: (context, index) {
          final pesanan = widget.pesananList[index];
          return ListTile(
            title: Text(pesanan.namaMenu),
            subtitle: Text('Jumlah: ${pesanan.jumlah}'),
          );
        },
      ),
    );
  }
}
