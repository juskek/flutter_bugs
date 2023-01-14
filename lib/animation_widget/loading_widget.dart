import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bugs/animation_widget/components/lottie_animation_widget.dart';
import 'package:flutter_bugs/animation_widget/components/lottie_looping_animation_widget.dart';

class LoadingWidget extends StatefulWidget {
  const LoadingWidget({required this.future, this.size = 200, super.key});

  final double size;

  /// Return true for success, false for failure
  final Future<bool> future;
  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  final _ratioSuccess =
      100 / 107; // ratio of loading to success animation sizes
  final _ratioError = 100 / 145; // ratio of loading to error animation sizes

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // future: Future.delayed(const Duration(milliseconds: 2500)), // for testing
      future: widget.future,
      builder: (context, snapshot) {
        // Widget child;
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data as bool) {
            return LottieAnimationWidget(
                size: widget.size * _ratioSuccess,
                assetPath: 'assets/animations/loading_success.json');
          } else {
            return LottieAnimationWidget(
                size: widget.size * _ratioError,
                startValue: 0.57,
                assetPath: 'assets/animations/loading_error.json');
          }
        } else {
          return LottieLoopingAnimationWidget(
            assetPath: 'assets/animations/loading.json',
            size: widget.size,
            startValue: 0,
            stopValue: 0.193,
          );
        }
        // return child;
      },
    );
  }
}
