import 'package:flutter/material.dart';
import 'package:ltv_flutter_challenge/pages/blog_screen.dart';
import 'package:ltv_flutter_challenge/pages/map_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/blog',
      routes: {
        '/blog': (context) => const BlogScreen(),
        '/map': (context) => const MapScreen(),
      },
    );
  }
}
