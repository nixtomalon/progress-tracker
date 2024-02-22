import 'package:flutter/material.dart';
import 'package:progress_tracker/src/status.dart';

class ProgressTracker extends StatelessWidget {
  final int currentIndex;
  final List<Status> statusList;
  final Color? activeColor;
  final Color? inActiveColor;

  const ProgressTracker({
    super.key,
    required this.currentIndex,
    required this.statusList,
    this.activeColor = Colors.green,
    this.inActiveColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < statusList.length; i++) {
      if (i == 0) {
        statusList[i].active = true;
      } else {
        if (statusList[i].active!) {
          statusList[i].active = i <= currentIndex;
        }
      }
    }

    return LayoutBuilder(builder: (_, BoxConstraints box) {
      final count = (box.constrainWidth() / (1.4 * 8.0)).floor();

      return SizedBox(
        height: 82,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Flex(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              direction: Axis.horizontal,
              children: List.generate(count, (_) {
                return SizedBox(
                  width: 10.0,
                  height: 2.8,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                );
              }),
            ),
            Positioned(
              top: 0,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(statusList.length, (index) {
                    return trackProgress(statusList[index], index);
                  }),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget trackProgress(Status status, int index) {
    final statusCount = statusList.length;

    return Expanded(
      child: SizedBox(
        height: 82,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 0,
              child: Icon(
                status.icon,
                size: 26,
                color: status.active! ? activeColor : inActiveColor,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                  visible: status.active! && index < statusCount,
                  child: Expanded(
                    child: Container(
                      height: 3.2,
                      decoration: BoxDecoration(
                        color: status.active! ? activeColor : inActiveColor,
                      ),
                    ),
                  ),
                ),
                Icon(
                  Icons.circle,
                  color: status.active! ? activeColor : inActiveColor,
                  size: 22,
                ),
                Visibility(
                  visible: status.active! && index < statusCount,
                  child: Expanded(
                    child: Container(
                      height: 3.2,
                      decoration: BoxDecoration(
                        color: currentIndex != index ||
                                currentIndex + 1 == statusCount
                            ? activeColor
                            : Colors.transparent,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              child: Text(
                status.name,
                style: TextStyle(
                  color: status.active! ? activeColor : inActiveColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
