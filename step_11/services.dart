part of phonecat;

class PhonecatService {
  Http _http;
  
  PhonecatService(this._http);
  
  query() {
    return this._http.get("./phones/phones.json").then((resp) {
      return resp.data;
    });
  }

  getByPhoneId(String phoneId) {
    return this._http.get("./phones/$phoneId.json").then((resp) {
      return resp.data;
    });
  }
}
