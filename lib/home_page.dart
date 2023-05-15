import 'package:flutter/material.dart';
import 'package:flutter_bugs/ioc/container.dart';
import 'package:flutter_bugs/repository/i_foo_repository.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            child: const Text('Throw Exception'),
            onPressed: () => showDialog(
                barrierDismissible: true,
                context: context,
                builder: (context) {
                  return FutureBuilder(
                    future: getIt<IFooRepository>().foo(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return const Dialog(
                          child: SizedBox(
                              height: 300,
                              width: 300,
                              child: Text('Exception was thrown')),
                        );
                      }
                      return const Dialog(
                        child: SizedBox(
                            height: 300,
                            width: 300,
                            child: Text('Exception was not thrown')),
                      );
                    },
                  );
                })),
      ),
    );
  }
}
