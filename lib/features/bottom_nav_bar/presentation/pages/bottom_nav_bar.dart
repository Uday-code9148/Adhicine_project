import 'package:adhicine_poc/features/addMedicine/presentation/pages/add_medicine_page.dart';
import 'package:adhicine_poc/features/reports/presentation/pages/reports_page.dart';
import 'package:flutter/material.dart';

import '../../../home/presentation/pages/home_page.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  BottomNavBarScreenState createState() => BottomNavBarScreenState();
}

class BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const HomeScreen(),
    const ReportPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddMedicineScreen()),
          );
        },
        backgroundColor: Colors.black,
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.home),
                onPressed: () => _onItemTapped(0),
                color: _selectedIndex == 0 ? Colors.blue : Colors.black,
              ),
              const SizedBox(width: 40), // Space for FAB
              IconButton(
                icon: const Icon(Icons.bar_chart),
                onPressed: () => _onItemTapped(1),
                color: _selectedIndex == 1 ? Colors.blue : Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
