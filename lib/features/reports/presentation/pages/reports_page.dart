import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  ReportPageState createState() => ReportPageState();
}

class ReportPageState extends State<ReportPage> {
  List<List<String>>  historyList=[["1","Sun"],["2","Mon"],["3","Tue"],["4","Wed"],["5","Thu"],["6","Fri"],["7","Sat"]];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const  Text("Report"),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding:const  EdgeInsets.only(bottom:16 ,left:16 ,right:16 ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildReportCard(),
            const SizedBox(height: 16.0),
            _buildDashboardCard(),
            const  SizedBox(height: 16.0),
            _buildCheckHistory(),
            const SizedBox(height: 16.0),
            _buildMedicationList(),
          ],
        ),
      ),
    );
  }

  Widget _buildReportCard() {
    return Card(color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const  Text("Today's Report",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const  SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _reportItem("5", "Total"),
                _reportItem("3", "Taken"),
                _reportItem("1", "Missed"),
                _reportItem("1", "Snoozed"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _reportItem(String count, String label) {
    return Column(
      children: [
        Text(count,
            style:const  TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Text(label, style:const  TextStyle(fontSize: 14)),
      ],
    );
  }

  Widget _buildDashboardCard() {
    return const  Card(color: Colors.white,
      child: ListTile(
        title: Text("Check Dashboard"),
        subtitle:
            Text("Find everything related to your active and past medicines."),
        trailing: Icon(Icons.data_saver_off_outlined,size: 45,color: Colors.lightBlueAccent,),
      ),
    );
  }

  Widget _buildCheckHistory() {
    return Column(
      children: [
        const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Check History",style:  TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Icon(Icons.arrow_forward_ios_rounded,size:22 ,color: Colors.indigoAccent,),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(historyList.length, (index) {
            return Column(
              children: [
                Text(historyList[index].last,style:   TextStyle(fontSize: 13,color: Colors.grey.withOpacity(0.4), fontWeight: FontWeight.w500)),
                CircleAvatar(
                  backgroundColor: index == 0 ? Colors.blue : Colors.grey[300],
                  child: Text(historyList[index].first),
                ),
              ],
            );
          }),
        ),
      ],
    );
  }

  Widget _buildMedicationList() {
    return Expanded(
      child: ListView(
        children: [Column(crossAxisAlignment:CrossAxisAlignment.start ,
            children: [
          const Text("Morning 08:00 am",style:  TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          _medicationTile("Calpol 500mg Tablet", "Before Breakfast", "Day 01",
            Icons.check_circle, Colors.green),
          _medicationTile("Calpol 500mg Tablet", "Before Breakfast", "Day 27",
              Icons.cancel, Colors.red),]),
          const SizedBox(height: 10),
          Column(crossAxisAlignment:CrossAxisAlignment.start ,
              children: [
                const Text("Morning 02:00 pm",style:  TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                _medicationTile("Calpol 500mg Tablet", "After Food", "Day 01",
                    Icons.snooze, Colors.orange),]),

        ],
      ),
    );
  }

  Widget _medicationTile(
      String title, String subtitle, String day, IconData icon, Color color) {
    return Card(
      child: ListTile(contentPadding:const EdgeInsets.all(10),
        leading: const Icon(Icons.local_hospital, color: Colors.purple),
        title: Text(title),
        subtitle: Text("$subtitle \u2022 $day"),
        trailing: Icon(icon, color: color),
      ),
    );
  }
}
