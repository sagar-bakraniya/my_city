import 'package:flutter/material.dart';

class ReportCard extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  const ReportCard(
      {super.key,
      required this.title,
      required this.description,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 4,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: Image.network(
              image,
              height: 250,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
            ),
          ),
          ListTile(
            title: Text(
              title,
              style: const TextStyle(fontSize: 20),
            ),
            subtitle: Text(
              description,
            ),
          ),
        ],
      ),
    );
  }
}
