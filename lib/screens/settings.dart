import 'dart:developer';

import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {

  @override
  State<SettingScreen> createState() => SettingScreenState();
}

class SettingScreenState extends State<SettingScreen> {
  bool _isRunning = false;
  String launchText = "Press the button to launch the game";
  String backendUrl = "https://127.0.0.1:443";
  final myController = TextEditingController();

  void _startApp() async {
    log('hi');
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        TextField(
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Login name',
          ),
          controller: myController,
        ),
        TextField(
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Password',
          ),
          controller: myController,

        ),
        Text(
          launchText,
        ),
        ElevatedButton(
          onPressed: _startApp,
          child: const Text("Login!"),
        ),
        const TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Server IP',
          ),
        ),
        Text(
          launchText,
        ),
        ElevatedButton(
          onPressed: _startApp,
          child: const Text("Play!"),
        )
      ],
    );
  }


}