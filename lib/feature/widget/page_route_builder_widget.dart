// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

Route PageRouteBuilderPage<T>(
    {required Widget page, required String routeName}) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionDuration: const Duration(seconds: 2),
    reverseTransitionDuration: const Duration(seconds: 1),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      animation = CurvedAnimation(curve: Curves.bounceOut, parent: animation);

      return ScaleTransition(
          scale: animation, alignment: Alignment.center, child: child);
    },
  );
}
