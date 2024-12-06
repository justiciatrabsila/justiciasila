import 'package:flutter/material.dart';

void main() => runApp(const Tabbar());

class Tabbar extends StatelessWidget {
  const Tabbar({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const TabBarExample(),
    );
  }
}

class TabBarExample extends StatelessWidget {
  const TabBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Jumlah tab
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TabBar'),
           titleTextStyle: TextStyle(
            color: Colors.purple, // Mengubah warna judul teks
            fontSize: 24,         // Mengubah ukuran font
            fontWeight: FontWeight.bold, // Mengubah gaya font
          ),
          backgroundColor: Color.fromARGB(255, 191, 236, 255), // Warna latar belakang AppBar
          bottom: const TabBar(
            indicatorColor: Color.fromARGB(255, 150, 148, 255), // Warna indikator bawah tab aktif
            labelColor: Color.fromARGB(255, 201, 126, 214), // Warna teks tab yang aktif
            unselectedLabelColor: Colors.white, // Warna teks tab yang tidak aktif
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'Home'),
              Tab(icon: Icon(Icons.search), text: 'Search'),
              Tab(icon: Icon(Icons.person), text: 'Profile'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(
              child: Text(
                'Home Page',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: Text(
                'Search Page',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: Text(
                'Profile Page',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}