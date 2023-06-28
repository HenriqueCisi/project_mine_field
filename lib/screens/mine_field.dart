import 'package:flutter/material.dart';
import 'package:project_mine_field/components/board_widget.dart';
import 'package:project_mine_field/components/result_widget.dart';
import 'package:project_mine_field/models/board.dart';
import 'package:project_mine_field/models/field.dart';

class MineFieldApp extends StatelessWidget {
  const MineFieldApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: ResultWidget(won: false, onReset: _reset),
        body: BoardWidget(
          board: Board(
            linesQt: 15,
            gridsQt: 15,
            bombsQt: 0,
          ),
          onOpenField: _open,
          onSwitchMark: _mark,
        ),
      ),
    );
  }

  void _reset() {
    print('reset');
  }

  void _open(Field field) {
    print('open');
  }

  void _mark(Field field) {
    print('mark');
  }
}
