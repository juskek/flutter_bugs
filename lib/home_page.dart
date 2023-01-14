import 'package:flutter/material.dart';
import 'package:flutter_bugs/animation_widget/loading_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Future<bool> future =
        Future.delayed(const Duration(milliseconds: 100), () => true);
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            child: const Text('Show Dialog'),
            //! showDialog + LoadingWidget
            onPressed: () => showDialog(
                  barrierDismissible: true,
                  context: context,
                  builder: (context) => Dialog(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        LoadingWidget(key: GlobalKey(), future: future),
                        const Text('Tap outside dialog to dismiss'),
                      ],
                    ),
                  ),
                )
            //! customDialog+LoadingWidget
            // onPressed: () => Popups.customDialog(
            //   context,
            //   dialogChild: (dialogContext) =>
            //       LoadingWidget(key: GlobalKey(), future: future),
            // ),
            //! customLoadingDialog
            // onPressed: () => Popups.customLoadingDialog(
            //   context,
            //   future:future,
            //   dialogChildSuccess: (dialogContext) {
            //     Popups.delayedCloseDialog(dialogContext);
            //     return const Text('Success');
            //   },
            // ),
            ),
      ),
    );
  }
}
