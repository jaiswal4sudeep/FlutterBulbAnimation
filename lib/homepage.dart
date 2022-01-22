import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLightOn = false;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    const Color componentColor = Color(0xFF211F20);
    const Color bulbOnColor = Color(0xFFFFFDF7);
    const Color bulbOffColor = Color(0xFFFDE7A2);
    const Color bgColor = Color(0xFFF9C317);

    return Scaffold(
      backgroundColor: bgColor,
      body: Stack(
        children: [
          Positioned(
            left: (screenWidth / 2) - 4,
            child: Container(
              width: 8,
              height: 150,
              color: componentColor,
            ),
          ),
          Positioned(
            left: (screenWidth / 2) - 30,
            top: 150,
            child: Container(
              width: 60,
              height: 30,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(5),
                ),
                color: componentColor,
              ),
            ),
          ),
          Positioned(
            left: (screenWidth / 2) - 45,
            top: 180,
            child: Container(
              width: 90,
              height: 30,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(5),
                ),
                color: componentColor,
              ),
            ),
          ),
          Positioned(
            left: (screenWidth / 2) - 25,
            top: 210,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              width: 50,
              height: 25,
              color: isLightOn ? bulbOnColor : bulbOffColor,
            ),
          ),
          Positioned(
            left: (screenWidth / 2) - 32.5,
            top: 225,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              width: 65,
              height: 20,
              color: isLightOn ? bulbOnColor : bulbOffColor,
            ),
          ),
          Positioned(
            left: (screenWidth / 2) - 66,
            top: 209,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: bgColor,
              ),
            ),
          ),
          Positioned(
            left: (screenWidth / 2) + 25,
            top: 209,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: bgColor,
              ),
            ),
          ),
          ClipPath(
            clipper: TrapezoidClipper(),
            child: Positioned(
              top: 284,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 1000),
                width: screenWidth,
                decoration: BoxDecoration(
                  gradient: isLightOn
                      ? LinearGradient(
                          colors: [
                            Colors.white.withOpacity(0.9),
                            Colors.white.withOpacity(0.3),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        )
                      : null,
                ),
              ),
            ),
          ),
          Positioned(
            left: (screenWidth / 2) - 69.8,
            top: 234,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              width: 127 * 1.1,
              height: 123 * 1.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: isLightOn ? bulbOnColor : bulbOffColor,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: SizedBox(
              width: screenWidth,
              height: 100,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    isLightOn = !isLightOn;
                  });
                },
                icon: isLightOn
                    ? const Icon(Icons.toggle_on)
                    : const Icon(Icons.toggle_off),
                iconSize: 72,
                color: isLightOn ? Colors.white : componentColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TrapezoidClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(size.width * 0.305, size.height * 0.41);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width * 0.695, size.height * 0.41);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
