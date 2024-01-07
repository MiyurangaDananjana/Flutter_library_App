
import 'package:flutter/material.dart';
import './components/my_form.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Button Form'),
      ),
      body: MyForm(),
    );
  }
}
