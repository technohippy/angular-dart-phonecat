part of phonecat;

@NgController(
  selector: '[phone-list]',
  publishAs: 'ctrl',
  map: const {
    'phones': '=>phones'
  }
)
class PhoneListCtrl {
  PhonecatService _phonecatService;

  List<Map> phones = [];
  String orderProp = 'age';

  PhoneListCtrl(PhonecatService this._phonecatService) {
    this._phonecatService.query().then(
        (List<Map> phones) {
          this.phones = phones;
        }
    );
  }
}

@NgController(
  selector: '[phone-detail]',
  publishAs: 'ctrl',
  map: const {
    'phone': '=>phone',
    'mainImageUrl': '@mainImageUrl'
  }
)
class PhoneDetailCtrl {
  PhonecatService _phonecatService;
  Map phone;
  String mainImageUrl;

  PhoneDetailCtrl(RouteProvider routeProvider, PhonecatService this._phonecatService) {
    String phoneId = routeProvider.parameters['phoneId'];
    _phonecatService.getByPhoneId(phoneId).then(
        (Map phone) {
          this.phone = phone;
          this.mainImageUrl = phone['images'][0];
        }
    );
  }
  
  set image(imageUrl) => mainImageUrl = imageUrl;
}
