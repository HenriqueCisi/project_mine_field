import 'package:flutter_test/flutter_test.dart';
import 'package:project_mine_field/models/field.dart';

void main() {
  group('field', () {
    test('open field with mine', () {
      Field testField = Field(line: 0, grid: 0);

      testField.setMine();

      expect(testField.openField, throwsException);
    });

    test('open field without mine', () {
      Field testField = Field(line: 0, grid: 0);

      testField.openField;

      expect(testField.hasMine, isFalse);
    });

    test('add not neighbor', () {
      Field testField = Field(line: 0, grid: 0);
      Field testField2 = Field(line: 1, grid: 3);

      testField.addField(testField2);

      expect(testField.fields.isEmpty, true);
    });

    test('add neighbor', () {
      Field testField = Field(line: 3, grid: 3);
      Field testField2 = Field(line: 3, grid: 4);
      Field testField3 = Field(line: 2, grid: 2);
      Field testField4 = Field(line: 4, grid: 4);

      testField.addField(testField2);
      testField.addField(testField3);
      testField.addField(testField4);

      expect(testField.fields.length, 3);
    });
  });
}
