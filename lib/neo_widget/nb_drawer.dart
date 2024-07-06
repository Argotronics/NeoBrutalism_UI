import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rentals/neo_widget/neo_settings.dart';

class NeoDrawer extends StatefulWidget {
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

  const NeoDrawer({
    super.key,
    this.offset,
    this.borderStyle,
    this.children,
    this.shadowBlurRadius,
    this.shadowBlurStyle,
    this.selectedIndex,
    this.onDestinationSelected,
  });

  /// - children (required): A list of Widgets that are displayed as destinations in the drawer.
  /// The children are displayed in the order they are provided.

  final List<Widget>? children;

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

  final Offset? offset;

  /// - onDestinationSelected (optional): A function that is called when a destination is selected.
  ///  The function is passed the index of the selected destination.
  /// If the function is null, the destinations will not be selectable.
  /// By default, it is set to null.

  final void Function(int index)? onDestinationSelected;

  /// - shadowBlurRadius (optional): A double that defines the blur radius of the shadow of the container.
  /// By default, it is set to 0.0.

  final double? shadowBlurRadius;

  /// - shadowBlurStyle (optional): A BlurStyle that defines the style of the shadow of the container.
  /// By default, it is set to neoBlurStyle.

  final BlurStyle? shadowBlurStyle;

  /// - selectedIndex (optional): An int that defines the index of the selected destination.
  /// By default, it is set to null.
  /// If the selectedIndex is null, no destination will be selected.
  /// If the selectedIndex is not null, the destination at the selectedIndex will be selected.
  /// If the selectedIndex is greater than the number of destinations, no destination will be selected.
  /// If the selectedIndex is less than 0, no destination will be selected.
  /// If the selectedIndex is equal to 0, the first destination will be selected.
  /// If the selectedIndex is equal to 1, the second destination will be selected.

  final int? selectedIndex;

  @override
  _NBDrawerState createState() => _NBDrawerState();
}

class _NBDrawerState extends State<NeoDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: Colors.black,
          width: 3,
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: widget.shadowBlurRadius ?? 0.0,
            offset: widget.offset ?? neoOffset,
            blurStyle: widget.shadowBlurStyle ?? neoBlurStyle,
          ),
        ],
      ),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(22),
          clipBehavior: Clip.antiAlias,
          child: NavigationDrawer(
              surfaceTintColor: Colors.grey,
              onDestinationSelected: (index) {
                if (widget.onDestinationSelected != null) {
                  widget.onDestinationSelected!(index);
                }
              },
              indicatorColor: Colors.amber,
              selectedIndex: widget.selectedIndex,
              backgroundColor: Color.fromARGB(194, 162, 32, 32),
              children: widget.children ?? [])),
    );
  }
}
