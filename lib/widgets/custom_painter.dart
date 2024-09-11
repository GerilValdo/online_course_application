import 'package:flutter/material.dart';

class WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.fill;

    final Path path = Path();

    path.moveTo(0, size.height * 1.1);

    path.quadraticBezierTo(
      size.width * 0.45,
      size.height * 1.03,
      size.width * 0.55,
      size.height * 0.70,
    );
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * -0.55,
      size.width * 5,
      size.height * 1.10,
    );

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
