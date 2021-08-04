# Color Names

Get a name for given Color

See working [Online Demo](https://apps.thexaib.com/colornames)
## Getting Started
Follow instruction for [Installation](https://pub.dev/packages/colornames/install).

Import the package:
```
import 'package:colornames/colornames.dart' 
```

## Usage
Provide a Color to `ColorNames.guess(color)` or use extension method on color or `int`.
```
final color = Color(0xFFFFFF);
ColorNames.guess(color) ; // White
color.colorName; // White

final int colorValue = 128;
colorValue.colorName; // Navy Blue
0x007fff.colorName;// Azure
```