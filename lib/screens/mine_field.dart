import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MineFieldApp extends StatelessWidget {
  const MineFieldApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('MineField'),
      ),
      body: Container(child: Text('Board')),)
      ,
    );
  }
}