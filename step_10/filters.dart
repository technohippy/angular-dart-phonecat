library phonecat_filter;

import 'package:angular/angular.dart';

@NgFilter(name: 'checkmark')
class PhonecatCheckmarkFilter {
  call(value) {
    return (value != null) && value ? '\u2713' : '\u2718';
  }
}
