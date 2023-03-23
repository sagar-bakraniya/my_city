import 'package:flutter/material.dart';

class ImagePlaceholder extends StatelessWidget {
  const ImagePlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Icon(
        Icons.image,
        size: 150.0,
        color: Colors.lightBlue,
      ),
    );
  }
}
