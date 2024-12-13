import 'package:flutter_eden/eden.dart';

abstract class EdenBaseListWidget<T extends EdenBaseListController>
    extends EdenBaseWidget<T> {
  EdenBaseListWidget({super.key});

  ///body view
  Widget buildListView(BuildContext context, T controller);

  ///topView
  Widget renderHeadView(BuildContext context) {
    return Container();
  }

  @override
  Widget buildBody(BuildContext context, T controller) {
    return Column(
      children: [
        renderHeadView(context), //topView

        Expanded(
          child: SmartRefresher(
            enablePullDown: controller.enablePull,
            enablePullUp: controller.isNext(),
            controller: controller.refreshController,
            onRefresh: () {
              controller.onRefresh();
            },
            onLoading: () {
              controller.onLoading();
            },
            primary: false,
            child: buildListView(context, controller),
          ),
        ),
      ],
    );
  }
}
