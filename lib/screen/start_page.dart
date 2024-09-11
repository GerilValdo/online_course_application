import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../screen/register_page.dart';
import '../widgets/custom_painter.dart';

class StartPage extends StatefulWidget {
  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
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
    final myAppBar = AppBar(
      title: Text('Online Course'),
    );
    final heightBody = heightApp -
        myAppBar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: myAppBar,
      backgroundColor: Colors.lightGreen[400],
      body: Stack(
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
                height: heightBody * 0.07,
              ),
              Text(
                'Tempat belajar online terlengkap & up-to-date',
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 28, color: Colors.white),
              ),
              SizedBox(
                height: heightBody * 0.06,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, RegisterPage.routeName);
                },
                child: Text(
                  'MULAI',
                  style: TextStyle(fontSize: 40),
                ),
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.green[400],
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 5)),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: itemImage.asMap().entries.map(
                    (entry) {
                      return GestureDetector(
                        onTap: () => _controller.animateToPage(entry.key),
                        child: Container(
                          width: 12,
                          height: 12,
                          margin: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 4.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white.withOpacity(
                                  _current == entry.key ? 0.9 : 0.4)),
                        ),
                      );
                    },
                  ).toList(),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
