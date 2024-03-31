import 'package:flutter/material.dart';
import 'package:image_card/image_card.dart';
import 'package:tugas_2/booking.dart';

class home extends StatelessWidget {
  const home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const HeroSection(),
              const Mission(),
              ImageSection(image: 'assets/donatenow.jpg'),
              Impact(),
              LatestEvent(),
            ],
          ),
        ),
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

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
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => booking()));
            },
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
  const Impact({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          child: Text(
            'with your help we\'ve been able to',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0060AF),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImpactCard(
              icon: Icons.diversity_1,
              title: '100.000+',
              subtitle: 'Lives Impacted',
            ),
            ImpactCard(
              icon: Icons.real_estate_agent,
              title: '2.500',
              subtitle: 'Shelters Provided',
            ),
            ImpactCard(
              icon: Icons.local_shipping,
              title: '2 Millions',
              subtitle: 'Meals Distributed',
            ),
          ],
        ),
      ],
    );
  }
}

class ImpactCard extends StatelessWidget {
  const ImpactCard(
      {super.key,
      required this.icon,
      required this.title,
      required this.subtitle});

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Color(0xFF759ACC),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Icon(
              icon,
              size: 30,
              color: Colors.white,
            ),
          ),
          Container(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0060AF),
              ),
            ),
          ),
          Container(
            child: Text(
              subtitle,
              style: TextStyle(
                fontSize: 11,
                color: Color(0xFF0060AF),
              ),
            ),
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
      margin: EdgeInsets.only(top: 20),
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
          Events(),
        ],
      ),
    );
  }
}

class Events extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          EventCard(
            image: 'assets/volcano.png',
            text: 'Volcano Clean Up Volunteer Day',
          ),
          EventCard(
            image: 'assets/tornado.png',
            text: 'Tornado Shelter Support Fund',
          ),
          EventCard(
            image: 'assets/avalanche.jpg',
            text: 'Avalanche Aftermath Fund',
          ),
          EventCard(
            image: 'assets/volcano.png',
            text: 'Volcano Clean Up Volunteer Day',
          ),
        ],
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final String image;
  final String text;

  const EventCard({required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
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
