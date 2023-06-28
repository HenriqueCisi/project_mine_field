import 'package:flutter/material.dart';
import 'package:project_mine_field/components/field_widget.dart';
import 'package:project_mine_field/components/result_widget.dart';
import 'package:project_mine_field/models/field.dart';

class MineFieldApp extends StatelessWidget {
  const MineFieldApp({super.key});

  @override
  Widget build(BuildContext context) {

    Field field = Field(line: 0, grid: 0);

    return MaterialApp(
      home: Scaffold(
      appBar: ResultWidget(won:true, onReset: _reset),
      body: FieldWidget(field: field, onOpenField: _open, onSwitchMark: _mark)
      ,)
      ,
    );
  }

  void _reset(){
    print('reset');
  }

  void _open(Field field) {
    print('open');
  }

  void _mark(Field field) {
    print('mark');
  }

}