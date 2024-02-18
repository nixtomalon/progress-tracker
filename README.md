<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

 A versatile and easy-to-use Flutter package for implementing progress tracking and status visualization in your applications.

## Features

#Progress Tracking Widgets:
Easy-to-use widgets for visualizing and tracking progress within your Flutter application.

#User-Friendly Components:
User-friendly components for indicating status, completion, or progression in various scenarios.

#Open Source and Community-Driven:
Open source nature that encourages community contributions, fostering collaboration and improvement over time.

## Installation

1. Add the latest version of package to your pucspec.yaml (and run dart pub get):
```shell
dependencies:
  progress_tracker: ^0.0.1
```
2. Import the package and use it in your Flutter App.
```shell
import 'package:progress_tracker/progress_tracker.dart';
```

## Usage

```dart
import 'package:flutter/material.dart';
import 'package:progress_tracker/progress_tracker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<ProgressStatus> progressStatuses = [
    ProgressStatus(
        name: 'ORDER', icon: Icons.shopping_bag, isActiveStatus: true),
    ProgressStatus(name: 'SHIP', icon: Icons.local_shipping),
    ProgressStatus(name: 'DONE', icon: Icons.check_circle),
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Example Progress Tracker'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: ProgressTracker(
                currentIndex: index,
                progressStatuses: progressStatuses,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: index == progressStatuses.length - 1
                  ? null
                  : () {
                      setState(() {
                        index++;
                        progressStatuses[index].isActiveStatus = true;
                      });
                    },
              child: const Text('NEXT'),
            )
          ],
        ),
      ),
    );
  }
}
```
