import 'package:flutter/material.dart';
import 'package:my_city/pages/view_report.dart';

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
            ReportCardTile(
              title: item,
              description: item,
            )
        ],
      ),
    );
  }

  Iterable<ReportCardTile> newMethod() {
    return text.map(
        (e) => const ReportCardTile(title: 'data', description: 'description'));
  }
}

class ReportCardTile extends StatelessWidget {
  final String title;
  final String description;
  const ReportCardTile(
      {super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ViewReport()),
        )
      },
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
