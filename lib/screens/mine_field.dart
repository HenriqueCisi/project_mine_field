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
  Board? _board;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: ResultWidget(won: _won, onReset: _reset),
        body: Container(
          color: Colors.grey,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return BoardWidget(
                board: _getBoard(constraints.maxWidth, constraints.maxHeight),
                onOpenField: _open,
                onSwitchMark: _mark,
              );
            },
          ),
        ),
      ),
    );
  }

  void _reset() {
    setState(() {
      _won = null;
      _board!.reset();
    });
  }

  void _open(Field field) {
    if (_won != null) {
      return;
    }
    setState(() {
      try {
        field.openField();

        if (_board!.isSolved) {
          _won = true;
        }
      } on ExplosionException {
        _won = false;
        _board!.revealBomb();
      }
    });
  }

  void _mark(Field field) {
    if (_won != null) {
      return;
    }
    setState(() {
      field.switchMarking();

      if (_board!.isSolved) {
        _won = true;
      }
    });
  }

  Board _getBoard(double width, double height) {
    if (_board == null) {

      int gridsQt = 15;

      double fieldSize = width / gridsQt;

      int linesQt = (height / fieldSize).floor();

      _board = Board(
        linesQt: linesQt,
        gridsQt: gridsQt,
        bombsQt: linesQt
      ); 
    }
    return _board!;
  }
}
