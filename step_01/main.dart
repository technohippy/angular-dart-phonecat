library phonecat;

import 'package:angular/angular.dart';
import 'package:logging/logging.dart';

main() {
  Logger.root.level = Level.FINEST;
  Logger.root.onRecord.listen((LogRecord r) { print(r.message); });
  ngBootstrap();
}
