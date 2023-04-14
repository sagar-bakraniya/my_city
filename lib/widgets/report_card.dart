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

class ImageTitleSubtitleWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;

  ImageTitleSubtitleWidget({
    required this.imagePath,
    required this.title,
    required this.subtitle,
  });

  Widget ReportCardView() {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(18.0)),
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 2,
                child: Image.network(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 16, top: 8, bottom: 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                title,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22,
                                    color: Color.fromARGB(255, 80, 79, 79)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text(
                                  subtitle,
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(right: 16, top: 8),
                    //   child: Column(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     crossAxisAlignment: CrossAxisAlignment.end,
                    //     children: <Widget>[
                    //       Text(
                    //         this.subtitle,
                    //         textAlign: TextAlign.left,
                    //         style: TextStyle(
                    //           fontWeight: FontWeight.w600,
                    //           fontSize: 22,
                    //         ),
                    //       ),
                    //       // Text(
                    //       //   '/per night',
                    //       //   style: TextStyle(
                    //       //       fontSize: 14,
                    //       //       color: Colors.grey.withOpacity(0.8)),
                    //       // ),
                    //     ],
                    // ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
          // Positioned(
          //   top: 8,
          //   right: 8,
          //   child: Material(
          //     color: Colors.transparent,
          //     child: InkWell(
          //       borderRadius: const BorderRadius.all(
          //         Radius.circular(32.0),
          //       ),
          //       onTap: () {},
          //       child: Padding(
          //         padding: const EdgeInsets.all(8.0),
          //         child: Icon(
          //           Icons.favorite_border,
          //           color: HotelAppTheme.buildLightTheme()
          //               .primaryColor,
          //         ),
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(16.0)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.1),
                offset: const Offset(4, 4),
                blurRadius: 16,
              ),
            ]),
        child: ReportCardView(),
      ),
    );
  }
}
