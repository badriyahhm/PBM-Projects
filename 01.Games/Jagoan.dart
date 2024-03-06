import 'Jubah.dart';
import 'Senjata.dart';

class Jagoan {
  String nama;
  late int kesehatanDasar;
  late int kekuatanDasar;
  late int derajat;
  late int totalKerusakan;
  late int kenaikanKesehatan;
  late int kenaikanKekuatan;
  late bool hidup;

  Jubah? jubah;
  Senjata? senjata;

  Jagoan(this.nama) {
    this.kesehatanDasar = 100;
    this.kekuatanDasar = 100;
    this.derajat = 1;
    this.kenaikanKekuatan = 10;
    this.kenaikanKesehatan = 10;
    this.hidup = true;
  }

  void setJubah(Jubah jubah) {
    this.jubah = jubah;
  }

  void setSenjata(Senjata senjata) {
    this.senjata = senjata;
  }

  String getNama() {
    return this.nama;
  }

  int sehatMaksimal() {
    return this.kesehatanDasar +
        (this.jubah?.getTambahKesehatan() ?? 0) +
        this.derajat * this.kenaikanKesehatan;
  }

  int getKekuatanSerangJagoan() {
    return this.kekuatanDasar +
        (this.senjata?.getKekuatanSerang() ?? 0) +
        this.derajat * this.kenaikanKekuatan;
  }

  int getNilaiKesehatan() {
    return this.sehatMaksimal() - this.totalKerusakan;
  }

  void naikDerajat() {
    this.derajat++;
  }

  bool getStatus() {
    return this.hidup;
  }

  void menyerang(Jagoan lawan) {
    int kerusakan = this.getKekuatanSerangJagoan();

    print('${this.nama} menyerang ${lawan.nama} dengan kekuatan $kerusakan');

    lawan.bertahan(kerusakan);

    this.naikDerajat();
  }

  void bertahan(int kerusakan) {
    int kekuatanBertahan =
        this.jubah != null ? this.jubah!.getNilaiKekuatan() : 0;
    int selisihKerusakan;

    print('${this.nama} memiliki kekuatan bertahan: $kekuatanBertahan');

    if (kerusakan > kekuatanBertahan) {
      selisihKerusakan = kerusakan - kekuatanBertahan;
    } else {
      selisihKerusakan = 0;
    }

    print('Kerusakan yang diperoleh $selisihKerusakan\n');

    this.totalKerusakan += selisihKerusakan;

    if (this.getNilaiKesehatan() <= 0) {
      this.hidup = false;
      this.totalKerusakan = this.sehatMaksimal();
    }

    this.info();
  }

  void info() {
    print('Jagoan\t\t\t: ${this.nama}');
    print('Derajat\t\t\t: ${this.derajat}');
    print('Kesehatan Dasar\t\t: ${this.kesehatanDasar}');
    print('Kekuatan Dasar\t\t: ${this.kekuatanDasar}');
    print('Kesehatan\t\t: ${this.getNilaiKesehatan()}/${this.sehatMaksimal()}');
    print('Kekuatan Maksimal\t: ${this.getKekuatanSerangJagoan()}');
    print('Masih hidup?\t\t: ${this.hidup}\n');
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
