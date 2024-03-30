import 'package:flutter/material.dart';
import 'home.dart';

class VolcanoPage extends StatelessWidget {
  const VolcanoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => home()),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [test()],
        ),
      ),
    );
  }
}

class test extends StatelessWidget {
  const test({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(
          'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.cnbc.com%2F2018%2F06%2F06%2Frescuers-search-for-missing-near-guatemala-volcano-death-toll-climbs.html&psig=AOvVaw1YTkj3qoDkZaeCMhWczoH5&ust=1711914916008000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCIiQg5binIUDFQAAAAAdAAAAABAE'),
    );
  }
}
