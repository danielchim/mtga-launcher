import 'dart:core';
import 'dart:developer';
import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:win32/win32.dart';

/// The first screen in the bottom navigation bar.
class HomeScreen extends StatelessWidget {
  /// Constructs a [ScreenA] widget.
  const HomeScreen({Key? key}) : super(key: key);

  // Launches the game executable on windows and Linux
  _launchApp() async {
    String winExecutable =
        'C:\\Games\\EFT-modded\\EscapeFromTarkov.exe -bC5vLmcuaS5u={"email":"demo","password":"demo","toggle":"true","timestamp":"0"} -token=81a0cf770000000000000000 -config={"BackendUrl":"https://127.0.0.1","Version":"live"}';
    String linuxExecutable = 'TOBEIMPLEMENTED'; // To be implemented.
    final process = await Process.start(
        Platform.isWindows ? winExecutable : linuxExecutable, [],
        runInShell: false); // this should only be either windows or linux.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text('Screen A'),
            TextButton(
              onPressed: () {
                GoRouter.of(context).go('/a/details');
              },
              child: const Text('View A details'),
            ),
            // This button will disable in the future if it's not supported.
            ElevatedButton(
              onPressed: () {
                log('Game starting!');
                _launchApp();
              },
              child: const Text('Play!'),
            ),
          ],
        ),
      ),
    );
  }
}
