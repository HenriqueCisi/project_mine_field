import 'package:flutter_test/flutter_test.dart';
import 'package:project_mine_field/models/board.dart';

void main() {
  group('board', () {
    test('game won', () {
      Board testBoard = Board(linesQt: 2, gridsQt: 2, bombsQt: 0);

      testBoard.fields[0].setMine;
      testBoard.fields[3].setMine;

      testBoard.fields[0].switchMarking();
      testBoard.fields[1].openField();
      testBoard.fields[2].openField();
      testBoard.fields[3].switchMarking();

      expect(testBoard.isSolved, isTrue);
    });
  });
}
