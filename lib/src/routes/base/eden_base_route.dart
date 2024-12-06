import 'package:get/get.dart';

import 'base_route.dart';

///base route
abstract class EdenBaseRoute implements BaseRoute {
  ///
  GetPage routePage<T>({
    required String name,
    required GetPageBuilder page,
    required Function bindingsBuilder,
    List<Bindings>? bindings,
    bool? preventDuplicates,
    List<GetMiddleware>? middlewares,
    List<GetPage<dynamic>>? children,
    Transition? transition,
    Duration? transitionDuration,
  }) {
    return GetPage<T>(
        name: name,
        page: page,
        preventDuplicates: preventDuplicates ?? true,
        binding: BindingsBuilder(() {
          bindingsBuilder();
        }),
        bindings: bindings ?? [],
        middlewares: middlewares,
        children: children ?? [],
        transition: transition ?? Transition.rightToLeft,
        transitionDuration: transitionDuration);
  }

  S edenFind<S>({String? tag}) => Get.find<S>(tag: tag);

  ///
  void edenLazyPut<S>(InstanceBuilderCallback<S> builder,
      {String? tag, bool fenix = false}) {
    Get.lazyPut<S>(builder, tag: tag, fenix: fenix);
  }
}
