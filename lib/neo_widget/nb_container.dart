import 'dart:math';
import 'package:flutter/material.dart';
import 'neo_settings.dart';

class NeoContainer extends StatefulWidget {
  /// A customizable neobrutalist-style Container, allowing
  /// user to experiment freely without any restriction in functionality.
  /// This button is built using Flutter's `Material` widget, and is designed to
  /// follow the Neubrutalism UI style guidelines.
  /// *[Constants]
  ///  - const neoBlack = Colors.black;
  /// - const neoDefault1 = Colors.teal;
  /// - const neoShadow = Color(0xFF080808);
  /// - const neoBorder = 3.0;
  /// - const neoShadowBlurRadius = 0.0;
  /// - const neoOffset = Offset(4, 4);
  /// - const neoBlurStyle = BlurStyle.solid;

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
    this.foregroundDecoration,
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

  /// - height (optional): A double that defines the height of the container.
  /// By default, it is set to null.
  /// If the height is set to null, the height will be determined by the child widget.
  /// If the child is null, the height will be set to 25.
  /// If the child is not null, the height will be set to the height of the child widget.

  final double? height;

  /// - width (optional): A double that defines the width of the container.
  /// By default, it is set to null.
  /// If the width is set to null, the width will be determined by the child widget.
  ///
  /// If the width is set to null, the width will be determined by the child widget.
  /// If the child is null, the width will be set to 25.

  final double? width;

  /// - borderWidth (optional): A double that defines the width of the border of the container.
  /// By default, it is set to neoBorder.
  /// If the borderWidth is set to null, the border will not be displayed.

  final double borderWidth;

  /// - shadowBlurRadius (optional): A double that defines the blur radius of the shadow of the container.
  /// By default, it is set to neoShadowBlurRadius.

  final double shadowBlurRadius;

  /// - shadowBlurStyle (optional): A BlurStyle that defines the style of the shadow of the container.
  /// By default, it is set to neoBlurStyle.
  /// The value can be BlurStyle.solid or BlurStyle.outer.

  final BlurStyle shadowBlurStyle;

  /// - child (optional): A Widget that defines the child of the container.
  /// By default, it is set to null.
  /// If the child is set to null, the container will be empty.

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

  /// - foregroundDecoration (optional): A BoxDecoration that defines the foregroundDecoration of the container.
  /// By default, it is set to null.
  ///
  final BoxDecoration? foregroundDecoration;

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
  NeoContainerState createState() => NeoContainerState();
}

class NeoContainerState extends State<NeoContainer> {
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
          blurRadius: widget.shadowBlurRadius,
          spreadRadius: 0,
          blurStyle: widget.shadowBlurStyle,
        ),
      ],
    );
    return (widget.rotation == null)
        ? _NeoContainer(widget: widget, decoration: decoration)
        : Transform(
            origin: Offset((widget.width ?? 25) / 2, (widget.height ?? 25) / 2),
            transform: Matrix4.rotationZ(widget.rotation!),
            child: _NeoContainer(widget: widget, decoration: decoration));
  }
}

class _NeoContainer extends StatelessWidget {
  const _NeoContainer({
    required this.widget,
    required this.decoration,
  });

  final NeoContainer widget;
  final BoxDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    //adjust the offset based on the rotation if it is set
    Offset localOffset = widget.offset;
    if (widget.rotation != null) {
      double rotatedOffsetY = (widget.offset.dx * cos(widget.rotation!)) -
          (widget.offset.dy * sin(widget.rotation!));
      double rotatedOffsetX = (widget.offset.dx * sin(widget.rotation!)) +
          (widget.offset.dx * cos(widget.rotation!));
      localOffset = Offset(rotatedOffsetX, rotatedOffsetY);
    }

    return Container(
      padding: widget.padding,
      alignment: widget.alignment,
      foregroundDecoration: widget.foregroundDecoration,
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
                  offset: Offset(localOffset.dx, localOffset.dy),
                  blurRadius: widget.shadowBlurRadius,
                  blurStyle: widget.shadowBlurStyle,
                ),
              ],
            )
          : decoration,
      child: SizedBox(
          width: widget.width ?? 25,
          height: widget.height ?? 25,
          child: widget.child),
    );
  }
}
