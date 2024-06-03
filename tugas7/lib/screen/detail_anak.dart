import 'package:flutter/material.dart';
import 'package:daycare/models/dataanak.dart';
import 'package:daycare/screen/dailyreport.dart';

class DetailAnakScreen extends StatelessWidget {
  final DataAnak dataAnak;

  DetailAnakScreen({required this.dataAnak});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Anak',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Color(0XFF909FF9),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('images/face.png'),
              ),
            ),
            SizedBox(height: 20),
            _buildDetailItem('Nama', dataAnak.namaAnak),
            _buildDetailItem('Jenis Kelamin', dataAnak.gender),
            _buildDetailItem('Nama Orang Tua', dataAnak.parentName),
            _buildDetailItem('Kontak Orang Tua', dataAnak.parentContact),
            SizedBox(height: 20),
            _buildButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text(
            value,
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 10),
        ],
      ),
      margin: EdgeInsets.symmetric(horizontal: 15),
    );
  }

  Widget _buildButton(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DailyReportScreen(dataAnak: dataAnak),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0XFFFC7275),
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        ),
        child: Text(
          'Buat Daily Report',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
