import 'package:flutter/material.dart';

class ContactMe extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ContactMeState();
}

class _ContactMeState extends State<ContactMe> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Contact'),
        backgroundColor: Colors.blue[600],
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Text(
        'Contact Me',
        textAlign: TextAlign.center,
      ),
    );
  }
}
