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
    type(RouteInitializer, implementedBy: PhonecatRouteInitializer);
    factory(NgRoutingUsePushState,
        (_) => new NgRoutingUsePushState.value(false));
  }
}

class PhonecatRouteInitializer implements RouteInitializer {
  init(Router router, ViewFactory view) {
    router.root
    ..addRoute(
        name:'phone-detail', 
        path:'/phones/:phoneId', 
        enter:view('partials/phone-detail.html'))
    ..addRoute(
        defaultRoute: true,
        name:'phone-list', 
        path:'/phones', 
        enter:view('partials/phone-list.html'));
  }
}

main() {
  Logger.root.level = Level.FINEST;
  Logger.root.onRecord.listen((LogRecord r) { print(r.message); });
  ngBootstrap(module: new PhonecatAppModule());
}
