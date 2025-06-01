import 'package:flutter/material.dart';
import 'package:spotifails/screens/home.dart';
import 'package:icons_plus/icons_plus.dart';

class LoaderScreen extends StatefulWidget {
  const LoaderScreen({super.key});

  @override
  State<LoaderScreen> createState() => _LoaderScreenState();
}

class _LoaderScreenState extends State<LoaderScreen> {
  double opacityGit = 0;
  double opacityText = 0;

  BuildContext get mountedContext => context;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        opacityGit = 1.0;
        opacityText = 1.0;
      });
    });

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        mountedContext,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 218, 199, 174),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: opacityText,
              child: const Text(
                '!K',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 150,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(195, 255, 255, 255),
                ),
              ),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 500),
                  opacity: opacityGit,
                  child: const Icon(
                    Bootstrap.github,
                    size: 150,
                    color: Color.fromARGB(255, 227, 213, 196),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
