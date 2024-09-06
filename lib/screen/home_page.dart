import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Online Course'),
      ),
      backgroundColor: Colors.lightGreen[400],
      body: WaveBackground(),
    );
  }
}

class WaveBackground extends StatefulWidget {
  @override
  State<WaveBackground> createState() => _WaveBackgroundState();
}

class _WaveBackgroundState extends State<WaveBackground> {
  final CarouselSliderController _controller = CarouselSliderController();
  int _current = 0;
  final List<Widget> itemImage = [
    Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.contain,
              image: AssetImage('assets/images/handphone.png'))),
    ),
    Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.contain,
              image: AssetImage('assets/images/computer.png'))),
    ),
    Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.contain,
              image: AssetImage('assets/images/mentor.png'))),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final heightApp = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Positioned.fill(
          child: CustomPaint(
            painter: WavePainter(),
          ),
        ),
        Column(
          children: [
            CarouselSlider(
              items: itemImage,
              carouselController: _controller,
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Materi yang selalu up-to-date dengan dunia industry',
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 28, color: Colors.white),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'START',
                style: TextStyle(fontSize: 40),
              ),
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.green[400],
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 5)),
            ),
            SizedBox(
              height: heightApp * 0.15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: itemImage.asMap().entries.map(
                (entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: 12,
                      height: 12,
                      margin:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white
                              .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                    ),
                  );
                },
              ).toList(),
            ),
          ],
        ),
      ],
    );
  }
}

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
