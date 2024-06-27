import 'package:go_router/go_router.dart';
import 'package:mtg_deck_builder/features/features.dart';

class MdbRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const BuildDeckScreen(),
      ),
    ],
  );
}
