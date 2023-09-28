import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:colornames/src/color_value_vo.dart';
import 'color_names_list.dart';

/// Abstract Class
abstract class ColorNames {
  /// Guess a name for the given [color]. returns [String].
  /// If name is not found then "Color_{Hex8}" value is returned
  static String guess(Color color) {
    final curColor = ColorValueVo(Color(0xFF000000 | color.value));
    if (ColorNamesList.namesMap.containsKey(curColor)) {
      //exact match
      return ColorNamesList.namesMap[curColor]!;
    }

    num curDiff = 0;
    ColorValueVo? foundColor;
    num diff = -1;

    ColorNamesList.namesMap.keys.forEach((ColorValueVo c) {
      curDiff = curColor.getDistance(c);
      if (diff < 0 || diff > curDiff) {
        diff = curDiff;
        foundColor = c;
      }
    });
    if (foundColor != null) return ColorNamesList.namesMap[foundColor]!;
    return "Color_${color.value.toRadixString(16)}";
  }

  static Color getColorByName(String name) {
    var code = ColorNamesList.intMap.keys.firstWhere(
      (k) => ColorNamesList.intMap[k] == name,
      orElse: () {
        // Did not find it in the map.  Maybe it is a hex code?
        if (RegExp(r'^(0x)?[0-9a-fA-F]{6,8}$').hasMatch(name)) {
          var c = Color(int.parse(name));
          if (RegExp(r'(0x)?[0-9a-fA-F]{6}$').hasMatch(name)) {
            // Alpha was unspecified, which Dart will take to mean 0% opacity.
            // This is incredibly stupid.  Any sane implementation would treat
            // it as 100% opacity.
            c = c.withOpacity(1.0);
          }
          return c.value;
        } else {
          // I'm going to *not* throw an exception here, even though that is probably the right thing to do.
          //throw FormatException("The specified color $name did not match any known colors.");
          // Instead, I'm going to log a warning and return black as the default color.
          debugPrint("The specified color $name did not match any known colors. I'm going to substitute black and keep on trucking.");
          return Colors.black.value;
        }
    });
    
    return Color(code);
  }
}
