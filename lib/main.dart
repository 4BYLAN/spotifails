import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spotifails/screens/loader.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'SpotiFails', home: const LoaderScreen());
  }
}
