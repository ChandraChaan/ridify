import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rydify/presentation/ride_book/ride_booking_screen.dart';

class CarHomePageScreen extends StatefulWidget {
  const CarHomePageScreen({super.key});

  @override
  State<CarHomePageScreen> createState() => _CarHomePageScreenState();
}

class _CarHomePageScreenState extends State<CarHomePageScreen> {
  TimeOfDay? selectedTime;
  int passengers = 1;
  final fromText = TextEditingController();
  final toText = TextEditingController();
  final dateController = TextEditingController();
  final timeController = TextEditingController();

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        selectedTime = pickedTime;
        timeController.text = selectedTime!.format(context);
      });
    }
  }

  void _incrementPassengers() {
    setState(() {
      if (passengers < 6) passengers++;
    });
  }

  void _decrementPassengers() {
    setState(() {
      if (passengers > 1) {
        passengers--;
      }
    });
  }

  showBottomSheetDailog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          expand: false,
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                controller: scrollController,
                children: [
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 118, right: 118),
                    child: Container(
                      width: 10,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Text(
                      'Select address',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: fromText,
                    onChanged: (String? valve) {
                      fromText.text = valve!;
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      labelText: 'From',
                      prefixIcon: Icon(Icons.my_location),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: toText,
                    onChanged: (String? valve) {
                      toText.text = valve!;
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      labelText: 'To',
                      prefixIcon: Icon(Icons.location_on),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Divider(
                    height: 2,
                    color: Colors.black54,
                  ),
                  Text(
                    'Recent places',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const ListTile(
                    leading: Icon(Icons.location_pin),
                    title: Text('Office'),
                    subtitle: Text('London, Best Office, this is good one'),
                    trailing: Text('26 KM'),
                  ),
                  const ListTile(
                    leading: Icon(Icons.location_pin),
                    title: Text('Office'),
                    subtitle: Text('London, Best Office, this is good one'),
                    trailing: Text('26 KM'),
                  ),
                  const ListTile(
                    leading: Icon(Icons.location_pin),
                    title: Text('Office'),
                    subtitle: Text('London, Best Office, this is good one'),
                    trailing: Text('26 KM'),
                  ),
                  const ListTile(
                    leading: Icon(Icons.location_pin),
                    title: Text('Office'),
                    subtitle: Text('London, Best Office, this is good one'),
                    trailing: Text('26 KM'),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            const SizedBox(height: 20),
            const Text(
              'Your Pick of Ride at a Lower Price',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Image.asset(
              'assets/images/car_illustration.png',
              // Make sure to add the appropriate image asset
              height: 200,
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {
                showBottomSheetDailog(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black54),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                height: 50,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.my_location),
                    ),
                    Text(fromText.text.isNotEmpty ? fromText.text : 'From'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: () {
                showBottomSheetDailog(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black54),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                height: 50,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.location_on),
                    ),
                    Text(toText.text.isNotEmpty ? toText.text : 'To'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: TextField(
                    controller: dateController,
                    decoration: const InputDecoration(
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
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                        dateController.text = formattedDate;
                        setState(() {});
                      }
                    },
                    readOnly: true,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: TextField(
                    controller: timeController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Time',
                      prefixIcon: const Icon(Icons.access_time),
                    ),
                    readOnly: true,
                    onTap: () {
                      _selectTime(context);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black54),
                borderRadius: BorderRadius.circular(8.0),
              ),
              height: 50,
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.person),
                  ),
                  Container(
                    width: 91,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black12,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: _decrementPassengers,
                            icon: const Icon(Icons.remove, size: 20),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            passengers.toString(),
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: _incrementPassengers,
                            icon: const Icon(Icons.add, size: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const RideBookingScreen()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff016683),
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text('Search',
                    style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_taxi),
            label: 'Ride',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
        selectedItemColor: const Color(0xff016683),
      ),
    );
  }
}
