// work_experience_card.dart
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WorkExperienceCard extends StatelessWidget {
  final String company;
  final String role;
  final String duration;
  final String location;
  final List<String> responsibilities;

  const WorkExperienceCard({
    Key? key,
    required this.company,
    required this.role,
    required this.duration,
    required this.location,
    required this.responsibilities,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color indigoColor = Colors.indigo;
    const Color textColor = Colors.black87;

    return LayoutBuilder(
      builder: (context, constraints) {
        double cardWidth =
            constraints.maxWidth <
                600 // mobile breakpoint
            ? double.infinity
            : MediaQuery.of(context).size.width * 0.7;

        return Container(
          width: cardWidth,
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            margin: const EdgeInsets.symmetric(vertical: 12),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Company and Role
                  constraints.maxWidth < 600
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              company,
                              style: Theme.of(context).textTheme.titleLarge
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: indigoColor,
                                  ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              role,
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(color: indigoColor),
                            ),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                company,
                                style: Theme.of(context).textTheme.titleLarge
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: indigoColor,
                                    ),
                              ),
                            ),
                            Text(
                              role,
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(color: indigoColor),
                            ),
                          ],
                        ),
                  const SizedBox(height: 4),

                  // Duration and Location
                  constraints.maxWidth < 600
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              duration,
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(
                                    fontStyle: FontStyle.italic,
                                    color: textColor,
                                  ),
                            ),
                            Text(
                              location,
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(color: textColor),
                            ),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              duration,
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(
                                    fontStyle: FontStyle.italic,
                                    color: textColor,
                                  ),
                            ),
                            Text(
                              location,
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(color: textColor),
                            ),
                          ],
                        ),
                  const Divider(height: 20, thickness: 1),

                  // Responsibilities
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: responsibilities
                        .map(
                          (point) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.check_circle_outline,
                                  size: 18,
                                  color: Colors.indigo,
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    point,
                                    style: Theme.of(context).textTheme.bodyLarge
                                        ?.copyWith(color: textColor),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget buildSkillCategory(
  String title,
  List<String> skills,
  String iconPath, // New parameter for Lottie icon
) {
  return Card(
    elevation: 6, // Increased elevation for a floating effect
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
      side: BorderSide(color: Colors.indigo.shade100, width: 1.5),
    ),
    margin: const EdgeInsets.only(bottom: 25),
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: 40,
                height: 40,
                child: Lottie.asset(iconPath, fit: BoxFit.contain),
              ),
              const SizedBox(width: 15),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w900, // Extra bold
                  fontSize: 22,
                  color: Colors.indigo[800],
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
          const Divider(height: 30, thickness: 1, color: Colors.grey),
          Wrap(
            spacing: 12,
            runSpacing: 10,
            children: skills
                .map(
                  (skill) => Chip(
                    label: Text(
                      skill,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    backgroundColor: Colors.indigo[50],
                    shape: StadiumBorder(
                      side: BorderSide(color: Colors.indigo.shade200),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    ),
  );
}
