// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAGU6swKJl_Q9NXyWAh7EshEk3XScvu9Ao',
    appId: '1:935996019089:web:d2c120e805272feb220a30',
    messagingSenderId: '935996019089',
    projectId: 'chatapp-ee70f',
    authDomain: 'chatapp-ee70f.firebaseapp.com',
    storageBucket: 'chatapp-ee70f.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCay_SEJLSzXkylLmTcQbHdVQQdL9i7Dt0',
    appId: '1:935996019089:android:93519e104ff1aa8e220a30',
    messagingSenderId: '935996019089',
    projectId: 'chatapp-ee70f',
    storageBucket: 'chatapp-ee70f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAQwxfLPe2akw8jDnwWhrGCm6Bg4WmV8mI',
    appId: '1:935996019089:ios:c080781a83e9740a220a30',
    messagingSenderId: '935996019089',
    projectId: 'chatapp-ee70f',
    storageBucket: 'chatapp-ee70f.appspot.com',
    androidClientId: '935996019089-e0ui180649m147k1trikk3d9qujrlqvj.apps.googleusercontent.com',
    iosClientId: '935996019089-96ds742pkh0vg1172tde7jpvpnogfvc1.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAQwxfLPe2akw8jDnwWhrGCm6Bg4WmV8mI',
    appId: '1:935996019089:ios:c080781a83e9740a220a30',
    messagingSenderId: '935996019089',
    projectId: 'chatapp-ee70f',
    storageBucket: 'chatapp-ee70f.appspot.com',
    androidClientId: '935996019089-e0ui180649m147k1trikk3d9qujrlqvj.apps.googleusercontent.com',
    iosClientId: '935996019089-96ds742pkh0vg1172tde7jpvpnogfvc1.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatApp',
  );
}
