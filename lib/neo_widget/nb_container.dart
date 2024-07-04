import 'package:flutter/material.dart';
import 'neo_settings.dart';

class NeoContainer extends StatefulWidget {
  /// A customizable neobrutalist-style Container Template, allowing
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

  const NeoContainer({
    super.key,
    this.offset = neoOffset,
    this.color = neoDefault1,
    this.shadowColor = neoShadow,
    this.borderColor = neoBlack,
    this.height,
    this.width,
    this.borderWidth = neoBorder,
    this.shadowBlurRadius = neoShadowBlurRadius,
    this.shadowBlurStyle = neoBlurStyle,
    this.child,
    this.borderRadius,
    this.borderStyle,
    this.boxShape,
    this.padding,
    this.alignment,
    this.forgroundDecoration,
    this.rotation,
    this.decoration,
  });

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

  final Offset offset;

  /// - color (optional): A Color that defines the background color of the container.
  ///
  /// By default, it is set to neoDefault1.

  final Color? color;

  /// - shadowColor (optional): A Color that defines the color of the shadow of the container.
  ///
  /// By default, it is set to neoShadow.

  final Color shadowColor;

  /// - borderColor (optional): A Color that defines the color of the border of the container.
  ///
  /// By default, it is set to neoBlack.

  final Color borderColor;
  final double? height;
  final double? width;
  final double borderWidth;
  final double shadowBlurRadius;
  final BlurStyle shadowBlurStyle;
  final Widget? child;

  /// - borderRadius (optional): A BorderRadius that defines the radius of the container.
  /// By default, it is set to null.
  /// If the boxShape is set to BoxShape.circle, the borderRadius will be ignored.
  /// If the boxShape is set to BoxShape.rectangle, the borderRadius will be used.
  /// If the boxShape is set to null, the borderRadius will be used.
  final BorderRadius? borderRadius;

  /// - padding (optional): An EdgeInsetsGeometry that defines the padding of the container.
  /// By default, it is set to null.

  final EdgeInsetsGeometry? padding;

  /// - alignment (optional): An AlignmentGeometry that defines the alignment of the container.
  /// By default, it is set to null.
  ///
  final AlignmentGeometry? alignment;

  /// - forgroundDecoration (optional): A BoxDecoration that defines the forgroundDecoration of the container.
  /// By default, it is set to null.
  ///
  final BoxDecoration? forgroundDecoration;

  /// - rotation (optional): A double that defines the rotation of the container.
  /// By default, it is set to null.
  /// The value is in radians.
  /// The rotation is applied to the container before the transformation.
  final double? rotation;

  /// - decoration (optional): A BoxDecoration that defines the decoration of the container.
  /// By default, it is set to null.
  /// If the decoration is set, the other properties will be ignored.
  final BoxDecoration? decoration;

  @override
  // ignore: library_private_types_in_public_api
  _NeoContainerState createState() => _NeoContainerState();
}

class _NeoContainerState extends State<NeoContainer> {
  @override
  Widget build(BuildContext context) {
    BoxDecoration? decoration = widget.decoration;
    decoration = BoxDecoration(
      shape: widget.boxShape ?? BoxShape.rectangle,
      color: decoration?.color ?? widget.color,
      borderRadius: decoration?.borderRadius ??
          ((widget.boxShape != null && widget.borderRadius != null)
              ? null
              : widget.borderRadius),
      border: (decoration?.border == null)
          ? Border.all(
              style: widget.borderStyle ?? BorderStyle.solid,
              color: widget.borderColor,
              width: widget.borderWidth,
            )
          : decoration?.border,
      boxShadow: [
        BoxShadow(
          color: widget.shadowColor,
          offset: widget.offset,
          blurRadius: widget.shadowBlurRadius,
          spreadRadius: 0,
          blurStyle: widget.shadowBlurStyle,
        ),
      ],
    );
    return (widget.rotation == null)
        ? neoContainer(widget: widget, decoration: decoration)
        : Transform(
            origin: Offset(widget.width! / 2, widget.height! / 2),
            transform: Matrix4.rotationZ(widget.rotation!),
            child: neoContainer(widget: widget, decoration: decoration));
  }
}

class neoContainer extends StatelessWidget {
  const neoContainer({
    super.key,
    required this.widget,
    required this.decoration,
  });

  final NeoContainer widget;
  final BoxDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding,
      alignment: widget.alignment,
      foregroundDecoration: widget.forgroundDecoration,
      height: widget.height,
      width: widget.width,
      decoration: (widget.decoration == null)
          ? BoxDecoration(
              shape: widget.boxShape ?? BoxShape.rectangle,
              color: widget.color,
              borderRadius:
                  (widget.boxShape != null && widget.borderRadius != null)
                      ? null
                      : widget.borderRadius,
              border: Border.all(
                style: widget.borderStyle ?? BorderStyle.solid,
                color: widget.borderColor,
                width: widget.borderWidth,
              ),
              boxShadow: [
                BoxShadow(
                  color: widget.shadowColor,
                  offset: widget.offset,
                  blurRadius: widget.shadowBlurRadius,
                  spreadRadius: 0,
                  blurStyle: widget.shadowBlurStyle,
                ),
              ],
            )
          : decoration,
      child: widget.child,
    );
  }
}
