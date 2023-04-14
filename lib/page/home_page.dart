import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tugas_pbm_pertemuan_6/page/register_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key = null, required this.username});
  final username;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  late double _bmi = 0.0;

  void _calculateBMI() {
    double height = double.parse(_heightController.text);
    double weight = double.parse(_weightController.text);
    double heightInMeters = height / 100;

    double bmi = weight / (heightInMeters * heightInMeters);
    setState(() {
      _bmi = bmi;
    });
  }

  @override
  Widget build(BuildContext context) {
    String cBMI;
    if (_bmi >= 28)
      cBMI = "Obese";
    else if (_bmi >= 23)
      cBMI = "Overweight";
    else if (_bmi >= 17.5)
      cBMI = "Normal";
    else
      cBMI = "Underweight";
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Icon(
          Icons.home,
          color: Colors.white,
        ),
        title: Text(widget.username[0]),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 60,
              color: Colors.blue,
              alignment: Alignment.center,
              child: Text(
                'MENGHITUNG BMI',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: _heightController,
                      keyboardType: TextInputType.number,
                      maxLength: 3,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      decoration: InputDecoration(
                        suffix: Text('cm'),
                        filled: true,
                        hintText: 'Tinggi',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextField(
                      controller: _weightController,
                      keyboardType: TextInputType.number,
                      maxLength: 3,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      decoration: InputDecoration(
                        suffix: Text('kg'),
                        filled: true,
                        hintText: 'Berat',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            MaterialButton(
              padding: EdgeInsets.all(10),
              minWidth: 200,
              color: Colors.blue,
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 500),
                child: Text(
                  "Hitung",
                  key: ValueKey<bool>(true),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                transitionBuilder: (child, animation) =>
                    ScaleTransition(child: child, scale: animation),
              ),
              onPressed: _calculateBMI,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Your BMI is: ${_bmi.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 20),
                ),
                Text(cBMI)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
