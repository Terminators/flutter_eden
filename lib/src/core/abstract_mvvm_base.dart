import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eden/eden.dart';
import 'package:flutter_eden/src/core/stream_base.dart';
import 'package:rxdart/rxdart.dart';

///
abstract class AbstractMvvmBase extends StatefulWidget {
  const AbstractMvvmBase({Key key}) : super(key: key);
}

///
abstract class AbstractMvvmBaseState<T extends AbstractMvvmBase>
    extends State<T> {
  final Key _scaffoldKey = GlobalKey<ScaffoldState>();
  String _toolbarTitle;

  ///hide toolbar
  bool getHideToolbar();

  /// hide toolbar arrow
  bool getHideToolbarArrowBack();

  ///tool title
  String getToolbarTitle();

  /// toolbar title color
  Color getToolbarTitleColor() =>
      Theme.of(context).colorScheme.toolbarTitleColor;

  void setToolbarTitle(String toolbarTitle) {
    this._toolbarTitle = toolbarTitle;
    if (mounted) setState(() {});
  }

  ///toolbar arrow back
  Widget getToolbarArrowBack() {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        pop(context);
      },
    );
  }

  ///
  Widget getAppbar() {
    return getHideToolbar()
        ? null
        : ToolbarWidget(
            hideBackArrow: getHideToolbarArrowBack(),
            title: _toolbarTitle == null ? getToolbarTitle() : _toolbarTitle,
            color: getToolbarTitleColor(),
          );
  }

  ///
  Key getScaffoldKey() => _scaffoldKey;

  ///build body
  Widget buildBody(BuildContext context);

  ///bottom navigation bar
  Widget getBottomNavigationBar() {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: getAppbar(),
      //safe Area
      body:  getBottomNavigationBar() == null
          ? SafeArea(
        child: buildBody(context),
      )
          : buildBody(context),
      bottomNavigationBar: getBottomNavigationBar(),
    );
  }


  void pop(context) {
    Navigator.pop(context);
  }

  void popResult(context, Object value) {
    Navigator.pop(context, value);
  }
}
