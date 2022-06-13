import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class MyCategory {
  final String id;
  final String title;
  final Color color;

  const MyCategory(
      {required this.id, required this.title, this.color = Colors.limeAccent});
}
