import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotFoundScreen extends StatelessWidget {
  final Exception? exception;
  const NotFoundScreen({this.exception, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Text(
            '404',
            style: TextStyle(fontSize: 30, color: Colors.red),
          ),
          const SizedBox(
            height: 20,
            width: double.infinity,
          ),
          Text('ERROR: $exception'),
          const SizedBox(height: 20),
          OutlinedButton(
            onPressed: () => context.go('/'),
            child: const Text('Go home'),
          ),
          const SizedBox(height: 20),
          OutlinedButton(
            onPressed: () => context.pop(),
            child: const Text('Go back'),
          )
        ],
      ),
    );
  }
}
