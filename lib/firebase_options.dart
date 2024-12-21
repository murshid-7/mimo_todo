// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyA8WoBssVEgatA-EpVCU_uT6Oq4fBuiPO0',
    appId: '1:1006456996209:web:575a6ed17764e0cc8136d0',
    messagingSenderId: '1006456996209',
    projectId: 'momo-todo-task',
    authDomain: 'momo-todo-task.firebaseapp.com',
    storageBucket: 'momo-todo-task.firebasestorage.app',
    measurementId: 'G-1J3GFLQHZ0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDUQU-dlbgJQpEUwUnTDqRLjWCahg-T_yE',
    appId: '1:1006456996209:android:b695e75fcbe8bcf08136d0',
    messagingSenderId: '1006456996209',
    projectId: 'momo-todo-task',
    storageBucket: 'momo-todo-task.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD4YbwjwJ6jtYuUZK5S_WxLnOeeCVq1308',
    appId: '1:1006456996209:ios:7de328e20467153c8136d0',
    messagingSenderId: '1006456996209',
    projectId: 'momo-todo-task',
    storageBucket: 'momo-todo-task.firebasestorage.app',
    iosBundleId: 'com.example.momoTodoTask',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD4YbwjwJ6jtYuUZK5S_WxLnOeeCVq1308',
    appId: '1:1006456996209:ios:7de328e20467153c8136d0',
    messagingSenderId: '1006456996209',
    projectId: 'momo-todo-task',
    storageBucket: 'momo-todo-task.firebasestorage.app',
    iosBundleId: 'com.example.momoTodoTask',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA8WoBssVEgatA-EpVCU_uT6Oq4fBuiPO0',
    appId: '1:1006456996209:web:9218c3473df720438136d0',
    messagingSenderId: '1006456996209',
    projectId: 'momo-todo-task',
    authDomain: 'momo-todo-task.firebaseapp.com',
    storageBucket: 'momo-todo-task.firebasestorage.app',
    measurementId: 'G-EGLK2JQEV6',
  );

}