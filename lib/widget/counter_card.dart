import 'package:bmi_calc/core/color.dart';
import 'package:flutter/material.dart';

class CounterCard extends StatelessWidget {
  const CounterCard({
    super.key,
    required this.text,
    required this.number,
    required this.onAdd,
    required this.onRemove,
  });
  final String text;
  final int number;
  final Function() onAdd;
  final Function() onRemove;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: ColorApp.cardColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 5,
          children: [
            Text(
              text,
              style: TextStyle(fontSize: 30, color: ColorApp.whiteColor),
            ),
            Text(
              number.toString(),
              style: TextStyle(
                fontSize: 30,
                color: ColorApp.whiteColor,
                fontWeight: FontWeight.w800,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton.filled(
                  onPressed: onRemove,
                  icon: Icon(Icons.remove),
                  color: ColorApp.whiteColor,
                ),
                IconButton.filled(onPressed: onAdd, icon: Icon(Icons.add)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
