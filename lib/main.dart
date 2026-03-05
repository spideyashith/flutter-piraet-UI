import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const PirateAdventureApp());
}

class PirateAdventureApp extends StatelessWidget {
  const PirateAdventureApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pirate Adventure',
      theme: ThemeData.dark(),
      home: const StartScreen(),
    );
  }
}

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen>
    with TickerProviderStateMixin {

  late AnimationController shipFloatController;
  late AnimationController shipSailController;
  late AnimationController glowController;

  late Animation<double> floatingAnimation;
  late Animation<double> sailAnimation;
  late Animation<double> glowAnimation;

  List<Star> stars = [];
  Timer? timer;

  bool startJourney = false;

  @override
  void initState() {
    super.initState();

    shipFloatController =
    AnimationController(vsync: this, duration: const Duration(seconds: 3))
      ..repeat(reverse: true);

    floatingAnimation =
        Tween<double>(begin: -12, end: 12).animate(shipFloatController);

    shipSailController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));

    sailAnimation = Tween<double>(begin: 0, end: 500).animate(shipSailController);

    glowController =
    AnimationController(vsync: this, duration: const Duration(seconds: 2))
      ..repeat(reverse: true);

    glowAnimation = Tween<double>(begin: 10, end: 30).animate(glowController);

    generateStars();

    timer = Timer.periodic(const Duration(milliseconds: 600), (_) {
      setState(() {
        for (var star in stars) {
          star.opacity = Random().nextDouble();
        }
      });
    });
  }

  void generateStars() {
    for (int i = 0; i < 30; i++) {
      stars.add(
        Star(
          x: Random().nextDouble(),
          y: Random().nextDouble() * 0.5,
          opacity: Random().nextDouble(),
        ),
      );
    }
  }

  void startAdventure() {
    setState(() {
      startJourney = true;
    });

    shipFloatController.stop();
    shipSailController.forward();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const PirateMapScreen()),
      );
    });
  }

  @override
  void dispose() {
    shipFloatController.dispose();
    shipSailController.dispose();
    glowController.dispose();
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [

          const OceanBackground(),

          ...stars.map((star) {
            return Positioned(
              left: star.x * MediaQuery.of(context).size.width,
              top: star.y * MediaQuery.of(context).size.height,
              child: Opacity(
                opacity: star.opacity,
                child: const Icon(Icons.star, size: 6, color: Colors.white),
              ),
            );
          }),

          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  AnimatedBuilder(
                    animation: glowController,
                    builder: (context, child) {
                      return Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withOpacity(0.3),
                              blurRadius: glowAnimation.value,
                            )
                          ],
                        ),
                        child: child,
                      );
                    },
                    child: Image.asset(
                      "assets/images/pirate_logo.png",
                      width: 280,
                    ),
                  ),

                  const SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: startAdventure,
                    child: const Text("Start Adventure"),
                  ),
                ],
              ),
            ),
          ),

          AnimatedBuilder(
            animation: startJourney ? shipSailController : shipFloatController,
            builder: (context, child) {

              double xOffset = startJourney ? sailAnimation.value : 0;
              double yOffset = startJourney ? 0 : floatingAnimation.value;

              return Positioned(
                bottom: 40,
                left: MediaQuery.of(context).size.width / 2 - 120 + xOffset,
                child: Transform.translate(
                  offset: Offset(0, yOffset),
                  child: child,
                ),
              );
            },
            child: Image.asset("assets/images/ship.png", width: 250),
          ),
        ],
      ),
    );
  }
}

class PirateMapScreen extends StatefulWidget {
  const PirateMapScreen({super.key});

  @override
  State<PirateMapScreen> createState() => _PirateMapScreenState();
}

class _PirateMapScreenState extends State<PirateMapScreen>
    with TickerProviderStateMixin {

  late AnimationController pulseController;
  late AnimationController shipController;
  late AnimationController sparkleController;

  late Animation<double> pulseAnimation;

  double shipX = 80;
  double shipY = 260;

  bool showTreasure = false;

  List<Particle> particles = [];

  @override
  void initState() {
    super.initState();

    pulseController =
    AnimationController(vsync: this, duration: const Duration(seconds: 1))
      ..repeat(reverse: true);

    pulseAnimation =
        Tween<double>(begin: 1.0, end: 1.3).animate(pulseController);

    shipController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    sparkleController =
    AnimationController(vsync: this, duration: const Duration(seconds: 2))
      ..repeat();

    generateParticles();
  }

  void generateParticles() {
    for (int i = 0; i < 25; i++) {
      particles.add(Particle());
    }
  }

  @override
  void dispose() {
    pulseController.dispose();
    shipController.dispose();
    sparkleController.dispose();
    super.dispose();
  }

  void travelTo(double x, double y, String island) {

    double startX = shipX;
    double startY = shipY;

    shipController.reset();

    shipController.addListener(() {

      double t = shipController.value;

      shipX = startX + (x - startX) * t;
      shipY = startY + (y - startY) * t;

      setState(() {});
    });

    shipController.forward();

    Future.delayed(const Duration(seconds: 2), () {

      if (island == "Sky Island") {
        setState(() {
          showTreasure = true;
        });
      }

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => MissionScreen(islandName: island),
        ),
      );

    });
  }

  Widget islandMarker(double left, double top, String name, String image) {
    return Positioned(
      left: left,
      top: top,
      child: GestureDetector(
        onTap: () => travelTo(left, top, name),
        child: AnimatedBuilder(
          animation: pulseController,
          builder: (context, child) {
            return Transform.scale(
              scale: pulseAnimation.value,
              child: child,
            );
          },
          child: Image.asset(image, width: 90),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [

          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/map_bg.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          CustomPaint(
            size: Size.infinite,
            painter: MapPathPainter(),
          ),

          const Positioned(
            top: 80,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                "Pirate Adventure Map",
                style: TextStyle(fontSize: 28, color: Colors.black),
              ),
            ),
          ),

          islandMarker(80, 260, "East Blue", "assets/images/island1.png"),
          islandMarker(260, 380, "Grand Line", "assets/images/island2.png"),
          islandMarker(160, 520, "Sky Island", "assets/images/island3.png"),

          Positioned(
            left: shipX,
            top: shipY,
            child: Image.asset("assets/images/ship.png", width: 110),
          ),

          if (showTreasure)
            Positioned(
              left: 240,
              top: 480,
              child: Stack(
                alignment: Alignment.center,
                children: [

                  AnimatedBuilder(
                    animation: sparkleController,
                    builder: (context, child) {
                      return CustomPaint(
                        size: const Size(120, 120),
                        painter: SparklePainter(particles),
                      );
                    },
                  ),

                  Image.asset(
                    "assets/images/treasure.png",
                    width: 120,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class MissionScreen extends StatelessWidget {

  final String islandName;

  const MissionScreen({super.key, required this.islandName});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [

          const OceanBackground(),

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text(
                  islandName,
                  style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 20),

                const Text(
                  "Mission: Find the hidden treasure!",
                  style: TextStyle(fontSize: 20),
                ),

                const SizedBox(height: 40),

                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Return to Map"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class OceanBackground extends StatefulWidget {
  const OceanBackground({super.key});

  @override
  State<OceanBackground> createState() => _OceanBackgroundState();
}

class _OceanBackgroundState extends State<OceanBackground>
    with SingleTickerProviderStateMixin {

  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller =
    AnimationController(vsync: this, duration: const Duration(seconds: 20))
      ..repeat();
  }

  @override
  Widget build(BuildContext context) {

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {

        double offset = controller.value * 40;

        return Transform.translate(
          offset: Offset(offset, 0),
          child: child,
        );
      },
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/ocean_bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class Particle {
  double x = Random().nextDouble() * 200;
  double y = Random().nextDouble() * 200;
  double radius = Random().nextDouble() * 3 + 2;
}

class SparklePainter extends CustomPainter {

  List<Particle> particles;

  SparklePainter(this.particles);

  @override
  void paint(Canvas canvas, Size size) {

    final paint = Paint()..color = Colors.amber;

    for (var p in particles) {
      canvas.drawCircle(Offset(p.x, p.y), p.radius, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class MapPathPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {

    final paint = Paint()
      ..color = Colors.brown.shade900
      ..style = PaintingStyle.fill;

    final path = Path();

    path.moveTo(100, 280);
    path.quadraticBezierTo(200, 330, 280, 400);
    path.quadraticBezierTo(220, 480, 180, 540);

    final metrics = path.computeMetrics();

    for (final metric in metrics) {
      for (double distance = 0; distance < metric.length; distance += 12) {

        final tangent = metric.getTangentForOffset(distance);

        if (tangent != null) {
          canvas.drawCircle(tangent.position, 2.5, paint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class Star {
  double x;
  double y;
  double opacity;

  Star({
    required this.x,
    required this.y,
    required this.opacity,
  });
}