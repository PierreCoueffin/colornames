import 'package:colornames/src/color_names.dart';
import 'package:colornames/src/color_names_list.dart';
import 'package:flutter/painting.dart';

extension ColorNamesForColor on Color {
  /// Guess a name for the  [color].
  /// If name is not found then "Color_{Hex8}" value is returned
  /// returns [String].
  String get colorName => ColorNames.guess(this);
}

extension ColorNamesForInt on int {
  /// Guess a name for this [int] as [color] value.
  /// If name is not found then "Color_{Hex8}" value is returned
  /// returns [String].
  String get colorName {
    return ColorNames.guess(Color(this));
  }
}

extension ColorByNameForString on String {
  Color get getColor => ColorNamesList.namesMap.keys.firstWhere(
    (k) => ColorNamesList.namesMap[k] == this,
    orElse: () => null);
}
