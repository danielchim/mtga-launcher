import 'dart:developer';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);
  @override
  State<SettingsScreen> createState() => _SettingState();
}

/// The third screen in the bottom navigation bar.
class _SettingState extends State<SettingsScreen> {
  /// Constructs a [ScreenC] widget.
  String path ='Please enter a path:';
  String exeName ='';

  _pickExeLocation(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['exe'],
    );
    if (result != null) {
      PlatformFile file = result.files.first;
      log(result.files.single.name);
      if(result.files.single.name != 'EscapeFromTarkov.exe' && mounted){
        // registerDialog(context);
      }
      setState(() {
        path = result.files.single.path.toString()!;
        exeName = result.files.single.name;
      });
    } else {
      // User canceled the picker
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text('Settings'),
            TextFormField (
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Tarkov path:',
              ),
                enabled: false,
                controller: TextEditingController(
                    text: path
                ),
                validator: (value) {
                  if (value != 'EscapeFromTarkov.exe') {
                  return 'Error';
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: () {
                _pickExeLocation(context);
              },
              child: const Text('Pick location'),
            ),
            TextButton(
              onPressed: () {
                GoRouter.of(context).go('/c/details');
              },
              child: const Text('View C details'),
            ),
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).go('/login');
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }

  // DISABLED until flutter fixed the go_router issue or until i remember to report to the flutter team.
  // registerDialog(BuildContext context) {
  //   // Init
  //   AlertDialog dialog = AlertDialog(
  //     title: const Text('Invalid executable'),
  //     content: Column(
  //       crossAxisAlignment: CrossAxisAlignment.stretch,
  //       //position
  //       mainAxisSize: MainAxisSize.min,
  //       // wrap content in flutter
  //       children: const <Widget>[
  //         Text(
  //           'Please provide the correct EscapeFromTarkov.exe executable.'
  //         ),
  //       ],
  //     ),
  //     actions: <Widget>[
  //       TextButton(
  //         onPressed: () => Navigator.pop(context, 'Cancel'),
  //         child: const Text('Cancel'),
  //       ),
  //       TextButton(
  //         onPressed: () => Navigator.pop(context, 'OK'),
  //         child: const Text('OK'),
  //       ),
  //     ],
  //   );
  //
  //   // Show the dialog
  //   showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return dialog;
  //       }
  //   );
  // }
}