import 'package:flutter/material.dart';
import 'home.dart';

class booking extends StatelessWidget {
  const booking({Key? key}) : super(key: key);

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
      child: Image.asset('assets/concert1.jpg'),
    );
  }
}
