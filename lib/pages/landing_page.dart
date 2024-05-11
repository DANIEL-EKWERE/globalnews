import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:globalnews/pages/home.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Material(
              borderRadius: BorderRadius.circular(30),
              elevation: 3.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  'assets/images/images.jpg',
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                  height: (MediaQuery.of(context).size.width / 100) * 140,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'News from around the\n       world for you.',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 26),
            ),
            const SizedBox(height: 20),
            const Text(
              'Best time to read,take your time to read \n            a little more of this world',
              style: TextStyle(
                  color: Colors.black45,
                  fontWeight: FontWeight.w500,
                  fontSize: 18),
            ),
            const SizedBox(height: 40),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => Home(),
                    ));
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 1.2,
                child: Material(
                  borderRadius: BorderRadius.circular(20),
                  elevation: 5.0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: const Text(
                        'Get Started',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
