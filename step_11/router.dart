library phonecat;

import 'package:angular/angular.dart';

class PhonecatRouteInitializer implements RouteInitializer {
  init(Router router, ViewFactory view) {
    router.root
      ..addRoute(
          defaultRoute: true,
          name:'phones', 
          path:'/phones', 
          enter:view('partials/phone-list.html'))
      ..addRoute(
          name:'phone', 
          path:'/phone/:phoneId', 
          enter:view('partials/phone-detail.html'));
  }
}
