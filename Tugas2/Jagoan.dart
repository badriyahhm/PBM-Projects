import 'Jubah.dart';
import 'Senjata.dart';

class Jagoan {
  late String _nama;
  late int _kesehatanDasar;
  late int _kekuatanDasar;
  late int _derajat;
  int _totalKerusakan = 0;
  late int _kenaikanKesehatan;
  late int _kenaikanKekuatan;
  late bool _hidup;

  Jubah? jubah;
  Senjata? senjata;

  Jagoan(this._nama) {
    this._kesehatanDasar = 100;
    this._kekuatanDasar = 100;
    this._derajat = 1;
    this._kenaikanKekuatan = 10;
    this._kenaikanKesehatan = 10;
    this._hidup = true;
  }

  void setJubah(Jubah jubah) {
    this.jubah = jubah;
  }

  void setSenjata(Senjata senjata) {
    this.senjata = senjata;
  }

  String getNama() {
    return this._nama;
  }

  int sehatMaksimal() {
    return this._kesehatanDasar +
        (this.jubah?.getTambahKesehatan() ?? 0) +
        this._derajat * this._kenaikanKesehatan;
  }

  int getKekuatanSerangJagoan() {
    return this._kekuatanDasar +
        (this.senjata?.getKekuatanSerang() ?? 0) +
        this._derajat * this._kenaikanKekuatan;
  }

  int getNilaiKesehatan() {
    return this.sehatMaksimal() - this._totalKerusakan;
  }

  void naikDerajat() {
    this._derajat++;
  }

  bool getStatus() {
    return this._hidup;
  }

  void menyerang(Jagoan lawan) {
    int kerusakan = this.getKekuatanSerangJagoan();

    print('${this._nama} menyerang ${lawan._nama} dengan kekuatan $kerusakan');

    lawan.bertahan(kerusakan);

    this.naikDerajat();
  }

  void bertahan(int kerusakan) {
    int kekuatanBertahan = (this.jubah?.getNilaiKekuatan() ?? 0);
    int selisihKerusakan;

    print('${this._nama} memiliki kekuatan bertahan: $kekuatanBertahan');

    if (kerusakan > kekuatanBertahan) {
      selisihKerusakan = kerusakan - kekuatanBertahan;
    } else {
      selisihKerusakan = 0;
    }

    print('Kerusakan yang diperoleh $selisihKerusakan\n');

    this._totalKerusakan += selisihKerusakan;

    if (this.getNilaiKesehatan() <= 0) {
      this._hidup = false;
      this._totalKerusakan = this.sehatMaksimal();
    }

    this.info();
  }

  void info() {
    print('Jagoan\t\t\t: ${this._nama}');
    print('Derajat\t\t\t: ${this._derajat}');
    print('Kesehatan Dasar\t\t: ${this._kesehatanDasar}');
    print('Kekuatan Dasar\t\t: ${this._kekuatanDasar}');
    print('Kesehatan\t\t: ${this.getNilaiKesehatan()}/${this.sehatMaksimal()}');
    print('Kekuatan Maksimal\t: ${this.getKekuatanSerangJagoan()}');
    print('Masih hidup?\t\t: ${this._hidup}\n');
  }

  void getNamaJubah() {
    print(
        'Jubah\t\t\t: ${this.jubah != null ? this.jubah!.getNama() : 'tidak ada'}');
  }

  void getNamaSenjata() {
    print(
        'Senjata\t\t\t: ${this.senjata != null ? this.senjata!.getNama() : 'tidak ada'}');
  }
}
