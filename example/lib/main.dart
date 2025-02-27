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
    Status(name: 'SHIPPED', icon: Icons.shopping_bag),
    Status(name: 'Out for Delivery', icon: Icons.local_shipping),
    Status(name: 'Delivered', icon: Icons.check_circle),
  ];

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
            ProgressTracker(
              trackerAtStart: false,
              currentIndex: index,
              statusList: statuList,
              activeColor: const Color(0xff5C5FEF),
              inActiveColor: const Color(0xffA5A6F6),
              horizontalPadding: 16,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: index != statuList.length - 1 ? nextButton : null,
              child: const Text('NEXT'),
            ),
          ],
        ),
      ),
    );
  }
}
