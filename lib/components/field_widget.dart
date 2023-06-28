import 'package:flutter/material.dart';
import 'package:project_mine_field/models/field.dart';

class FieldWidget extends StatelessWidget {
  final Field field;
  final void Function(Field) onOpenField;
  final void Function(Field) onSwitchMark;

  const FieldWidget(
      {required this.field,
      required this.onOpenField,
      required this.onSwitchMark,
      super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onOpenField(field),
      onLongPress: () => onSwitchMark(field),
      child: _getImage(),
    );
  }

  Widget _getImage(){
    int mineCount = field.mineCount;

    if(field.isOpen && field.hasMine && field.hasExploded){
      return Image.asset('assets/images/bomba_0.jpeg');
    }
    else if (field.isOpen && field.hasMine) {
      return Image.asset('assets/images/bomba_1.jpeg');
    }
    else if (field.isOpen) {
      return Image.asset('assets/images/aberto_$mineCount.jpeg');
    }
    else if (field.isMarked) {
      return Image.asset('assets/images/bandeira.jpeg');
    }
    else{
       return Image.asset('assets/images/fechado.jpeg');
    }
  }
}
