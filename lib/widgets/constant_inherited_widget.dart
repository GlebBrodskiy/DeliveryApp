import 'package:flutter/material.dart';

class Constant extends InheritedWidget {
  final Color neededColor;

  const Constant({required this.neededColor, required Widget child})
      : super(child: child);

  @override
  bool updateShouldNotify(Constant old) => neededColor != old.neededColor;

  static Constant? of(BuildContext context) {
    final Constant? result =
    context.dependOnInheritedWidgetOfExactType<Constant>();
    assert(result != null, 'No Constant found in context');
    return result!;
  }
}