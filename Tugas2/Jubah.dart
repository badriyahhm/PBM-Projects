class Jubah {
  String _nama;
  int _kekuatan;
  int _kesehatan;

  Jubah(
    this._nama,
    this._kekuatan,
    this._kesehatan,
  );

  String getNama() {
    return this._nama;
  }

  int getTambahKesehatan() {
    return this._kesehatan * 10;
  }

  int getNilaiKekuatan() {
    return this._kekuatan * 2;
  }
}
