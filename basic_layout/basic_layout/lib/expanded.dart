import 'package:flutter/material.dart';

void main() {
  runApp(MyExpandedApp());
}

class MyExpandedApp extends StatelessWidget {
  const MyExpandedApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      home: Scaffold(
        appBar: AppBar(
          title: Text('Row Example'),
        ),
        body: Column(
          children: [
            Row(
              children: const [
                Icon(Icons.arrow_back_ios),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'List Checklist',
                      style: TextStyle(fontSize: 16), 
                    ),
                  ),
                ),
                Icon(
                  Icons.check,
                  color: Colors.blue, // Ikon centang berwarna biru
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}