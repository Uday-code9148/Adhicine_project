import 'package:flutter/material.dart';

class ProfileSettingsPage extends StatefulWidget {
  const ProfileSettingsPage({super.key});

  @override
  ProfileSettingsPageState createState() => ProfileSettingsPageState();
}

class ProfileSettingsPageState extends State<ProfileSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Section
            const Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  child: Icon(Icons.manage_accounts_outlined) ,// Change as needed
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Take Care!",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    Text(
                      "Richa Bose",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Divider(),
            const Text(
              "Settings",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            // Settings List
            buildSettingsOption("Notification", "Check your medicine notification", Icons.notifications),
            buildSettingsOption("Sound", "Ring, Silent, Vibrate", Icons.volume_up),
            buildSettingsOption("Manage Your Account", "Password, Email ID, Phone Number", Icons.person),
            buildSettingsOption("Notification", "Check your medicine notification", Icons.notifications),
            buildSettingsOption("Notification", "Check your medicine notification", Icons.notifications),

            const  SizedBox(height: 20),
            const   Text("Device", style: TextStyle(fontWeight: FontWeight.bold)),
            const   SizedBox(height: 10),

            // Device Section
            Container(
              padding:const  EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.indigoAccent.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  buildDeviceOption("Connect", "Bluetooth, Wi-Fi", Icons.speaker),
                  const  SizedBox(height: 10),
                  buildDeviceOption("Sound Option", "Ring, Silent, Vibrate", Icons.volume_up,isSelect: true),
                ],
              ),
            ),

            const SizedBox(height: 20),
            const Text("Caretakers: 03", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),

            // Caretakers Section
            Container(padding: EdgeInsets.all(15),decoration: BoxDecoration(color: Colors.indigoAccent.withOpacity(0.3),borderRadius: BorderRadius.circular(12)),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildCaretakerAvatar("Dipa Luna"),
                  buildCaretakerAvatar("Roz Sod."),
                  buildCaretakerAvatar("Sunny Tu."),
                  buildCaretakerAvatar("Add", isAdd: true),
                ],
              ),
            ),

            const SizedBox(height: 20),
            const Text("Doctor", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),

            // Add Doctor Section
            Container(
              width: double.infinity,
              padding:const  EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.indigoAccent.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10),
              ),
              child:const Column(
                children: [
                  Icon(Icons.add_circle, size: 40, color: Colors.blue),
                  SizedBox(height: 5),
                  Text("Add Your Doctor", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("Or use invite link", style: TextStyle(color: Colors.orange)),
                ],
              ),
            ),

            const SizedBox(height: 30),
            buildSettingsOption("Privacy Policy", "", null),
            buildSettingsOption("Terms of Use", "", null),
            buildSettingsOption("Rate Us", "", null),
            buildSettingsOption("Share", "", null),

            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side:const  BorderSide(color: Colors.black),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                child:const  Padding(
                  padding: EdgeInsets.symmetric(horizontal: 140, vertical: 12),
                  child: Text("Log Out", style: TextStyle(color: Colors.black)),
                ),
              ),
            ),
            const  SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget buildSettingsOption(String title, String subtitle, IconData? icon) {
    return ListTile(
      leading: icon != null ? Icon(icon, color: Colors.grey) : null,
      title: Text(title, style:const  TextStyle(fontWeight: FontWeight.bold)),
      subtitle: subtitle.isNotEmpty ? Text(subtitle, style: const TextStyle(color: Colors.grey)) : null,
      onTap: () {},
    );
  }

  Widget buildDeviceOption(String title, String subtitle, IconData icon,{bool isSelect=false}) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color:isSelect? Colors.white:Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.grey),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle, style: const TextStyle(color: Colors.grey)),
        onTap: () {},
      ),
    );
  }

  Widget buildCaretakerAvatar(String name, {bool isAdd = false}) {
    return Padding(
      padding: EdgeInsets.only(right: 10),
      child: Column(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: isAdd ? Colors.grey[300] : Colors.blue,
            child: isAdd ? Icon(Icons.add, color: Colors.black) : null,
          ),
          SizedBox(height: 5),
          Text(name, style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
