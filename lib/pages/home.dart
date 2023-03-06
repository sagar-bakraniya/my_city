import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 100);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 100);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        shadowColor: null,
        title: const Text('Dashboard'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () => {},
                child: const Text('View reports'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50), // NEW
                )),
            SizedBox(
              height: 16.0,
            ),
            ElevatedButton(
                onPressed: () => {},
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
          ],
        ),
      ),
    );
  }
}
