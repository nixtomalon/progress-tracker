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
  final List<Status> statuList = [
    Status(name: 'ORDER', icon: Icons.shopping_bag),
    Status(name: 'SHIP', icon: Icons.local_shipping),
    Status(name: 'DONE', icon: Icons.check_circle),
  ];

  int index = 0;

  void onClickButton() {
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
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: index != statuList.length - 1 ? onClickButton : null,
              child: const Text('NEXT'),
            )
          ],
        ),
      ),
    );
  }
}
