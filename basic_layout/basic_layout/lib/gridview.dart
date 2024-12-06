import 'package:flutter/material.dart';

void main() {
  runApp(MyGridViewApp());
}

class MyGridViewApp extends StatelessWidget {
  const MyGridViewApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("GridView Example")),
        body: Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 185.0 / 243.0,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            children: List.generate(
              6,
              (index) => Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      offset: Offset.zero,
                      blurRadius: 15.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}