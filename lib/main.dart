import 'package:flutter/material.dart';
import 'package:tv_show/app_router.dart';

void main() {
  runApp(TvShowApp(
    appRouter: AppRouter(),
  ));
}

class TvShowApp extends StatelessWidget {
  final AppRouter appRouter;

  const TvShowApp({super.key, required this.appRouter});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRouter.generteRoute);
  }
}
