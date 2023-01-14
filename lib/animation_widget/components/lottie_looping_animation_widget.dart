import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieLoopingAnimationWidget extends StatefulWidget {
  const LottieLoopingAnimationWidget(
      {required this.assetPath,
      this.size = 300,
      this.startValue = 0,
      this.stopValue = 1,
      this.reverse = false,
      super.key});

  final String assetPath;

  /// Pass a controller if access to controller methods is required.
  final double size;
  final double startValue;
  final double stopValue;
  final bool reverse;

  @override
  State<LottieLoopingAnimationWidget> createState() =>
      _LottieLoopingAnimationWidgetState();
}

class _LottieLoopingAnimationWidgetState
    extends State<LottieLoopingAnimationWidget> with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this)..value = widget.startValue;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.size,
      width: widget.size,
      child: Lottie.asset(
        widget.assetPath,
        controller: _controller,
        height: widget.size,
        width: widget.size,
        onLoaded: (composition) {
          setState(() {
            _controller.duration = composition.duration;
            _controller.repeat(
              min: widget.startValue,
              max: widget.stopValue,
              reverse: widget.reverse,
              period: _controller.duration! *
                  (widget.stopValue - widget.startValue),
            );
          });
        },
      ),
    );
  }
}
