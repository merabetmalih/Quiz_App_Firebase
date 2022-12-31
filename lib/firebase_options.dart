// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;
import 'firebase_options.dart';

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
    apiKey: 'AIzaSyBuJ72jDum_Z4_aJrFp0aSoGS1vWEOMXDU',
    appId: '1:460291169930:web:2d81c65204352636add773',
    messagingSenderId: '460291169930',
    projectId: 'tp3w-45f43',
    authDomain: 'tp3w-45f43.firebaseapp.com',
    storageBucket: 'tp3w-45f43.appspot.com',
    measurementId: 'G-T87F1MM1JZ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDsOJGBoEdn4FQGKw-JIlM-dLxfJuI9oHY',
    appId: '1:460291169930:android:a15374d4fcfb506aadd773',
    messagingSenderId: '460291169930',
    projectId: 'tp3w-45f43',
    storageBucket: 'tp3w-45f43.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC34IMQ70S9Zy4chxc8KlA5dJ0oycLPvXM',
    appId: '1:460291169930:ios:6759c66a6f220bc1add773',
    messagingSenderId: '460291169930',
    projectId: 'tp3w-45f43',
    storageBucket: 'tp3w-45f43.appspot.com',
    iosClientId:
        '460291169930-0n9ouj3sgcvb3rgrqsoraj2e8fec27gs.apps.googleusercontent.com',
    iosBundleId: 'com.example.tp3',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC34IMQ70S9Zy4chxc8KlA5dJ0oycLPvXM',
    appId: '1:460291169930:ios:6759c66a6f220bc1add773',
    messagingSenderId: '460291169930',
    projectId: 'tp3w-45f43',
    storageBucket: 'tp3w-45f43.appspot.com',
    iosClientId:
        '460291169930-0n9ouj3sgcvb3rgrqsoraj2e8fec27gs.apps.googleusercontent.com',
    iosBundleId: 'com.example.tp3',
  );
}


// ...