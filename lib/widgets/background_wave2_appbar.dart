import 'package:flutter/material.dart';

class WaveClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 100);

    var firstControlPoint = Offset(size.width * 2 / 6, size.height - 130);
    var firstEndPoint = Offset(size.width * 11 / 20, size.height - 56.5);

    path.quadraticBezierTo(
      firstControlPoint.dx,
      firstControlPoint.dy,
      firstEndPoint.dx,
      firstEndPoint.dy,
    );

    var secondControlPoint = Offset(size.width * 5 / 8, size.height - 50);
    var secondEndPoint = Offset(size.width * 6 / 8, size.height - 23);

    path.quadraticBezierTo(
      secondControlPoint.dx,
      secondControlPoint.dy,
      secondEndPoint.dx,
      secondEndPoint.dy,
    );

    var thirdControlPoint = Offset(size.width * 7 / 8, size.height);
    var thirdEndPoint = Offset(size.width, size.height);

    path.quadraticBezierTo(
      thirdControlPoint.dx,
      thirdControlPoint.dy,
      thirdEndPoint.dx,
      thirdEndPoint.dy,
    );

    path.lineTo(size.width + 50, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
