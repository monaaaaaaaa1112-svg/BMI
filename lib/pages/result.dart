import 'package:bmi_calc/core/color.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.result});
  final double result;

  Status getStatus() {
    if (result <= 18.5) {
      return Status('underweight', Colors.blue);
    } else if (result <= 24) {
      return Status('Healthy Weight', Colors.green);
    } else if (result <= 29) {
      return Status('Overweight', Colors.orange);
    } else {
      return Status('Obese', Colors.red);
    }
  }

  String interpretation() {
    if (result <= 18.5) {
      return '"You are underweight. Eat well and stay healthy 🥗💪';
    } else if (result <= 24) {
      return 'Great! Your weight is healthy. Keep it up😄✅';
    } else if (result <= 29) {
      return 'Slightly overweight. Try exercise and healthy food🍎🏃‍♂️';
    } else {
      return 'High weight. Consider diet and medical advice ⚠️🏥';
    }
  }

  @override
  Widget build(BuildContext context) {
    Status status = getStatus();
    return Scaffold(
      backgroundColor: ColorApp.backgroundColor,
      appBar: AppBar(
        backgroundColor: ColorApp.backgroundColor,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: ColorApp.whiteColor,
            size: 24,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Your result',
                style: TextStyle(
                  fontSize: 32,
                  color: ColorApp.whiteColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 30),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: ColorApp.cardColor,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      status.text,
                      style: TextStyle(color: status.color, fontSize: 25),
                    ),
                    SizedBox(height: 10),
                    Text(
                      result.toStringAsFixed(2),
                      style: TextStyle(
                        color: ColorApp.whiteColor,
                        fontSize: 90,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      interpretation(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ColorApp.whiteColor,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorApp.primaryColor,
                minimumSize: Size(double.infinity, 100),
              ),
              onPressed: () {},
              child: const Text(
                "Recalculate",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: ColorApp.whiteColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Status {
  final String text;
  final Color color;
  Status(this.text, this.color);
}
