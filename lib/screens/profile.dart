import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// The second screen in the bottom navigation bar.
class ProfileScreen extends StatelessWidget {
  /// Constructs a [ScreenB] widget.
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text('Screen B'),
            TextButton(
              onPressed: () {
                GoRouter.of(context).go('/b/details');
              },
              child: const Text('View B details'),
            ),
          ],
        ),
      ),
    );
  }
}