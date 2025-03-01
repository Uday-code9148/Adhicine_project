import 'package:flutter/material.dart';

class AddMedicineScreen extends StatefulWidget {
  const AddMedicineScreen({super.key});

  @override
  AddMedicineScreenState createState() => AddMedicineScreenState();
}

class AddMedicineScreenState extends State<AddMedicineScreen> {
  int selectedCompartment = 1;
  Color selectedColor = Colors.purple;
  String selectedType = "Tablet";
  double totalCount = 1;
  String frequency = "Everyday";
  String timesPerDay = "Three Times";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Medicines"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              SizedBox(
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: "Search Medicine Name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(17)),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.mic),
                        onPressed: () {},
                      )),
                ),
              ),
              const SizedBox(height: 20),

              // Compartment Selection
              const Text("Compartment"),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(10, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: ChoiceChip(
                        label: Text("${index + 1}"),
                        selected: selectedCompartment == index + 1,
                        onSelected: (selected) {
                          setState(() {
                            selectedCompartment = index + 1;
                          });
                        },
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(height: 20),

              // Color Selection
              const Text("Colour"),
              Row(
                children: [
                  Colors.purple,
                  Colors.blue,
                  Colors.red,
                  Colors.green,
                  Colors.orange,
                  Colors.yellow
                ].map((color) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedColor = color;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                        border: selectedColor == color
                            ? Border.all(width: 1, color: Colors.black)
                            : null,
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),

              // Medicine Type
              const Text("Type"),
              Wrap(
                spacing: 10,
                children: ["Tablet", "Capsule", "Cream", "Liquid"]
                    .map((type) => ChoiceChip(
                          label: Text(type),
                          selected: selectedType == type,
                          onSelected: (selected) {
                            setState(() {
                              selectedType = type;
                            });
                          },
                        ))
                    .toList(),
              ),
              const SizedBox(height: 20),

              // Quantity Selector
              const Text("Quantity"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 90, vertical: 5),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(6))),
                      child: const Text("Take 1/2 Pill")),
                  Container(
                    height: 35,
                    width: 45,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(6))),
                    child: const Icon(Icons.remove),
                  ),
                  Container(
                      height: 35,
                      width: 45,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(6))),
                      child: const Icon(Icons.add)),
                ],
              ),
             const SizedBox(height: 10),
              // Total Count
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Total Count"),
                  Container(padding: EdgeInsets.symmetric(vertical: 1,horizontal: 3),
                      decoration: BoxDecoration(color: Colors.black12,
                          border: Border.all(color: Colors.grey),
                          borderRadius:
                          const BorderRadius.all(Radius.circular(6))),
                      child: Text('$totalCount',)),
                ],
              ),
              Slider(
                value: totalCount,
                min: 1,
                max: 100,
                divisions: 99,
                label: totalCount.toInt().toString(),
                onChanged: (value) {
                  setState(() {
                    totalCount = value;
                  });
                },
              ),

              // Set Date
              const Text("Set Date"),
              Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                          onPressed: () {}, child: const Text("Today"))),
                  const  SizedBox(width: 10),
                  Expanded(
                      child: ElevatedButton(
                          onPressed: () {}, child:const  Text("End Date"))),
                ],
              ),
              const  SizedBox(height: 20),

              // Frequency of Days
              DropdownButtonFormField(
                decoration:const  InputDecoration(labelText: "Frequency of Days"),
                value: frequency,
                items: ["Everyday", "Alternate Days", "Weekly"]
                    .map((String value) {
                  return DropdownMenuItem(value: value, child: Text(value));
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    frequency = newValue.toString();
                  });
                },
              ),
              const SizedBox(height: 20),

              // How Many Times a Day
              DropdownButtonFormField(
                decoration:const  InputDecoration(labelText: "How many times a Day"),
                value: timesPerDay,
                items: ["One Time", "Two Times", "Three Times"]
                    .map((String value) {
                  return DropdownMenuItem(value: value, child: Text(value));
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    timesPerDay = newValue.toString();
                  });
                },
              ),
              const  SizedBox(height: 20),

              // Food Timings
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:
                    ["Before Food", "After Food", "Before Sleep"].map((time) {
                  return ElevatedButton(
                    onPressed: () {},
                    child: Text(time),
                  );
                }).toList(),
              ),
              const  SizedBox(height: 20),

              // Add Button
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding:
                    const  EdgeInsets.symmetric(horizontal: 150, vertical: 15),
                  ),
                  child:const  Text("Add", style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
