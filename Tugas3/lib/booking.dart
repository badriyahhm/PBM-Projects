import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'home.dart';
import 'ticket.dart';

class booking extends StatelessWidget {
  const booking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(30, 0, 0, 0),
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
          children: [
            InfoSection(
              title: 'Pijar Music Concert',
            ),
            GuestStar(),
            SeatPlan(),
          ],
        ),
      ),
    );
  }
}

class InfoSection extends StatelessWidget {
  const InfoSection({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Image.asset('assets/concert.jpg'),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 18, left: 18, bottom: 13),
          child: SizedBox(
            width: double.infinity,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color(0xFF053C6D),
              ),
            ),
          ),
        ),
        Column(
          children: [
            EventItem(text: 'Sunday, 31 March 2023', icon: Icons.event),
            EventItem(text: '4.00 p.m - 9.00 p.m', icon: Icons.access_time),
            EventItem(text: 'Istora Senayan', icon: Icons.place_outlined),
          ],
        ),
      ],
    );
  }
}

class GuestStar extends StatelessWidget {
  const GuestStar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8, left: 18, bottom: 8),
          child: SizedBox(
            width: double.infinity,
            child: Text(
              'Guest Star',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF053C6D),
              ),
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: Row(
            children: [
              GSItem(
                  image: 'assets/oliviaRodrigo.jpg',
                  artistName: 'Olivia Rodrigo'),
              GSItem(image: 'assets/idgitaf.jpg', artistName: 'Idgitaf'),
              GSItem(
                  image: 'assets/nadinAmizah.jpeg', artistName: 'Nadin Amizah'),
              GSItem(image: 'assets/pamungkas.jpg', artistName: 'Pamungkas'),
              GSItem(image: 'assets/tulus.jpg', artistName: 'Tulus'),
              GSItem(image: 'assets/yuraYunita.jpg', artistName: 'Yura Yunita'),
            ],
          ),
        ),
      ],
    );
  }
}

class SeatPlan extends StatelessWidget {
  const SeatPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 25),
          child: Image.asset('assets/seatConcert.png'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SeatItem(image: 'assets/pinkSeat.png'),
            SeatItem(image: 'assets/blueSeat.png'),
            SeatItem(image: 'assets/yellowSeat.png'),
          ],
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 15),
          child: TextButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              minimumSize: MaterialStateProperty.all<Size>(const Size(315, 40)),
              backgroundColor:
                  MaterialStateProperty.all<Color>(const Color(0xFF4F6789)),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Ticket()),
              );
            },
            child: const Text(
              'Book Now',
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class EventItem extends StatelessWidget {
  const EventItem({super.key, required this.text, required this.icon});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          SizedBox(
            width: 18,
          ),
          Icon(
            icon,
            color: Color(0xFF053C6D),
            size: 20,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: TextStyle(color: Color(0xFF053C6D), fontSize: 16),
          )
        ],
      ),
    );
  }
}

class GSItem extends StatelessWidget {
  const GSItem({super.key, required this.image, required this.artistName});

  final String image;
  final String artistName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: CircleAvatar(
            radius: 35,
            backgroundImage: AssetImage(image),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          artistName,
          style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Color(0xFF053C6D)),
        )
      ],
    );
  }
}

class SeatItem extends StatefulWidget {
  const SeatItem({Key? key, required this.image}) : super(key: key);

  final String image;

  @override
  _SeatItemState createState() => _SeatItemState();
}

class _SeatItemState extends State<SeatItem> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isTapped = !isTapped;
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: 12),
        decoration: isTapped
            ? BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(176, 158, 158, 158),
                    blurRadius: 3,
                    offset: Offset(0, 0), // Shadow position
                  ),
                ],
              )
            : null,
        child: Image.asset(
          widget.image,
          width: 100,
        ),
      ),
    );
  }
}
