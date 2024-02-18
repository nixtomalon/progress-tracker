import 'package:flutter/material.dart';
import 'package:progress_tracker/src/status.dart';

class ProgressTracker extends StatelessWidget {
  final int currentIndex;
  final List<ProgressStatus> progressStatuses;
  final Color? activeColor;
  final Color? inActiveColor;

  const ProgressTracker({
    super.key,
    required this.currentIndex,
    required this.progressStatuses,
    this.activeColor = Colors.green,
    this.inActiveColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, BoxConstraints box) {
      final count = (box.constrainWidth() / (1.4 * 8.0)).floor();

      return Container(
        height: 82,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Flex(
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              direction: Axis.horizontal,
            ),
            Positioned(
              top: 0,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(progressStatuses.length, (index) {
                    return trackProgress(progressStatuses[index], index);
                  }),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget trackProgress(ProgressStatus status, int index) {
    final statusCount = progressStatuses.length;
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
                color: status.isActiveStatus! ? activeColor : inActiveColor,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                  visible: status.isActiveStatus! && index < statusCount,
                  child: Expanded(
                    child: Container(
                      height: 3.2,
                      decoration: BoxDecoration(
                        color: status.isActiveStatus!
                            ? activeColor
                            : inActiveColor,
                      ),
                    ),
                  ),
                ),
                Icon(
                  Icons.circle,
                  color: status.isActiveStatus! ? activeColor : inActiveColor,
                  size: 22,
                ),
                Visibility(
                  visible: status.isActiveStatus! && index < statusCount,
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
                  color: status.isActiveStatus! ? activeColor : inActiveColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
