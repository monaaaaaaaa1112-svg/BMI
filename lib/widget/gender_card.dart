import 'package:bmi_calc/core/color.dart';
import 'package:flutter/material.dart';

class GenderCard extends StatelessWidget {
  const GenderCard({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
    required this.isSelected,
  });
  final String text;
  final IconData icon;
  final Function() onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: (isSelected) ? ColorApp.primaryColor : ColorApp.cardColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 100, color: ColorApp.whiteColor),
              Text(
                text,
                style: TextStyle(fontSize: 30, color: ColorApp.whiteColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
