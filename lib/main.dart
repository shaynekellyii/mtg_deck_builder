import 'package:flutter/material.dart';
import 'package:mtg_deck_builder/services/services.dart';

void main() {
  MdbLocator.setup();
  runApp(const MdbApp());
}

class MdbApp extends StatelessWidget {
  const MdbApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: MdbRouter.router,
    );
  }
}
