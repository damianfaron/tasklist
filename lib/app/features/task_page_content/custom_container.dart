import 'package:flutter/material.dart';
import 'package:tasklist/app/features/presentation/colors/app_colors.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    required this.description,
    required this.title,
    super.key,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [
            AppColors.navColor,
            AppColors.navColor2,
          ], begin: Alignment.topCenter, end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.black, width: 1.5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 10),
              Text(
                description,
                // rozciągnij tekst opisu
                // textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
