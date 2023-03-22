import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:geocoder/geocoder.dart';

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class ViewReport extends StatefulWidget {
  const ViewReport({super.key});

  @override
  State<ViewReport> createState() => _ViewReportState();
}

class _ViewReportState extends State<ViewReport> {
  final location = Location();

  String address = '';
  @override
  initState() {
    getLocation();
    super.initState();
  }

  Future<void> getLocation() async {
    var data = await location.getLocation();
    // From coordinates
    final coordinates = Coordinates(data.latitude, data.longitude);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;

    setState(() {
      address = "${first.featureName} : ${first.addressLine}";
    });
    print("${first.featureName} : ${first.addressLine}");
  }

  var categories = [
    "Food",
    "Transport",
    "Personal",
    "Shopping",
    "Medical",
    "Rent",
    "Movie",
    "Salary"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('View Report')),
      body: ListView(
        children: [
          Column(children: [
            Image.network(
                'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif',
                width: double.infinity),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButtonFormField(
                hint: const Text('Choose category'),
                decoration: InputDecoration(labelText: 'select category'),
                items: categories.map((String category) {
                  return new DropdownMenuItem(
                      value: category,
                      child: Row(
                        children: <Widget>[
                          Text(category),
                        ],
                      ));
                }).toList(),
                onChanged: (newValue) {
                  // do other stuff with _category
                },
                value: null,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButtonFormField(
                hint: const Text('Choose sub category'),
                decoration: InputDecoration(labelText: 'select sub category'),
                items: categories.map((String category) {
                  return new DropdownMenuItem(
                      value: category,
                      child: Row(
                        children: <Widget>[
                          Text(category),
                        ],
                      ));
                }).toList(),
                onChanged: (newValue) {
                  // do other stuff with _category
                },
                value: null,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: TextFormField(
                maxLines: 3,
                decoration: const InputDecoration(
                  hintText: 'Ex. alex@gmail.com',
                  label: Text('Description'),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: TextField(
                readOnly: true,
                controller: TextEditingController(text: address),
                maxLines: null,
                decoration: InputDecoration(icon: Icon(Icons.location_on)),
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.all(5.0),
            //   child: ElevatedButton(
            //     onPressed: () {},
            //     child: const Text('Add Report'),
            //     style: ElevatedButton.styleFrom(
            //         minimumSize: const Size.fromHeight(50),
            //         padding: EdgeInsets.all(5) // NEW
            //         ),
            //   ),
            // ),
          ])
        ],
      ),
    );
  }
}
