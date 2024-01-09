import 'package:flutter/material.dart';
import './components/selection.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Literary Exploration Hub', style: TextStyle(fontSize: 16.0)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Image at the top
          Container(
            padding: EdgeInsets.all(16.0),
            child: Image.asset(
              'assets/images/24005138_6897191.jpg', // Replace with your image URL
              height: 100.0, // Set the desired height
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          // Selection at the bottom
          Expanded(
            child: Container(
              padding: EdgeInsets.all(8.0),
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 198, 198),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: selection(),
            ),
          ),
        ],
      ),
    );
  }
}
