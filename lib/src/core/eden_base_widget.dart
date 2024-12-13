import 'package:flutter_eden/eden.dart';

abstract class EdenBaseWidget<T extends EdenBaseController> extends GetView<T> {
  EdenBaseWidget({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState>? getScaffoldKey() => _scaffoldKey;

  ///hide toolbar
  @protected
  bool hideToolbar() {
    return false;
  }

  /// hide toolbar arrow
  @protected
  bool hideToolbarArrowBack() {
    return false;
  }

  ///tool title
  @protected
  String toolbarTitle() {
    return "";
  }

  @protected
  Color? toolbarTitleColor() => null;
  @protected
  Color? toolbarBackgroundColor() => null;
  @protected
  IconThemeData? iconTheme() => null;
  @protected
  IconThemeData? actionsIconTheme() => null;
  @protected
  bool? resizeToAvoidBottomInset() => null;
  @protected
  List<Widget>? toolbarActions() {
    return [];
  }

  @protected
  Widget? toolbarLeading() => null;
  @protected
  double? leadingWidth() => null;
  @protected
  double? toolbarHeight() => null;

  ///toolbar arrow back
  @protected
  Widget toolbarArrowBack() {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {},
    );
  }

  ///
  @protected
  PreferredSizeWidget? appToolbar(BuildContext context) {
    return hideToolbar()
        ? null
        : ToolbarWidget(
            centerTitle: true,
            backgroundColor: toolbarBackgroundColor(),
            hideBackArrow: hideToolbarArrowBack(),
            iconTheme: iconTheme(),
            actionsIconTheme: actionsIconTheme(),
            title: toolbarTitle(),
            color: toolbarTitleColor(),
            leading: toolbarLeading(),
            leadingWidth: leadingWidth(),
            toolbarHeight: toolbarHeight(),
            actions: toolbarActions(),
          );
  }

  ///build body
  @protected
  Widget buildBody(BuildContext context, T controller);

  ///bottom navigation bar
  @protected
  Widget? bottomNavigationBar() => null;
  @protected
  Widget? floatingActionButton() => null;
  Widget? endDrawer() => null;

  ///
  void openEndDrawer() {
    _scaffoldKey.currentState?.openEndDrawer();
  }

  ///
  void closeEndDrawer() {
    _scaffoldKey.currentState?.closeEndDrawer();
  }

  bool endDrawerEnableOpenDragGesture() {
    return true;
  }

  void onEndDrawerChanged(bool changed) {}
  void onDrawerChanged(bool changed) {}
  void onInitState(GetBuilderState<T> state) {}
  void onDispose(GetBuilderState<T> dispose) {}
  void didChangeDependencies(GetBuilderState<T> dispose) {}
  void didUpdateWidget(
      GetBuilder<GetxController> controller, GetBuilderState<T> state) {}

  @override
  Widget build(BuildContext context) {
    return GetBuilder<T>(
        init: controller,
        initState: onInitState,
        dispose: onDispose,
        didChangeDependencies: didChangeDependencies,
        didUpdateWidget: didUpdateWidget,
        builder: (controller) {
          return Scaffold(
            key: _scaffoldKey,
            resizeToAvoidBottomInset: resizeToAvoidBottomInset(),
            appBar: appToolbar(context),
            body: buildBody(context, controller),
            endDrawer: endDrawer(),
            onEndDrawerChanged: onEndDrawerChanged,
            onDrawerChanged: onDrawerChanged,
            endDrawerEnableOpenDragGesture: endDrawerEnableOpenDragGesture(),
            floatingActionButton: floatingActionButton(),
            bottomNavigationBar: bottomNavigationBar(),
          );
        });
  }
}
