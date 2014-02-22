part of phonecat;

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
      this.phones = resp.data;
    });
  }
}

@NgController(
  selector: '[phone-detail]',
  publishAs: 'ctrl',
  map: const {
    'phoneId': '=>phoneId'
  }
)
class PhoneDetailCtrl {
  String phoneId;

  PhoneDetailCtrl(RouteProvider routeProvider) {
    this.phoneId = routeProvider.parameters['phoneId'];
  }
}
