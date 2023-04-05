import 'dart:io';

import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:my_city/widgets/camera_screen.dart';

import '../widgets/image_placeholder.dart';
import 'package:camera/camera.dart';

import 'dart:async';
// import 'package:geocoder/geocoder.dart';

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class AddReport extends StatefulWidget {
  const AddReport({super.key});

  @override
  State<AddReport> createState() => _AddReportState();
}

class _AddReportState extends State<AddReport> {
  final location = Location();
  final imagePlaceholder = const ImagePlaceholder();
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  late List<CameraDescription> cameras;
  String address = '';

  late String image = '';
  @override
  initState() {
    intiCamera();
    getLocation();
    super.initState();
  }

  Future<void> intiCamera() async {
    cameras = await availableCameras();

    // Get a specific camera from the list of available cameras.
    final firstCamera = cameras.first;
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      firstCamera, // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  Future<void> getLocation() async {
    var data = await location.getLocation();
    // From coordinates
    // final coordinates = Coordinates(data.latitude, data.longitude);
    var addresses = "";
    // await Geocoder.local.findAddressesFromCoordinates(coordinates);
    // var first = addresses.first;

    setState(() {
      address = "address";
    });
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
      appBar: AppBar(title: Text('Add Report')),
      body: ListView(
        children: [
          Column(children: [
            GestureDetector(
                child: image.isEmpty
                    ? imagePlaceholder
                    : Image.file(
                        File(image),
                        fit: BoxFit.cover,
                      ),
                onTap: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            TakePictureScreen(camera: cameras.first)),
                  );
                  setState(() {
                    image = result as String;
                  });
                }),
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
            Padding(
              padding: EdgeInsets.all(5.0),
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Add Report'),
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    padding: EdgeInsets.all(5) // NEW
                    ),
              ),
            ),
          ])
        ],
      ),
    );
  }
}
