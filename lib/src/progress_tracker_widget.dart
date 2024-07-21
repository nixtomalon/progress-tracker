import 'package:flutter/material.dart';
import 'package:progress_tracker/src/status.dart';

class ProgressTracker extends StatelessWidget {
  /// The index representing the currently active step in the progress tracker.
  ///
  /// It determines which step is currently highlighted or marked as completed.
  final int currentIndex;

  /// List of [Status] objects representing the steps or statuses in the progress tracker.
  ///
  /// Each [Status] object includes a name, icon, and an optional 'active' parameter to indicate its current status.
  /// The 'name' field represents the label or title of the status.
  /// The 'icon' field is the IconData representing the visual representation of the status.
  /// The 'active' field, when set to true, indicates that the status is currently active or completed.
  final List<Status> statusList;

  /// The color for active steps in the progress tracker.
  ///
  /// Defaults to [Colors.green] if not specified.
  final Color? activeColor;

  /// The color for inactive steps in the progress tracker.
  ///
  /// Defaults to [Colors.grey] if not specified.
  final Color? inActiveColor;

  final double height = 100;

  /// Creates a [ProgressTracker] widget.
  ///
  /// The [currentIndex] represents the currently active step in the progress tracker.
  /// The [statusList] is a list of [Status] objects indicating the steps in the progress.
  /// The [activeColor] and [inActiveColor] parameters define the colors for active and inactive elements.

  const ProgressTracker({
    Key? key,
    required this.currentIndex,
    required this.statusList,
    this.activeColor = Colors.green,
    this.inActiveColor = Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Ensure that the first element is active by default.
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
      // Calculate the number of inactive steps based on the available width.
      final count = (box.constrainWidth() / (1.4 * 8.0)).floor();

      return SizedBox(
        height: height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Display horizontal lines between steps.
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
            // Display the steps and their status indicators.
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

  /// Displays a single step in the progress tracker with its associated status.
  Widget trackProgress(Status status, int index) {
    final statusCount = statusList.length;

    return Expanded(
      child: SizedBox(
        height: height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Display the icon representing the step.
            Positioned(
              top: 0,
              child: Icon(
                status.icon,
                size: 26,
                color: status.active! ? activeColor : inActiveColor,
              ),
            ),
            // Display visual indicators for the step's status.
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
            // Display the label or name of the step.
            Positioned(
              bottom: 0,
              child: Text(
                status.name,
                textAlign: TextAlign.center,
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
