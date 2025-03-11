import 'package:flutter/material.dart';
import 'histori.dart';

class Pesanan {
  final String namaMenu;
  final int jumlah;

  Pesanan({required this.namaMenu, required this.jumlah});
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Pesanan> _pesananList = [];

  void _addPesanan(Pesanan pesanan) {
    setState(() {
      _pesananList.add(pesanan);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menu',
      home: MenuScreen(addPesanan: _addPesanan, pesananList: _pesananList),
    );
  }
}

class MenuScreen extends StatelessWidget {
  final Function(Pesanan) addPesanan;
  final List<Pesanan> pesananList;

  const MenuScreen(
      {super.key, required this.addPesanan, required this.pesananList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halo @Rafiiq'),
        actions: [
          IconButton(
            icon: Icon(Icons.history),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Histori(pesananList: pesananList),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 16.0),
            child: Image.network(
              'https://images.unsplash.com/photo-1550935770-d58cbf30c003?q=80&w=1925&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', // Ganti dengan URL gambar Anda
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            'Daftar Menu:',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.all(8.0),
              children: List.generate(menuItems.length, (index) {
                return Card(
                  elevation: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        menuItems[index]['image']!, // Ganti dengan jalur asset
                        height: 100,
                        width: 100,
                      ),
                      Text(
                        menuItems[index]['name']!,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        menuItems[index]['price']!,
                        style: TextStyle(color: Colors.grey),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Navigasi ke halaman Order dengan membawa data menu
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OrderPage(
                                menuItem: menuItems[index],
                                addPesanan: addPesanan,
                              ),
                            ),
                          );
                        },
                        child: Text('Pesan'),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

class OrderPage extends StatefulWidget {
  final Map<String, String> menuItem;
  final Function(Pesanan) addPesanan;

  OrderPage({required this.menuItem, required this.addPesanan});

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int quantity = 1; // Jumlah pesanan, default 1

  @override
  Widget build(BuildContext context) {
    final int price = int.parse(
        widget.menuItem['price']!.replaceAll('Rp ', '').replaceAll(',', ''));

    return Scaffold(
      appBar: AppBar(
        title: Text('Pesanan ${widget.menuItem['name']}'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              widget.menuItem['image']!,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16.0),
            Text(
              widget.menuItem['name']!,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              widget.menuItem['price']!,
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Text(
                  'Jumlah: ',
                  style: TextStyle(fontSize: 18),
                ),
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    if (quantity > 1) {
                      setState(() {
                        quantity--;
                      });
                    }
                  },
                ),
                Text(
                  '$quantity',
                  style: TextStyle(fontSize: 18),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      quantity++;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              'Total Harga: Rp ${price * quantity}',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // Aksi ketika tombol "Pesan" ditekan
                widget.addPesanan(Pesanan(
                  namaMenu: widget.menuItem['name']!,
                  jumlah: quantity,
                ));
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Pesanan Berhasil'),
                      content: Text(
                          'Anda telah memesan ${quantity} ${widget.menuItem['name']} dengan total Rp ${price * quantity}.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pop(context); // Kembali ke halaman utama
                          },
                          child: Text('Tutup'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Pesan Sekarang'),
            ),
          ],
        ),
      ),
    );
  }
}

final List<Map<String, String>> menuItems = [
  {
    'name': 'Nasi Goreng',
    'price': 'Rp 15000',
    'image': 'assets/profile.jpg', // Ganti dengan nama file gambar Anda
  },
  {
    'name': 'Mie Ayam',
    'price': 'Rp 12000',
    'image': 'assets/profile.jpg', // Ganti dengan nama file gambar Anda
  },
  {
    'name': 'Sate Ayam',
    'price': 'Rp 20000',
    'image': 'assets/profile.jpg', // Ganti dengan nama file gambar Anda
  },
  {
    'name': 'Bakso',
    'price': 'Rp 10000',
    'image': 'assets/profile.jpg', // Ganti dengan nama file gambar Anda
  },
  {
    'name': 'Soto Ayam',
    'price': 'Rp 15000',
    'image': 'assets/profile.jpg', // Ganti dengan nama file gambar Anda
  },
  {
    'name': 'Gado-Gado',
    'price': 'Rp 12000',
    'image': 'assets/profile.jpg', // Ganti dengan nama file gambar Anda
  },
];
