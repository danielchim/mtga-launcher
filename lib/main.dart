import 'dart:ffi';

import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:developer';
import 'dart:convert';
import 'package:win32/win32.dart';
import 'package:ffi/ffi.dart';
import 'providers/authencation.dart';
import 'screens/home.dart';
import 'screens/settings.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'MTGA launcher'),
      routes: {
        '/settings': (context) => SettingScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isRunning = false;
  String launchText = "Press the button to launch the game";
  String backendUrl = "https://127.0.0.1:443";
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  void _startApp() async {
    String executable = 'C:\\Games\\EFT-Modded\\EscapeFromTarkov.exe';
    String args = '-bC5vLmcuaS5u={"email":"demo","password":"demo","toggle":"true","timestamp":"0"} -token=81a0cf770000000000000000 -config={"BackendUrl":"$backendUrl","Version":"live"}';
    _isRunning = !_isRunning;
    setState(() {
      launchText = "The game is running!";
    });
    log("Game running: $_isRunning");
    // final exitCode = ShellExecute(NULL, TEXT("open"), TEXT(executable), TEXT(args), nullptr, SW_SHOWNORMAL);
    _isRunning = !_isRunning;
    setState(() {
      launchText = "Press the button to launch the game";
    });
    log("Game running: $_isRunning");
  }

  void _login() async {
    // auth("demo","demo");
    log("Game running: ${myController.text}");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>  SettingScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
              onPressed: _login,
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
        ),
      ),
    );
  }
}
