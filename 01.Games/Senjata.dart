class Senjata {
  String _nama;
  int _kekuatan;

  Senjata(this._nama, this._kekuatan);

  String getNama() {
    return this._nama;
  }

  int getKekuatanSerang() {
    return this._kekuatan * 2;
  }
}
