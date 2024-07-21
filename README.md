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

## progress_tracker

 A versatile and easy-to-use Flutter package for implementing progress tracking and status visualization in your applications.

## Features

**Progress Tracking Widgets**:
Easy-to-use widgets for visualizing and tracking progress within your Flutter application.

**User-Friendly Components**:
User-friendly components for indicating status, completion, or progression in various scenarios.

**Open Source and Community-Driven**:
Open source nature that encourages community contributions, fostering collaboration and improvement over time.

## Showcase

<img src="https://github.com/nixtomalon/progress_tracker/raw/main/assets/pt-sample.gif" width="260" />

## How to get started? 🤔

**1.** Add the latest version of package to your pucspec.yaml:
```yaml
dependencies:
  progress_tracker:
```
**2.** Install packages from the comman line: 
```bash
$ flutter pub get
```
**3.** Import the package and use it in your Flutter App.
```dart
import 'package:progress_tracker/progress_tracker.dart';
```

## How to use? 🤔

```dart
import 'package:flutter/material.dart';
import 'package:progress_tracker/progress_tracker.dart';

void main() {
  runApp(const ExampleProgressTracker());
}

class ExampleProgressTracker extends StatefulWidget {
  const ExampleProgressTracker({super.key});

  @override
  State<ExampleProgressTracker> createState() => _MyAppState();
}

class _MyAppState extends State<ExampleProgressTracker> {
  // List of Status objects representing the steps or statuses in the progress tracker.
  // Each Status object includes a name, icon, and an optional 'active' parameter to indicate its current status.
  // The 'name' field represents the label or title of the status.
  // The 'icon' field is the IconData representing the visual representation of the status.
  // The 'active' field, when set to true, indicates that the status is currently active or completed.

  final List<Status> statuList = [
    Status(name: 'ORDER', icon: Icons.shopping_bag),
    Status(name: 'SHIP', icon: Icons.local_shipping),
    Status(name: 'DONE', icon: Icons.check_circle),
  ];

  // The index representing the currently active step in the progress tracker.
  // It determines which step is currently highlighted or marked as completed.

  int index = 0;

  void nextButton() {
    setState(() {
      index++;
      statuList[index].active = true;
    });
  }

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
                statusList: statuList,
                activeColor: Colors
                    .green, // Optional: Customize the color for active steps (default: Colors.green).
                inActiveColor: Colors
                    .grey, // Optional: Customize the color for inactive steps (default: Colors.grey).
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: index != statuList.length - 1 ? nextButton : null,
              child: const Text('NEXT'),
            )
          ],
        ),
      ),
    );
  }
}

```
## Feedback 
* Please raise an issue <a href = "https://github.com/nixtomalon/progress_tracker/issues">here</a>.

## Contect me 📨
<a href="https://github.com/nixtomalon"><img src= "https://img.icons8.com/ios-glyphs/344/github.png" width = "40px"/></a> <a href="https://www.linkedin.com/in/norman-tomalon/"><img src= "https://img.icons8.com/color/344/linkedin.png" width = "40px"/></a> <a href="mailto:nonixtomalon@gmail.com"><img src= "https://img.icons8.com/color/344/gmail-new.png" width = "40px"/></a>