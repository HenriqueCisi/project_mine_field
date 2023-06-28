import 'package:flutter/material.dart';
import 'package:project_mine_field/components/result_widget.dart';

class MineFieldApp extends StatelessWidget {
  const MineFieldApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      appBar: ResultWidget(won:true, onReset: _reset),
      body: const Text('Board'),)
      ,
    );
  }

  void _reset(){
    print('aaaa');
  }

}