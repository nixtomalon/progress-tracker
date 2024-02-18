import 'package:flutter/material.dart';

class ProgressStatus {
  final String name;
  final IconData icon;
  bool? isActiveStatus;

  ProgressStatus({
    required this.name,
    required this.icon,
    this.isActiveStatus = false,
  });
}
