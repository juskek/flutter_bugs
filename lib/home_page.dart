import 'package:flutter/material.dart';
import 'package:flutter_bugs/lottie_animation_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            child: const Text('Show Dialog'),
            onPressed: () => showDialog(
                  barrierDismissible: true,
                  context: context,
                  builder: (context) => const Dialog(
                    child: SizedBox(
                      height: 300,
                      width: 300,
                      child: LottieAnimationWidget(
                          assetPath: 'assets/animations/loading_success.json'),
                    ),
                  ),
                )),
      ),
    );
  }
}
