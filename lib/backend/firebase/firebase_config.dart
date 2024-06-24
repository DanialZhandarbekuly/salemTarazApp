import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCiCduPfP85tCp2xxoWchvedgPCWUXrA4s",
            authDomain: "salemtaraz-da42d.firebaseapp.com",
            projectId: "salemtaraz-da42d",
            storageBucket: "salemtaraz-da42d.appspot.com",
            messagingSenderId: "461908926912",
            appId: "1:461908926912:web:b68760645566fd512d6825"));
  } else {
    await Firebase.initializeApp();
  }
}
