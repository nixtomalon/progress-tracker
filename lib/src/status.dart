import 'package:flutter/material.dart';

class Status {
  final String name;
  final IconData icon;
  bool? active;

  Status({
    required this.name,
    required this.icon,
    this.active = false,
  });
}
