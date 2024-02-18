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
