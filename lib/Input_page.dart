import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'BMI CALCULATOR',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Carduse(),
                ),
                Expanded(
                  child: Carduse(),
                ),
              ],
            ),
          ),
          Expanded(
            child: Rectanglethird(),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Carduse(),
                ),
                Expanded(
                  child: Carduse(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Carduse extends StatelessWidget {
  const Carduse({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      height: 200,
      width: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xFF0A0E33),
      ),
    );
  }
}

class Rectanglethird extends StatelessWidget {
  const Rectanglethird({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      height: 200,
      width: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xFF0A0E33),
      ),
    );
    ;
  }
}
