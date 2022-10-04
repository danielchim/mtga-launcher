import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// The first screen in the bottom navigation bar.
class HomeScreen extends StatelessWidget {
  /// Constructs a [ScreenA] widget.
  const HomeScreen({Key? key}) : super(key: key);

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
              },
              child: const Text('Play!'),
            ),
          ],
        ),
      ),
    );
  }
}
