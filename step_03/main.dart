library phonecat;

import 'package:angular/angular.dart';
import 'package:logging/logging.dart';

@NgController(
  selector: '[phone-list]',
  publishAs: 'ctrl'
)
class PhoneListCtrl {
  List<Map> phones = [
    {'name': 'Nexus S',
     'snippet': 'Fast just got faster with Nexus S.'},
    {'name': 'Motorola XOOM™ with Wi-Fi',
     'snippet': 'The Next, Next Generation tablet.'},
    {'name': 'MOTOROLA XOOM™',
     'snippet': 'The Next, Next Generation tablet.'},
  ];
}

main() {
  Logger.root.level = Level.FINEST;
  Logger.root.onRecord.listen((LogRecord r) { print(r.message); });
  Module phoneCatModule = new Module()
    ..type(PhoneListCtrl);
  ngBootstrap(module: phoneCatModule);
}
