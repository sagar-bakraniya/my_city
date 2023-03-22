import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_city/pages/add_report.dart';
import 'package:my_city/pages/reports.dart';
import 'package:my_city/widgets/report_card.dart';

import '../widgets/drawer_header.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  var drawerItemsList = ListView(
    children: const [
      MCDrawerHeader(),
      ListTile(
        title: Text('Home'),
        leading: Icon(Icons.home),
      ),
      ListTile(
        title: Text('Profile'),
        leading: Icon(Icons.person),
      ),
      ListTile(
        title: Text('Add Report'),
        leading: Icon(Icons.web),
      ),
      ListTile(
        title: Text('About us'),
        leading: Icon(Icons.info),
      ),
      ListTile(
        title: Text('Privacy policy'),
        leading: Icon(Icons.lock),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Dashboard')),
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        // shadowColor: null,
        title: const Text('Dashboard'),
        // leading: Icon(Icons.settings)
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        height: null,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            // RecentReports()
            ElevatedButton(
                onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ReportsPage()),
                      )
                    },
                child: const Text('View reports'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50), // NEW
                )),
            SizedBox(
              height: 16.0,
            ),
            ElevatedButton(
                onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddReport()),
                      )
                    },
                child: const Text('Add  reports'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50), // NEW
                )),
            SizedBox(
              height: 16.0,
            ),
            ElevatedButton(
                onPressed: () => {},
                child: const Text('View recent reports'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50), // NEW
                )),
            SizedBox(
              height: 16.0,
            ),
            ElevatedButton(
                onPressed: () => {},
                child: const Text('Government Alerts'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50), // NEW
                )),
            // ListView(
            //   children: [
            //     // ReportCard(
            //     //     title: 'Category name',
            //     //     description: 'description',
            //     //     image: 'https://picsum.photos/250?image=9'),
            //     // ReportCard(
            //     //     title: 'Category name',
            //     //     description: 'description',
            //     //     image: 'https://picsum.photos/250?image=9'),
            //     // ReportCard(
            //     //     title: 'Category name',
            //     //     description: 'description',
            //     //     image: 'https://picsum.photos/250?image=9')
            //   ],
            // )
          ],
        ),
      ),
      drawer: Drawer(child: drawerItemsList),
    );
  }
}
