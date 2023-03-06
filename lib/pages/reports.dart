import 'package:flutter/material.dart';

class ReportsPage extends StatefulWidget {
  const ReportsPage({super.key});

  @override
  State<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  List<int> text = [1, 2, 3, 4];
  var list = ["one", "two", "three", "four"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reports'),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(12.0),
        children: [
          for (var item in list)
            ReportCard(
              title: item,
              description: item,
            )
        ],
      ),
    );
  }

  Iterable<ReportCard> newMethod() {
    return text.map(
        (e) => const ReportCard(title: 'data', description: 'description'));
  }
}

class ReportCard extends StatelessWidget {
  final String title;
  final String description;
  const ReportCard({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {},
      child: Card(
        elevation: 2.0,
        child: ListTile(
          leading: FlutterLogo(size: 72.0),
          title: Text(title),
          subtitle: Text(description),
          trailing: Icon(Icons.arrow_right),
        ),
      ),
    );
  }
}
