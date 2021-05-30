import 'package:flutter/material.dart';

import 'body.dart';

void main() {
  runApp(MultiBallPongGameApp());
}

class MultiBallPongGameApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBallPongGame(),
    );
  }
}

class MultiBallPongGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
