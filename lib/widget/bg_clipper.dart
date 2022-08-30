import 'package:flutter/material.dart';

class BgClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();



    path.lineTo(0, size.height);

    path.lineTo(size.width / 2, size.height - 60);


    path.lineTo(size.width, size.height);

    path.lineTo(size.width, 0);

    path.close();

    // final height=250.0;
    //  path.moveTo(0, 0);
    //  path.lineTo(0, height);
    //  path.quadraticBezierTo(0, height/2, 0, height/1.9);
    //  path.quadraticBezierTo(50, height +(0.2 * height), size.width/2, height -(0.30*height));
    //  path.quadraticBezierTo(size.width -50, height +(0.1* height), size.width, height/1.1);
    //  path.lineTo(size.width, 0);
    //  path.close();

    // path.lineTo(0, size.height);
    // var curXPos = 0.0;
    // var curYPos = size.height;
    // var increment = size.width / 20;
    // while (curXPos < size.width) {
    //   curXPos += increment;
    //   path.arcToPoint(Offset(curXPos, curYPos), radius: Radius.circular(5));
    // }
    // path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
