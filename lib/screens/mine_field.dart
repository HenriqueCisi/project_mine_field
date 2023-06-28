import 'package:flutter/material.dart';
import 'package:project_mine_field/components/board_widget.dart';
import 'package:project_mine_field/components/result_widget.dart';
import 'package:project_mine_field/models/board.dart';
import 'package:project_mine_field/models/explosion_exception.dart';
import 'package:project_mine_field/models/field.dart';

class MineFieldApp extends StatefulWidget {
  const MineFieldApp({super.key});

  @override
  State<MineFieldApp> createState() => _MineFieldAppState();
}

class _MineFieldAppState extends State<MineFieldApp> {
  bool? _won;
  final Board _board = Board(
    linesQt: 12,
    gridsQt: 12,
    bombsQt: 10,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: ResultWidget(won: _won, onReset: _reset),
        body: BoardWidget(
          board: _board,
          onOpenField: _open,
          onSwitchMark: _mark,
        ),
      ),
    );
  }

  void _reset() {
    setState(() {
      _won = null;
      _board.reset();
    });
  }

  void _open(Field field) {
    setState(() {
      try {
        field.openField();
      } on ExplosionException {}
    });
  }

  void _mark(Field field) {
   setState(() {
     field.switchMarking();
   });
  }
}
