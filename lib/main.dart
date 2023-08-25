import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:untitled/widgets/splash.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> main() async {
  await SentryFlutter.init(
    (options) => {
      options.dsn =
          'https://f67869e3983d4e1698f1c092bd880fb9@o1418292.ingest.sentry.io/4504078280556544',
      options.tracesSampleRate = 1.0,
      options.attachScreenshot = true,
    },
    appRunner: () => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    )),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const Splash(),
    );
  }
}
