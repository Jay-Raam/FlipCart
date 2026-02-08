import 'package:flutter/material.dart';

class AppButton {
  static ButtonStyle primary = ElevatedButton.styleFrom(
    minimumSize: const Size(double.infinity, 48),
    backgroundColor: Colors.blue,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  );
}
