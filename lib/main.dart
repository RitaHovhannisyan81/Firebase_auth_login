import 'dart:ui';

import 'package:fire_lesson/widget_tree.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

void _initCrashlitics() {
  FlutterError.onError = (details) => (errorDetails) {
        FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
      };

  PlatformDispatcher.instance.onError =
      (Object exception, StackTrace stackTrace) {
    FirebaseCrashlytics.instance
        .recordError(exception, stackTrace, fatal: true);
    return true;
  };
}
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: 'AIzaSyBojBqvubS8uth0l2vNoGZhF5oWea-EMYw',
    appId: '1:1043520970673:android:8fa776dc95630516fbe790',
    messagingSenderId: 'sendid',
    projectId: 'fb-lesson-a68d4',
    storageBucket: 'fb-lesson-a68d4.appspot.com',
  ));
    FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true);
   _initCrashlitics();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const WidgetTree(),
    );
  }
}






// import 'dart:ui';

// import 'package:firebase_analytics/firebase_analytics.dart';

// ///import 'package:firebase_analytics/observer.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
// import 'package:flutter/material.dart';

// void _initCrashlitics() {
//   FlutterError.onError = (details) => (errorDetails) {
//         FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
//       };

//   PlatformDispatcher.instance.onError =
//       (Object exception, StackTrace stackTrace) {
//     FirebaseCrashlytics.instance
//         .recordError(exception, stackTrace, fatal: true);
//     return true;
//   };
// }

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//       options: const FirebaseOptions(
//     apiKey: 'AIzaSyBojBqvubS8uth0l2vNoGZhF5oWea-EMYw',
//     appId: '1:1043520970673:android:8fa776dc95630516fbe790',
//     messagingSenderId: 'sendid',
//     projectId: 'fb-lesson-a68d4',
//     storageBucket: 'myapp-b9yt18.appspot.com',
//   ));
//   FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true);
//   _initCrashlitics();
//   runApp(const MyWidget());
// }

// class MyWidget extends StatelessWidget {
//   const MyWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       navigatorObservers: [
//         FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance)
//       ],
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
