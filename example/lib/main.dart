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
