import 'package:flutter/material.dart';
import 'package:image_card/image_card.dart';

class home extends StatelessWidget {
  const home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Countdown(),
              const Mission(),
              ImageSection(image: 'assets/donatenow.jpg'),
              Impact(image: 'assets/impact.png'),
              LatestEvent(),
            ],
          ),
        ),
      ),
    );
  }
}

class Countdown extends StatelessWidget {
  const Countdown({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/concert1.jpg"),
          fit: BoxFit.fill,
          alignment: Alignment.topCenter,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const ListTile(
            title: Text(
              'Pijar Music Event',
              style: TextStyle(
                fontSize: 48,
                color: Color(0xFFAEBFCE),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildCountdownItem('04', 'days'),
              const SizedBox(
                width: 25,
              ),
              _buildCountdownItem('23', 'hours'),
              const SizedBox(
                width: 25,
              ),
              _buildCountdownItem('16', 'minutes'),
              const SizedBox(
                width: 25,
              ),
              _buildCountdownItem('23', 'seconds'),
            ],
          ),
          const SizedBox(height: 20),
          TextButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              minimumSize: MaterialStateProperty.all<Size>(const Size(350, 40)),
              backgroundColor:
                  MaterialStateProperty.all<Color>(const Color(0xFF759ACC)),
            ),
            onPressed: () {},
            child: const Text(
              'Book Now',
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCountdownItem(String value, String unit) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: const Color(0xFF759ACC),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 32,
              color: Colors.white,
            ),
          ),
          Text(
            unit,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class Mission extends StatelessWidget {
  const Mission({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Our Mission',
            style: TextStyle(
              color: Color(0XFF4F6789),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Empowering lives through music, our charity concert unites hearts, heals wounds, and rebuilds hope for natural disaster victims. Join us, buy a ticket, and make a lasting impact through the power of giving. Together, we can bring solace and strength to those in need.',
            style: TextStyle(
              fontSize: 16,
              color: Color(0XFF4F6789),
            ),
          ),
        ],
      ),
    );
  }
}

class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      width: 350,
      height: 175,
      fit: BoxFit.fill,
    );
  }
}

class Impact extends StatelessWidget {
  const Impact({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      child: Column(
        children: [
          Text(
            'with your help we\'ve been able to',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0060AF),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Image.asset(
            image,
          ),
        ],
      ),
    );
  }
}

class LatestEvent extends StatelessWidget {
  const LatestEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: Column(
        children: [
          Text(
            'Latest Event',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0060AF),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          OtherPage(),
        ],
      ),
    );
  }
}

class OtherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          card(
            image: 'assets/volcano.png',
            text: 'Volcano Clean Up Volunteer Day',
          ),
          card(
            image: 'assets/tornado.png',
            text: 'Tornado Shelter Support Fund',
          ),
          card(
            image: 'assets/avalanche.jpg',
            text: 'Avalanche Aftermath Fund',
          ),
          card(
            image: 'assets/volcano.png',
            text: 'Volcano Clean Up Volunteer Day',
          ),
        ],
      ),
    );
  }
}

Widget card({required String image, required String text}) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 12),
    child: FillImageCard(
      width: 120,
      heightImage: 80,
      color: Color(0xFF759ACC),
      imageProvider: AssetImage(image),
      description: title(text: text),
    ),
  );
}

Widget title({required String text}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 11, fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ],
    ),
  );
}
