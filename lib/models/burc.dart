class Burc {
  String _burcAdi;
  String _burcTarihi;
  String _burcAciklamasi;
  String _burcKucukResmi;
  String _burcbuyukResmi;

  Burc(this._burcAdi, this._burcTarihi, this._burcAciklamasi,
      this._burcKucukResmi, this._burcbuyukResmi);

  String get burcbuyukResmi => _burcbuyukResmi;

  set burcbuyukResmi(String value) {
    _burcbuyukResmi = value;
  }

  String get burcKucukResmi => _burcKucukResmi;

  set burcKucukResmi(String value) {
    _burcKucukResmi = value;
  }

  String get burcAciklamasi => _burcAciklamasi;

  set burcAciklamasi(String value) {
    _burcAciklamasi = value;
  }

  String get burcTarihi => _burcTarihi;

  set burcTarihi(String value) {
    _burcTarihi = value;
  }

  String get burcAdi => _burcAdi;

  set burcAdi(String value) {
    _burcAdi = value;
  }
}
