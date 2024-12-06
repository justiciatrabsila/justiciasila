import 'package:flutter/material.dart';

class Staks extends StatelessWidget {
  const Staks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stack with Icons'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding di seluruh area
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Ikon pertama (keranjang belanja)
            Positioned(
              top: 0.0,
              left: 0.0,
              child: Icon(
                Icons.shopping_cart,
                size: 50,
              ),
            ),
            // Ikon kedua (favorite)
            Positioned(
              top: 60.0, // Letakkan sedikit lebih bawah dari ikon pertama
              left: 0.0,
              child: Icon(
                Icons.favorite,
                size: 50,
              ),
            ),
            // Ikon ketiga (notifications)
            Positioned(
              top: 120.0, // Letakkan lebih jauh ke bawah
              left: 0.0,
              child: Icon(
                Icons.notifications,
                size: 50,
              ),
            ),
            // Badge untuk ikon pertama (keranjang belanja)
            Positioned(
              top: -2.0, // Badge lebih dekat ke atas kiri ikon
              left: 38.0, // Badge berada di kanan atas ikon
              child: CircleAvatar(
                radius: 10,
                backgroundColor: Colors.red,
                child: const Text(
                  '3',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            // Badge untuk ikon kedua (favorite)
            Positioned(
              top: 56.0, // Badge lebih dekat ke kanan atas ikon favorite
              left: 38.0, // Menempelkan badge di kanan atas
              child: CircleAvatar(
                radius: 10,
                backgroundColor: Colors.red,
                child: const Text(
                  '1',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            // Badge untuk ikon ketiga (notifications)
            Positioned(
              top: 116.0, // Menempelkan badge lebih dekat ke kanan atas ikon notifications
              left: 38.0, // Menempelkan badge di kanan atas
              child: CircleAvatar(
                radius: 10,
                backgroundColor: Colors.red,
                child: const Text(
                  '5',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}