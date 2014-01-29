library phonecat;

import 'package:angular/angular.dart';
import 'package:angular/routing/module.dart';
import 'package:di/di.dart';
import 'package:logging/logging.dart';

part 'controllers.dart';
part 'filters.dart';
part 'services.dart';

class PhonecatAppModule extends Module {
  PhonecatAppModule() {
    type(PhoneListCtrl);
    type(PhoneDetailCtrl);
    type(PhonecatCheckmarkFilter);
    type(PhonecatService);
    type(RouteInitializer, implementedBy: PhonecatRouteInitializer);
    factory(NgRoutingUsePushState,
        (_) => new NgRoutingUsePushState.value(false));
  }
}

class PhonecatRouteInitializer implements RouteInitializer {
  init(Router router, ViewFactory view) {
    // ！！注！！
    // routeは前から順に比較されるので、下記のaddRouteを入れ替えると動きません
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
