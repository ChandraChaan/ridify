import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'car_homepage_screen.dart';

class RideBookingScreen extends StatefulWidget {
  final String fromAdress;
  final String toAdress;
  final String date;
  final String time;

  const RideBookingScreen(
      {super.key,
      required this.fromAdress,
      required this.toAdress,
      required this.date,
      required this.time});

  @override
  _RideBookingScreenState createState() => _RideBookingScreenState();
}

class _RideBookingScreenState extends State<RideBookingScreen> {
  TimeOfDay? selectedTime;
  int passengers = 1;

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
  late TextEditingController fromText;
  late TextEditingController toText;
  late TextEditingController dateController;
  late TextEditingController timeController;

  @override
  void initState() {
    super.initState();
    fromText = TextEditingController(text: widget.fromAdress);
    toText = TextEditingController(text: widget.toAdress);
    dateController = TextEditingController(text: widget.date);
    timeController = TextEditingController(text: widget.time);
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
                      // fromText.text = valve!;
                      setState(() {});
                    },
                    decoration: const InputDecoration(
                      labelText: 'From',
                      prefixIcon: Icon(Icons.my_location),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: toText,
                    onChanged: (String? valve) {
                      // toText.text = valve!;
                      setState(() {});
                    },
                    decoration: const InputDecoration(
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
                  ListTile(
                    onTap: () {
                      setState(() {
                        fromText.text = 'Pune';
                        toText.text = 'Hyderabad';
                      });
                      Navigator.pop(context);
                    },
                    leading: const Icon(Icons.location_pin),
                    title: const Text('Office'),
                    subtitle: const Text('Pune to Hyderabad'),
                    trailing: const Text('560 KM'),
                  ),
                  ListTile(
                    onTap: () {
                      setState(() {
                        fromText.text = 'Mumbai';
                        toText.text = 'Delhi';
                      });
                      Navigator.pop(context);
                    },
                    leading: const Icon(Icons.location_pin),
                    title: const Text('Home'),
                    subtitle: const Text('Mumbai to Delhi'),
                    trailing: const Text('1412 KM'),
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
      appBar: AppBar(
        title: const Text('Ride Booking'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const CarHomePageScreen()));
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
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
                    const Padding(
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
                    const Padding(
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
                  child: InkWell(
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2101),
                      );
                      if (pickedDate != null) {
                        String formattedDate =
                            DateFormat('yMEd').format(pickedDate);
                        dateController.text = formattedDate;
                        setState(() {});
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black54),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      height: 50,
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.date_range),
                          ),
                          Text(dateController.text.isNotEmpty
                              ? dateController.text
                              : 'Date'),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      _selectTime(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black54),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      height: 50,
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.access_time),
                          ),
                          Text(timeController.text.isNotEmpty
                              ? timeController.text
                              : 'Time'),
                        ],
                      ),
                    ),
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
            const Text(
              'Available Drivers For You',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildDriverCard('Daniel Austin', '\$120.00', 'BMW Cabrio',
                '3 seats', 'assets/images/driver1.png'),
            _buildDriverCard('Daniel Austin', '\$120.00', 'BMW Cabrio',
                '3 seats', 'assets/images/driver2.png'),
            _buildDriverCard('Daniel Austin', '\$120.00', 'BMW Cabrio',
                '3 seats', 'assets/images/driver3.png'),
          ],
        ),
      ),
    );
  }

  Widget _buildDriverCard(String name, String price, String carModel,
      String seats, String imagePath) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 30,
              // backgroundImage: AssetImage(imagePath),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    price,
                    style: const TextStyle(color: Colors.green, fontSize: 14),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '$carModel | $seats',
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle view details action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text('View Details'),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    // Handle pay and book action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text('Pay & Book'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
