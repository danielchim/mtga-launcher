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

  // This version is bugged by Process.start()
  _launchApp() async {
    String executable = 'C:\\Games\\EFT-modded\\EscapeFromTarkov.exe';
    const String backendUrl = 'https://127.0.0.1';
    final arguments = <String>['-bC5vLmcuaS5u={"email":"demo","password":"demo","toggle":"true","timestamp":"0"}',"-token=81a0cf770000000000000000","-config={BackendUrl:$backendUrl,Version:live}"];
    final process = await Process.start(executable, arguments, runInShell: true);
  }

  _launchAppForWindows() {
    const String backendUrl = 'https://127.0.0.1';
    String executable = 'C:\\Games\\EFT-modded\\EscapeFromTarkov.exe';
    String args = '-bC5vLmcuaS5u={"email":"demo","password":"demo","toggle":"true","timestamp":"0"} -token=81a0cf770000000000000000 -config={"BackendUrl":"$backendUrl","Version":"live"}';
    final exitCode = ShellExecute(NULL, TEXT("open"), TEXT(executable), TEXT(args), nullptr, SW_SHOWNORMAL);
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
