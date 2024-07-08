import 'package:flutter/material.dart';

class CarHomePageScreen extends StatelessWidget {
  const CarHomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Car Booking App'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Text(
            'Book a Ride',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'From',
              prefixIcon: Icon(Icons.location_on),
            ),
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'To',
              prefixIcon: Icon(Icons.location_on),
            ),
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Date',
              prefixIcon: Icon(Icons.date_range),
            ),
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime(2101),
              );
              if (pickedDate != null) {
                // Handle the selected date
              }
            },
            readOnly: true,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Handle search action
            },
            child: Text('Search'),
          ),
          SizedBox(height: 20),
          Text(
            'Popular Routes',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          _buildRouteCard('New York', 'Boston', '4 hrs', '\$30'),
          _buildRouteCard('San Francisco', 'Los Angeles', '6 hrs', '\$50'),
          _buildRouteCard('Chicago', 'Detroit', '5 hrs', '\$35'),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.blue,
      ),
    );
  }

  Widget _buildRouteCard(String from, String to, String duration, String price) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.directions_car, size: 40),
        title: Text('$from to $to'),
        subtitle: Text('$duration - $price'),
        trailing: Icon(Icons.arrow_forward),
      ),
    );
  }
}
