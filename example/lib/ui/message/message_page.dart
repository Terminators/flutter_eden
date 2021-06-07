import 'package:example/ui/message/message_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_eden/eden.dart';

class MessagePage extends AbstractMvvmStreamBase {
  @override
  State<StatefulWidget> createState() => _MessagePageState();
}

class _MessagePageState extends AbstractMvvmStreamBaseState<MessagePage>
    with MessageWidget {
  @override
  bool getHideToolbar() {
    return false;
  }

  @override
  bool getHideToolbarArrowBack() {
    return false;
  }

  @override
  Stream getStream() {
    return null;
  }

  @override
  String getToolbarTitle() {
    return "Message";
  }

  @override
  Widget buildBody(BuildContext context) {

    return Center(
      child: TextWidget(text: "Message"),
    );
  }
}