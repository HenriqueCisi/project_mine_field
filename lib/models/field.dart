import 'package:project_mine_field/models/explosion_exception.dart';

class Field {
  final int line;
  final int grid;
  final List<Field> fields = [];

  bool _isOpen = false;
  bool _isMarked = false;
  bool _hasMine = false;
  bool _hasExploded = false;

  Field({required this.line, required this.grid});

  void addField(Field field) {
    final deltaLine = (line - field.line).abs();
    final deltaGrid = (grid - field.grid).abs();

    if (deltaLine == 0 && deltaGrid == 0) {
      return;
    }

    if (deltaLine <= 1 && deltaGrid <= 1) {
      fields.add(field);
    }

    if (isSafeToOpenNeighbor) {
      for (var neighbor in fields) {
        neighbor.openField();
      }
    }
  }

  void openField() {
    if (_isOpen) {
      return;
    }

    _isOpen = true;

    if (_hasMine) {
      _hasExploded = true;
      throw ExplosionException();
    }
  }

  bool get isSafeToOpenNeighbor {
    return fields.every((neighbor) => !neighbor._hasMine);
  }

  bool get hasMine {
    return _hasMine;
  }

  bool get hasExploded {
    return _hasExploded;
  }

  bool get isOpen {
    return _isOpen;
  }

  bool get isMarked {
    return _isMarked;
  }

  bool get isSolved {
    bool hasMineAndIsMarked = hasMine && isMarked;
    bool isSafeAndIsOpen = !hasMine && isOpen;

    return hasMineAndIsMarked || isSafeAndIsOpen;
  }

  int get mineCount {
    return fields.where((field) => field.hasMine).length;
  }

  void revealBomb() {
    if (_hasMine) {
      _isOpen = true;
    }
  }

  void setMine() {
    _hasMine = true;
  }

  void switchMarking() {
    _isMarked = !_isMarked;
  }

  void reset() {
    _isOpen = false;
    _isMarked = false;
    _hasMine = false;
    _hasExploded = false;
  }
}
