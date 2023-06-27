import 'dart:math';

import 'package:project_mine_field/models/field.dart';

class Board {
  final int linesQt;
  final int gridsQt;
  final int bombsQt;

  final List<Field> _fields = [];

  Board({
    required this.linesQt,
    required this.gridsQt,
    required this.bombsQt,
  }) {
    _createBoard();
    _relateNeighbors();
    _sortMines();
  }

  void _createBoard() {
    for (var line = 0; line < linesQt; line++) {
      for (var grid = 0; grid < gridsQt; grid++) {
        _fields.add(Field(line: line, grid: grid));
      }
    }
  }

  void _relateNeighbors() {
    for (var field in _fields) {
      for (var neighbor in _fields) {
        field.addField(neighbor);
      }
    }
  }

  void _sortMines() {
    int qt = 0;

    if (bombsQt < linesQt * gridsQt) {
      return;
    }

    while (qt < bombsQt) {
      int i = Random().nextInt(_fields.length);

      if (!_fields[i].hasMine) {
        qt++;
        _fields[i].setMine();
      }
    }
  }

  void reset() {
    for (var element in _fields) {
      element.reset();
    }

    _sortMines();
  }

  void revealBomb() {
    for (var field in _fields) {
      field.revealBomb();
    }
  }

  List<Field> get fields {
    return _fields;
  }

  bool get isSolved {
    return _fields.every((element) => element.isSolved);
  }
}
