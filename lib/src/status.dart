import 'package:flutter/material.dart';

class Status {
  final String name;
  final IconData icon;
  bool? isActiveStatus;

  Status({
    required this.name,
    required this.icon,
    this.isActiveStatus = false,
  });
}
