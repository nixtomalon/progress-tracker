import 'package:flutter/material.dart';
import 'package:progress_tracker/src/status.dart';

class ProgressTracker extends StatefulWidget {
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

  /// Determines whether the tracker should start with a tracker or a line.
  final bool trackerAtStart;

  /// Determines whether only the active tracker should display an icon.
  final bool showIconOnlyOnActive;

  ///Determines whether the step number should be displayed inside the tracker.
  final bool showStepNumber;

  /// Specifies the icon to be displayed only on the active step.
  final IconData iconOnlyOnActive;

  final double horizontalPadding;
  final double verticalPadding;

  /// Height of the progress tracker.
  final double height;

  /// Creates a [ProgressTracker] widget.
  ///
  /// The [currentIndex] represents the currently active step in the progress tracker.
  /// The [statusList] is a list of [Status] objects that define each step, including a name, icon, and active state.
  /// The [activeColor] and [inActiveColor] define the colors for active and inactive steps, respectively.
  /// The [trackerAtStart] controls whether the tracker appears before the progress line
  /// (Tracker → Line → Tracker) or after it (Line → Tracker → Line).
  /// The [showIconOnlyOnActive] determines whether only the active tracker should display an icon.
  /// The [showStepNumber] specifies whether the step number should be displayed inside the tracker.
  /// The [iconOnlyOnActive] allows defining a specific icon that appears only on the active step.
  /// The [horizontalPadding] and [verticalPadding] adjust the spacing around the progress tracker.
  /// The [height] determines the vertical size of the progress tracker.

  const ProgressTracker({
    Key? key,
    required this.currentIndex,
    required this.statusList,
    this.activeColor = Colors.green,
    this.inActiveColor = Colors.grey,
    this.trackerAtStart = true,
    this.showIconOnlyOnActive = false,
    this.showStepNumber = false,
    this.iconOnlyOnActive = Icons.arrow_drop_down,
    this.horizontalPadding = 16.0,
    this.verticalPadding = 16.0,
    this.height = 100,
  }) : super(key: key);

  @override
  State<ProgressTracker> createState() => _ProgressTrackerState();
}

class _ProgressTrackerState extends State<ProgressTracker> {
  late List<Status> statuses;

  @override
  void initState() {
    super.initState();
    _updateStatusList(); // Set initial active states
  }

  /// Updates the active states of each step based on the current index.
  void _updateStatusList() {
    statuses = List.from(widget.statusList);
    for (int i = 0; i < statuses.length; i++) {
      statuses[i].active = i == 0 || i <= widget.currentIndex;
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, BoxConstraints box) {
      // Calculate the number of inactive steps based on the available width.
      final count = (box.constrainWidth() / (1.4 * 8.0)).floor();

      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: widget.horizontalPadding,
          vertical: widget.verticalPadding,
        ),
        child: SizedBox(
          height: widget.height,
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
                        color: widget.inActiveColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  );
                }),
              ),
              Visibility(
                visible: !widget.trackerAtStart,
                child: Positioned(
                  top: 0,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(statuses.length, (index) {
                        return buildLineAtStart(statuses[index], index);
                      }),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: widget.trackerAtStart,
                child: Positioned(
                  top: 0,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width -
                        widget.horizontalPadding * 2,
                    child: buildTrackerAtStart(),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  /// Builds the progress tracker when the `trackerAtStart` option is enabled.
  ///
  /// This function ensures the correct sequence of `Tracker > Line > Tracker > Line > Tracker`
  Stack buildTrackerAtStart() {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Generates the progress lines connecting the trackers.
        Row(
          children: List.generate(statuses.length - 1, (index) {
            return Expanded(
              child: Container(
                height: 3.2,
                color: statuses[index + 1].active!
                    ? widget.activeColor
                    : Colors.transparent,
              ),
            );
          }),
        ),
        // Generates the individual steps (icons, trackers, and labels).
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(statuses.length, (index) {
            return SizedBox(
              height: widget.height,
              child: Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  // Displays the step icon at the top of each tracker.
                  Visibility(
                    visible: !widget.showIconOnlyOnActive,
                    child: Positioned(
                      top: 0,
                      left: index == 0 ? 0 : null,
                      right: index == statuses.length - 1 ? 0 : null,
                      child: Icon(
                        statuses[index].icon,
                        size: 26,
                        color: statuses[index].active!
                            ? widget.activeColor
                            : widget.inActiveColor,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: widget.showIconOnlyOnActive &&
                        index == widget.currentIndex,
                    child: Positioned(
                      top: 0,
                      child: Icon(
                        size: 30,
                        widget.iconOnlyOnActive,
                        color: statuses[index].active!
                            ? widget.activeColor
                            : widget.inActiveColor,
                      ),
                    ),
                  ),
                  // Displays the circular progress tracker.
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: statuses[index].active!
                          ? widget.activeColor
                          : widget.inActiveColor,
                      shape: BoxShape.circle,
                    ),
                    child: widget.showStepNumber
                        ? Center(
                            child: Text(
                            (index + 1).toString(),
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ))
                        : null,
                  ),
                  // Displays the label below the tracker.
                  Positioned(
                    bottom: 0,
                    left: index == 0 ? 0 : null,
                    right: index == statuses.length - 1 ? 0 : null,
                    child: Text(
                      statuses[index].name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: statuses[index].active!
                            ? widget.activeColor
                            : widget.inActiveColor,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ],
    );
  }

  /// Builds a single step in the progress tracker when `trackerAtStart` is disabled.
  ///
  ////// This function ensures the correct sequence of `Line > Tracker > Line > Tracker Line`
  Expanded buildLineAtStart(Status status, int index) {
    final statusCount = statuses.length;

    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Display the icon representing the step.
            Visibility(
              visible: !widget.showIconOnlyOnActive,
              child: Positioned(
                top: 0,
                child: Icon(
                  status.icon,
                  size: 26,
                  color: status.active!
                      ? widget.activeColor
                      : widget.inActiveColor,
                ),
              ),
            ),
            Visibility(
              visible:
                  widget.showIconOnlyOnActive && index == widget.currentIndex,
              child: Positioned(
                top: 0,
                child: Icon(
                  size: 30,
                  widget.iconOnlyOnActive,
                  color: statuses[index].active!
                      ? widget.activeColor
                      : widget.inActiveColor,
                ),
              ),
            ),
            // Display visual indicators for the step's status.
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  visible: status.active! && index < statusCount,
                  child: Expanded(
                    child: Container(
                      height: 3.2,
                      decoration: BoxDecoration(
                        color: status.active!
                            ? widget.activeColor
                            : widget.inActiveColor,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: statuses[index].active!
                        ? widget.activeColor
                        : widget.inActiveColor,
                    shape: BoxShape.circle,
                  ),
                  child: widget.showStepNumber
                      ? Center(
                          child: Text(
                          (index + 1).toString(),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ))
                      : null,
                ),
                Visibility(
                  visible: status.active! && index < statusCount,
                  child: Expanded(
                    child: Container(
                      height: 3.2,
                      decoration: BoxDecoration(
                        color: widget.currentIndex != index ||
                                widget.currentIndex + 1 == statusCount
                            ? widget.activeColor
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
                  color: status.active!
                      ? widget.activeColor
                      : widget.inActiveColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
