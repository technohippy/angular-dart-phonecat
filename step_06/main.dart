library phonecat;

import 'package:angular/angular.dart';
import 'package:logging/logging.dart';

@NgController(
  selector: '[phone-list]',
  publishAs: 'ctrl',
  map: const {
    'phones': '=>phones'
  }
)
class PhoneListCtrl {
  Http _http;

  List<Map> phones = [];
  String orderProp = 'age';

  PhoneListCtrl(this._http) {
    this._http.get("./phones/phones.json").then((resp) {
      print(resp.data);
      this.phones = resp.data;
    });
  }
}

main() {
  Logger.root.level = Level.FINEST;
  Logger.root.onRecord.listen((LogRecord r) { print(r.message); });
  Module phoneCatModule = new Module()
    ..type(PhoneListCtrl);
  ngBootstrap(module: phoneCatModule);
}