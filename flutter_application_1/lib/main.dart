import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MenuItem {
  final String nama;
  final String deskripsi;
  final int harga;
  final String gambarUrl;
  final double rating;

  MenuItem({required this.nama, required this.deskripsi, required this.harga, required this.gambarUrl, required this.rating});
}

List<MenuItem> menuItems = [
  MenuItem(nama: 'Chocolate Chip Cookies', deskripsi: 'A soft cookie that features chocolate chips as its ingredient.', harga: 15000, gambarUrl: 'https://i.pinimg.com/564x/2d/c7/58/2dc7586eb9d1f3825da391c459e5a59a.jpg', rating: 4.5),
  MenuItem(nama: 'Red Velvet Cookies', deskripsi: 'A soft cookie that has red velvet cake flavor', harga: 15000, gambarUrl: 'https://i.pinimg.com/564x/c8/65/e0/c865e00e921599ae1c136f980a9af7b5.jpg', rating: 4.0),
  MenuItem(nama: 'Matcha Cookies', deskripsi: 'A combination of matcha powder and cookie dough that has a sweet and sour flavor', harga: 20000, gambarUrl: 'https://i.pinimg.com/564x/30/f9/b4/30f9b472146a1f12366d7a3f55dd733c.jpg', rating: 4.8),
  MenuItem(nama: 'Blackberry Cookies', deskripsi: 'Blackberry jam that combine with cookie dough has a blue color and umami flavor', harga: 20000, gambarUrl: 'https://i.pinimg.com/564x/31/79/14/317914d4293686d688d9e5a5e215f205.jpg', rating: 4.7),
  MenuItem(nama: 'Dark Chocolate Cookies', deskripsi: 'Dark chocolate ingredient give the sweet cookie dough a bitter flavor', harga: 18000, gambarUrl: 'https://i.pinimg.com/564x/ec/96/e1/ec96e18b66f28be00e3a89860d920b24.jpg', rating: 4.9),
  MenuItem(nama: 'Cranberry Oat Cookies', deskripsi: 'Cookie dough mixed with oats and has cranberry as its topping', harga: 20000, gambarUrl: 'https://i.pinimg.com/564x/f7/3b/a1/f73ba12e5d3e5acf8e9835485233cdc6.jpg', rating: 4.8),
  MenuItem(nama: 'Ube Crinkle Cookies', deskripsi: 'A soft cookie that has legt flavor and purple color from sweet potatos', harga: 18000, gambarUrl: 'https://i.pinimg.com/564x/1c/20/77/1c20774ded39b20e32a43d4b3fddf272.jpg', rating: 4.7),
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daftar Menu',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const DaftarMenuPage(),
    );
  }
}

class DaftarMenuPage extends StatelessWidget {
  const DaftarMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('The Cookiez', style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 228, 127, 253),
      ),
      body: ListView.builder(
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          MenuItem item = menuItems[index];
          return Card(
            margin: const EdgeInsets.all(16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0)
            ),
            color: const Color.fromARGB(255, 250, 220, 255),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Image.network(item.gambarUrl, fit: BoxFit.cover),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item.nama, style: const TextStyle(fontSize: 18.0, fontFamily: 'Poppins', fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4.0),
                        Text(item.deskripsi, style: const TextStyle(fontSize: 12.0, fontFamily: 'Poppins')),
                        const SizedBox(height: 4.0),
                        Row(
                        // Add the RatingBar widget here
                          children: [
                          RatingBarIndicator(
                            rating: item.rating,
                            itemCount: 5,
                            itemSize: 20.0,
                            itemBuilder: (context, index) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                          ),
                            const SizedBox(width: 4.0),
                            Text(
                              item.rating.toStringAsFixed(1),
                              style: const TextStyle(fontSize: 12.0),
                            ),
                          ],
                        ),
                        Text('Rp ${item.harga}', style: const TextStyle(fontSize: 14.0)),
                      ],
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
