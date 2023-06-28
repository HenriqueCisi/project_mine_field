import 'package:flutter/widgets.dart';
import 'package:project_mine_field/components/field_widget.dart';
import 'package:project_mine_field/models/board.dart';
import 'package:project_mine_field/models/field.dart';

class BoardWidget extends StatelessWidget {
  final Board board;

  final void Function(Field) onOpenField;
  final void Function(Field) onSwitchMark;

  const BoardWidget(
      {required this.board,
      required this.onOpenField,
      required this.onSwitchMark,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: board.gridsQt,
        children: board.fields.map((element) {
          return FieldWidget(
              field: element,
              onOpenField: onOpenField,
              onSwitchMark: onSwitchMark);
        }).toList(),
      ),
    );
  }
}
