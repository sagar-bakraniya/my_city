import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:my_city/pages/view_report.dart';

import '../services/report_service.dart';
import '../widgets/report_card.dart';

class ReportsPage extends StatefulWidget {
  const ReportsPage({super.key});

  @override
  State<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  late ReportsResponse reports =
      new ReportsResponse(success: false, nHbits: 0, data: []);

  List<int> text = [1, 2, 3, 4];
  var list = ["one", "two", "three", "four"];

  @override
  initState() {
    getReports();
    super.initState();
  }

  getReports() async {
    reports = await fetchAlbum();
    for (var element in reports.data) {
      print(element.address.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Reports'),
        ),
        body: FutureBuilder<ReportsResponse>(
          future: fetchAlbum(),
          builder: (context, snapshot) {
            if (snapshot.hasData &&
                snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                itemCount: snapshot.data?.data.length,
                itemBuilder: (context, index) {
                  return ImageTitleSubtitleWidget(
                    imagePath: snapshot.data!.data[index].imgUrl,
                    title: snapshot.data!.data[index].category,
                    subtitle: snapshot.data!.data[index].description,
                  );
                },
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ));
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
