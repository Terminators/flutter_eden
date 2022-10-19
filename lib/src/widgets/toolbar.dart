import 'package:flutter_eden/eden.dart';

class ToolbarWidget extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  final Widget? leading;
  final String? title;
  final List<Widget>? actions;
  final Color? color;
  final double? elevation;
  final bool? logoWidget;
  final bool? hideBackArrow;
  final bool? centerTitle;
  final Color? backgroundColor;

  const ToolbarWidget({
    Key? key,
    this.hideBackArrow,
    this.centerTitle,
    this.logoWidget,
    this.leading,
    this.title,
    this.actions,
    this.color,
    this.backgroundColor,
    this.elevation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: hideBackArrow == true ? false : true,
      centerTitle: centerTitle,
      backgroundColor: backgroundColor,
      title: logoWidget == true
          ? const Center(child: LogoWidget(header: true, small: true))
          : TextWidget(
              text: title,
              color: color,
            ),
      leading: leading,
      actions: actions,
      elevation: elevation ?? 0.0,
    );
  }
}
