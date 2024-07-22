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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBZa5Ufkv76Z4FdtNYURQMu0hHwnBlpGng',
    appId: '1:782395919384:web:f6ed0a17f20a5b8789076d',
    messagingSenderId: '782395919384',
    projectId: 'rydifyco-e6353',
    authDomain: 'rydifyco-e6353.firebaseapp.com',
    storageBucket: 'rydifyco-e6353.appspot.com',
    measurementId: 'G-FGWVCBCQGX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCz6QwHlZU0udeLOCWVtivISigksq26ahk',
    appId: '1:782395919384:android:34be7c5a0b68112189076d',
    messagingSenderId: '782395919384',
    projectId: 'rydifyco-e6353',
    storageBucket: 'rydifyco-e6353.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC_X01maMl4fVV-YZCVQCNq5TO8ZnkXsxg',
    appId: '1:782395919384:ios:0fa3b37dc245105f89076d',
    messagingSenderId: '782395919384',
    projectId: 'rydifyco-e6353',
    storageBucket: 'rydifyco-e6353.appspot.com',
    iosBundleId: 'com.rydify.rydify',
  );
}