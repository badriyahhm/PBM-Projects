import 'package:flutter/material.dart';
import 'package:daycare/screen/home_pengasuh.dart';
import 'package:daycare/screen/login.dart';

class OrangtuaScreen extends StatefulWidget {
  @override
  _OrangtuaScreenState createState() => _OrangtuaScreenState();
}

class _OrangtuaScreenState extends State<OrangtuaScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  void logout(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Parent Dashboard',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Color(0XFF909FF9),
        actions: [
          IconButton(
            icon: Icon(
              Icons.logout,
              color: Colors.white,
            ),
            onPressed: () => logout(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profil Anak
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: 20),
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('images/face.png'),
                      ),
                      SizedBox(width: 40),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nama Anak',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.thermostat_outlined,
                                  color: Colors.red),
                              SizedBox(width: 8),
                              Text('Temperatur: 36.5°C'),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.access_time, color: Colors.green),
                              SizedBox(width: 8),
                              Text('Arrival: 08:00 AM'),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      SizedBox(width: 25),
                      Icon(Icons.notes, color: Colors.blue),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text('Condition: Healthy and Active'),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            TabBar(
              controller: _tabController,
              tabs: [
                Tab(text: 'Meals'),
                Tab(text: 'Toilet'),
                Tab(text: 'Bottle'),
                Tab(text: 'Other'),
                Tab(text: 'Notes for Parents'),
              ],
            ),
            // Daily Report
            Container(
              height: 400,
              child: TabBarView(
                controller: _tabController,
                children: [
                  // Meals Section
                  SingleChildScrollView(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MealItem(
                          imagePath: 'images/breakfast.png',
                          mealName: 'Breakfast',
                          mealDescription: '-',
                          quantity: 'None',
                        ),
                        MealItem(
                          imagePath: 'images/snack.png',
                          mealName: 'Snack',
                          mealDescription: 'Pisang dan susu',
                          quantity: 'Lots',
                        ),
                        MealItem(
                          imagePath: 'images/lunch.png',
                          mealName: 'Lunch',
                          mealDescription:
                              'Nasi, bola-bola tahu, dan telur rebus',
                          quantity: 'Some',
                        ),
                        MealItem(
                          imagePath: 'images/dinner.png',
                          mealName: 'Dinner',
                          mealDescription: 'Nasi dan pempek',
                          quantity: 'Lots',
                        ),
                        MealItem(
                          imagePath: 'images/drink.png',
                          mealName: 'Fluids',
                          mealDescription: 'Air putih dan susu',
                          quantity: 'Lots',
                        ),
                      ],
                    ),
                  ),
                  // Toilet Section
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(),
                  ),
                  // Bottle Section
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(),
                  ),
                  // Other Section
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(),
                  ),
                  // Notes Section
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MealItem extends StatelessWidget {
  final String imagePath;
  final String mealName;
  final String mealDescription;
  final String quantity;

  const MealItem({
    required this.imagePath,
    required this.mealName,
    required this.mealDescription,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage(imagePath),
          ),
          SizedBox(width: 25),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mealName,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  mealDescription,
                  maxLines: null,
                  softWrap: true,
                ),
                Text(
                  quantity,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0XFF2C55A4),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
