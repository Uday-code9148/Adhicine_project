import 'package:flutter/material.dart';

import '../../../profile/presentation/pages/profile_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate = DateTime(2023, 9, 3); // Example date

  void changeDate(int days) {
    setState(() {
      selectedDate = selectedDate.add(Duration(days: days));
    });
  }
  String getFormattedDate({int manualDate = 0}) {
    List<String> months = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec"
    ];
    if (manualDate == 0) {
      return "${getWeekday(selectedDate.weekday)},  ${months[selectedDate.month - 1]} ${selectedDate.day}";
    } else {
      changeDate(manualDate);
      return "${getWeekday(selectedDate.weekday)}, ${months[selectedDate.month - 1]} ${selectedDate.day}";
    }
  }

  String getWeekday(int weekday) {
    List<String> weekdays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
    return weekdays[weekday % 7]; // Adjusting for zero-based index
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(top: 70, right: 16, left: 16, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Hi Harry!",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Text("5 Medicines Left",
                        style: TextStyle(color: Colors.grey)),
                  ],
                ),
                const Spacer(),
                const Icon(
                  Icons.medical_information,
                  color: Colors.indigoAccent,
                  size: 30,
                ),
                const SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfileSettingsPage()),
                    );
                  },
                  child: const CircleAvatar(
                    child: Icon(
                        Icons.manage_accounts_outlined), // Add profile image
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),

            // Date Selector with Navigation
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Text(
                    getFormattedDate(manualDate: -1),
                    style: const TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          size: 19,
                        ),
                        onPressed: () => changeDate(-1),
                      ),
                      Container(
                        width: 180,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 13),
                        decoration: BoxDecoration(
                          color: Colors.black87,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            getFormattedDate(manualDate: 2),
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.arrow_forward_ios, size: 19),
                        onPressed: () => changeDate(1),
                      ),
                    ],
                  ),
                  Text(
                    getFormattedDate(),
                    style: const TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            // Medicine Schedule List
            Expanded(
              child: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Morning 08:00 AM",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87)),
                      buildMedicineCard(
                          "Morning 08:00 AM",
                          "Calpol 500mg Tablet",
                          "Before Breakfast",
                          "Day 01",
                          Icons.notifications_active,
                          Colors.green,
                          "Taken"),
                      buildMedicineCard(
                          "Morning 08:00 AM",
                          "Calpol 500mg Tablet",
                          "Before Breakfast",
                          "Day 27",
                          Icons.notifications_off,
                          Colors.red,
                          "Missed"),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Morning 02:00 PM",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87)),
                      buildMedicineCard(
                          "Afternoon 02:00 PM",
                          "Calpol 500mg Tablet",
                          "After Food",
                          "Day 01",
                          Icons.snooze,
                          Colors.orange,
                          "Snoozed"),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Morning 09:00 PM",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87)),
                      buildMedicineCard(
                          "Night 09:00 PM",
                          "Calpol 500mg Tablet",
                          "Before Sleep",
                          "Day 03",
                          Icons.alarm,
                          Colors.grey,
                          "Left"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // Floating Action Button in Center of Bottom Nav Bar
      // floatingActionButton: FloatingActionButton(
      //   shape: CircleBorder(),
      //   onPressed: () {
      //     // Implement action
      //   },
      //   backgroundColor: Colors.black,
      //   child: const SizedBox(
      //       width: 80,
      //       height: 80,
      //       child: Icon(Icons.add, color: Colors.white, size: 30)),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // Bottom Navigation Bar with FAB notch
      // bottomNavigationBar: BottomAppBar(
      //   shape: const CircularNotchedRectangle(),
      //   notchMargin: 8.0,
      //   child: Padding(
      //     padding: const EdgeInsets.symmetric(horizontal: 20),
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: [
      //         IconButton(
      //             icon: const Icon(Icons.home),
      //             onPressed: () {},
      //             color: Colors.black),
      //         const SizedBox(width: 40), // Space for FAB
      //         IconButton(
      //             icon: const Icon(Icons.bar_chart),
      //             onPressed: () {},
      //             color: Colors.black),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }

  Widget buildMedicineCard(String time, String name, String description,
      String day, IconData icon, Color iconColor, String status) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(10),
        leading: const Icon(Icons.medication, color: Colors.blue, size: 30),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text("$description • $day"),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: iconColor),
            const SizedBox(width: 8),
            Text(status,
                style:
                    TextStyle(color: iconColor, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
