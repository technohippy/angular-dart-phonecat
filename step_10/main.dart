library phonecat;

import 'package:angular/angular.dart';
import 'package:angular/routing/module.dart';
import 'package:di/di.dart';
import 'package:logging/logging.dart';

part 'controllers.dart';
part 'filters.dart';

class PhonecatAppModule extends Module {
  PhonecatAppModule() {
    type(PhoneListCtrl);
    type(PhoneDetailCtrl);
    type(PhonecatCheckmarkFilter);
    value(RouteInitializerFn, phonecatRouteInitializer);
    factory(NgRoutingUsePushState,
        (_) => new NgRoutingUsePushState.value(false));
  }
}

phonecatRouteInitializer(Router router, RouteViewFactory views) =>
    views.configure({
      'phone-detail': ngRoute(
          path: '/phones/:phoneId',
          view: 'partials/phone-detail.html'
          ),
      'phone-list': ngRoute(
          defaultRoute: true,
          path: '/phones',
          view: 'partials/phone-list.html'
          )
    });

main() {
  Logger.root.level = Level.FINEST;
  Logger.root.onRecord.listen((LogRecord r) { print(r.message); });
  ngBootstrap(module: new PhonecatAppModule());
}
