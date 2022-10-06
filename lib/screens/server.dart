import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';

import '../components/register.dart';
import '../components/serverlist.dart';

// TODO: Fix pixel overflow

class ServerSelectionScreen extends StatefulWidget {
  const ServerSelectionScreen({Key? key}) : super(key: key);

  @override
  ServerSelectionScreenState createState() => ServerSelectionScreenState();
}

/// The first screen in the bottom navigation bar.
class ServerSelectionScreenState extends State<ServerSelectionScreen> {
  bool showRegisterDialog = false;
  int selectedVal = 0;
  int count = 0;

  @override
  initState() {
    super.initState();
    var demo = _localPath;
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/counter.txt');
  }

  Future<File> writeCounter(int counter) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString('$counter');
  }

  Future<int> readCounter() async {
    try {
      final file = await _localFile;

      // Read the file
      final contents = await file.readAsString();

      return int.parse(contents);
    } catch (e) {
      // If encountering an error, return 0
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('MTGA Lanucher'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text('Select server'),
            DropdownButtonExample(
              onCountChanged: (int val) {
                if(val == 1) {
                  newServerDialog(context);
                }
                setState(() => selectedVal = val);
                log(selectedVal.toString());
              },
            ),
            const Text('Username'),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Username',
              ),
            ),
            const Text('Password'),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).go('/index');
              },
              child: const Text('Login'),
            ),
            TextButton(onPressed: () => registerDialog(context), child: const Text('Register'))
          ],
        ),
      ),
    );
  }

  registerDialog(BuildContext context) {
    // Init
    AlertDialog dialog = AlertDialog(
      title: const Text('Register new user'),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        //position
        mainAxisSize: MainAxisSize.min,
        // wrap content in flutter
        children: const <Widget>[
          TextField(
            obscureText: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Username',
            ),
          ),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
            ),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text('OK'),
        ),
      ],
    );

    // Show the dialog
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return dialog;
        }
    );
  }

  newServerDialog(BuildContext context) {
    // Init
    AlertDialog dialog = AlertDialog(
      title: const Text('New server dialog'),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        //position
        mainAxisSize: MainAxisSize.min,
        // wrap content in flutter
        children: const <Widget>[
          TextField(
            obscureText: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Server location',
            ),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => {
            setState(() => count++),
            Navigator.pop(context, 'OK')
          },
          child: const Text('OK'),
        ),
      ],
    );

    // Show the dialog
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return dialog;
        }
    );
  }
}