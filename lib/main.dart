import 'package:flutter/material.dart';
import 'package:shimmer_effect/shimmer_example.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ShimmerExample(),
    );
  }
}
