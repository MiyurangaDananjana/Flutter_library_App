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
      body: selection(),
    );
  }
}
