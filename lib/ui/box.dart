import 'package:flutter/material.dart';

class Box {
  static BoxDecoration card = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(16),
    boxShadow: const [
      BoxShadow(color: Colors.black12, blurRadius: 20, offset: Offset(0, 10)),
    ],
  );
}
