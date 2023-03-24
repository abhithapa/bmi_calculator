import 'package:flutter/material.dart';

class GenderWidget extends StatelessWidget {
  const GenderWidget({
    super.key,
    required this.icon,
    required this.gender,
    required this.iconColor,
    required this.textColor,
  });

  final IconData icon;
  final String gender;

  final Color iconColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 10),
      height: 150,
      width: 150,
      decoration: BoxDecoration(
        color: Colors.grey.shade700,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: iconColor,
            size: 75,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            gender.toUpperCase(),
            style: TextStyle(
                color: textColor, fontWeight: FontWeight.w600, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
