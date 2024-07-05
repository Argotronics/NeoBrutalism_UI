import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rentals/neo_widget/neo_settings.dart';

class NBDrawer extends StatefulWidget {
  /// A customizable neobrutalist-style Drawer Template, allowing
  /// user to experiment freely without any restriction in functionality.
  ///
  /// This button is built using Flutter's `Material` widget, and is designed to
  /// follow the Neubrutalism UI style guidelines.
  ///
  /// *[Constants]

  ///   - const neuBlack = Colors.black;
  ///   - const neuDefault1 = Colors.teal;
  ///   - const neuShadow = Color(0xFF080808);
  ///
  ///   - const neuBorder = 3.0;
  ///   - const neuShadowBlurRadius = 0.0;
  ///
  ///   - const neuOffset = Offset(4, 4);
  ///   - const neuBlurStyle = BlurStyle.solid;

  const NBDrawer({
    super.key,
    this.offset = neoOffset,
    this.borderStyle,
    this.boxShape,
    this.children,
  });
  final List<Widget>? children;

  final BoxShape? boxShape;

  /// - borderStyle (optional): A BorderStyle that defines the style of the border of the container.
  ///
  /// By default, it is set to BorderStyle.solid.
  ///
  /// if the boxShape is set to BoxShape.circle, the borderStyle will be ignored.
  /// if the boxShape is set to BoxShape.rectangle, the borderStyle will be used.
  /// if the boxShape is set to null, the borderStyle will be used.

  final BorderStyle? borderStyle;

  /// - offset (optional): An Offset that defines the position of the shadow of the container.
  ///
  /// By default, it is set to neoOffset.
  ///  - offset (optional): An Offset that defines the position of the shadow of the container.

  final Offset offset;

  get borderRadius => null;

  get borderColor => null;

  get borderWidth => null;

  get shadowColor => null;

  get shadowBlurRadius => null;

  get shadowBlurStyle => null;

  get child => null;

  @override
  _NBDrawerState createState() => _NBDrawerState();
}

class _NBDrawerState extends State<NBDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: Colors.black,
          width: 3,
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: widget.shadowBlurRadius ?? 0.0,
            offset: neoOffset,
            spreadRadius: 0.0,
            blurStyle: widget.shadowBlurStyle ?? neoBlurStyle,
          ),
        ],
      ),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(22),
          clipBehavior: Clip.antiAlias,
          child: NavigationDrawer(
              backgroundColor: Colors.transparent,
              children: widget.children ?? [])),
    );
  }
}
