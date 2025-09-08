import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_portfolio/animation.dart';
import 'package:my_portfolio/widgets.dart';
import 'package:my_portfolio/workexp.dart';

const Color textColor = Colors.black87;

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeInAnimation;
  late Animation<Offset> _slideAnimation;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
      _animationController.forward();
    });

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _fadeInAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_animationController);

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.1), end: Offset.zero).animate(
          CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
        );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: _isLoading
          ? Center(
              child: Opacity(
                opacity: 0.4,
                child: Lottie.asset(
                  'assets/Loading Circle Animation.json',
                  fit: BoxFit.cover,
                  height: 100,
                  width: 100,
                ),
              ),
            )
          : Stack(
              children: [
                Positioned.fill(
                  top: 0,
                  child: Opacity(
                    opacity: 0.03,
                    child: Lottie.asset(
                      'assets/technology.json',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                FadeTransition(
                  opacity: _fadeInAnimation,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(20),
                      child: Center(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(
                            maxWidth: double.infinity,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 40,
                                  horizontal: 20,
                                ),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.teal.shade600,
                                      Colors.cyan.shade400,
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.indigo.withOpacity(0.3),
                                      blurRadius: 15,
                                      offset: const Offset(0, 6),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    JumpingText(
                                      "👋 Welcome to My Portfolio",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium
                                          ?.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),

                                    const SizedBox(height: 10),
                                    Text(
                                      "Hi, I'm Gowtham Mani — Flutter Developer specializing in building beautiful, high-performance mobile apps for iOS and Android.",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                            color: Colors.white.withOpacity(
                                              0.9,
                                            ),
                                            height: 1.5,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 30),
                              buildHeader(context),
                              const SizedBox(height: 30),
                              sectionTitle("PROFILE SUMMARY"),
                              Text(
                                "Passionate and results-driven Flutter Developer with nearly 3 years of "
                                "hands-on experience crafting high-performance, cross-platform mobile applications. "
                                "Proficient in Dart, Firebase, RESTful APIs, and state management solutions "
                                "including BLoC, Provider, and GetX. Skilled in building scalable and maintainable apps "
                                "with clean architecture and delivering pixel-perfect UIs for both Android and iOS.",
                                style: Theme.of(context).textTheme.bodyLarge
                                    ?.copyWith(color: textColor),
                              ),
                              const SizedBox(height: 30),
                              sectionTitle("WORK EXPERIENCE"),
                              // Use the new widget for each job
                              LayoutBuilder(
                                builder: (context, constraints) {
                                  // If width is small (like mobile), stack vertically
                                  if (constraints.maxWidth < 600) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        WorkExperienceCard(
                                          company:
                                              "TDIT SOLUTION PRIVATE LIMITED",
                                          role: "FLUTTER DEVELOPER",
                                          duration: "July 2025 – Aug 2025",
                                          location: "Chennai",
                                          responsibilities: [
                                            "Developed a responsive and user-friendly UI for the SMART SORT recycling app, allowing requestors to raise pickup requests for their mixed material waste to either collectors or nearby collection centers.",
                                            "Integrated REST APIs to manage request workflows between Requestors, Collectors, Collection Centers, and Collector Supervisors, ensuring smooth communication and real-time data sync.",
                                            "Implemented live location tracking using SignalR and Geolocator, enabling requestors to view real-time movement and estimated arrival of assigned collectors.",
                                          ],
                                        ),
                                        WorkExperienceCard(
                                          company:
                                              "NITHRA APPS INDIA PRIVATE LIMITED",
                                          role: "JUNIOR FLUTTER DEVELOPER",
                                          duration: "April 2023 – June 2025",
                                          location: "Tiruchengode",
                                          responsibilities: [
                                            "Developed a dynamic, cross-platform NITHRA Matrimony application using Flutter, enabling users to search, filter, and connect with compatible profiles. Integrated key features such as interest requests, photo access permissions, and preference-based matching.",
                                            "Built reusable, responsive UI components with Flutter for both Android and iOS, ensuring consistent performance and native experience across devices.",
                                            "Contributed to the development of Nithra products such as Jobs and Calendar, working across all stages from design to deployment.",
                                            "Collaborated with cross-functional teams and contributed to project development using Agile methodologies.",
                                          ],
                                        ),
                                        WorkExperienceCard(
                                          company:
                                              "CETAS INFORMATION TECHNOLOGY",
                                          role: "INTERN",
                                          duration: "March 2022 – June 2022",
                                          location: "Chennai",
                                          responsibilities: [
                                            "Developed responsive and user-friendly webpages using HTML, CSS, and JavaScript.",
                                            "Created clean and interactive layouts with basic animations and UI components.",
                                            "Gained hands-on experience in building forms, handling user input, and ensuring cross-browser compatibility.",
                                          ],
                                        ),

                                        const SizedBox(height: 20),
                                        // Show image below for mobile
                                        RotatedBox(
                                          quarterTurns: 1,
                                          child: Image.asset(
                                            "assets/wrk_ecp.png",
                                            height: 200,
                                          ),
                                        ),
                                      ],
                                    );
                                  } else {
                                    // For larger screen (web/tablet), keep Row layout
                                    return Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              // sectionTitle("WORK EXPERIENCE"),
                                              WorkExperienceCard(
                                                company:
                                                    "TDIT SOLUTION PRIVATE LIMITED",
                                                role: "FLUTTER DEVELOPER",
                                                duration:
                                                    "July 2025 – Aug 2025",
                                                location: "Chennai",
                                                responsibilities: [
                                                  "Developed a responsive and user-friendly UI for the SMART SORT recycling app, allowing requestors to raise pickup requests for their mixed material waste to either collectors or nearby collection centers.",
                                                  "Integrated REST APIs to manage request workflows between Requestors, Collectors, Collection Centers, and Collector Supervisors, ensuring smooth communication and real-time data sync.",
                                                  "Implemented live location tracking using SignalR and Geolocator, enabling requestors to view real-time movement and estimated arrival of assigned collectors.",
                                                ],
                                              ),
                                              WorkExperienceCard(
                                                company:
                                                    "NITHRA APPS INDIA PRIVATE LIMITED",
                                                role:
                                                    "JUNIOR FLUTTER DEVELOPER",
                                                duration:
                                                    "April 2023 – June 2025",
                                                location: "Tiruchengode",
                                                responsibilities: [
                                                  "Developed a dynamic, cross-platform NITHRA Matrimony application using Flutter, enabling users to search, filter, and connect with compatible profiles. Integrated key features such as interest requests, photo access permissions, and preference-based matching.",
                                                  "Built reusable, responsive UI components with Flutter for both Android and iOS, ensuring consistent performance and native experience across devices.",
                                                  "Contributed to the development of Nithra products such as Jobs and Calendar, working across all stages from design to deployment.",
                                                  "Collaborated with cross-functional teams and contributed to project development using Agile methodologies.",
                                                ],
                                              ),
                                              WorkExperienceCard(
                                                company:
                                                    "CETAS INFORMATION TECHNOLOGY",
                                                role: "INTERN",
                                                duration:
                                                    "March 2022 – June 2022",
                                                location: "Chennai",
                                                responsibilities: [
                                                  "Developed responsive and user-friendly webpages using HTML, CSS, and JavaScript.",
                                                  "Created clean and interactive layouts with basic animations and UI components.",
                                                  "Gained hands-on experience in building forms, handling user input, and ensuring cross-browser compatibility.",
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),

                                        RotatedBox(
                                          quarterTurns: 1,
                                          child: Image.asset(
                                            "assets/wrk_ecp.png",
                                            height: 250,
                                          ),
                                        ),
                                      ],
                                    );
                                  }
                                },
                              ),

                              /// Education
                              const SizedBox(height: 30),

                              sectionTitle("SKILLS"),

                              buildSkillCategory(
                                "Programming",
                                ["Dart", "Kotlin"],
                                Icons.code, // A coding icon
                              ),

                              buildSkillCategory(
                                "Tools & Technology",
                                [
                                  "Flutter",
                                  "Firebase",
                                  "Github",
                                  "REST API",
                                  "SQLite",
                                  "Android Studio",
                                  "VS Code",
                                  "Agile",
                                  "CI/CD",
                                ],
                                Icons.build, // A tools icon
                              ),

                              buildSkillCategory(
                                "State Management",
                                [
                                  "BLoC (Business Logic Component)",
                                  "Provider",
                                  "GetX",
                                ],
                                Icons.trending_up, // A "growth" or "trend" icon
                              ),

                              buildSkillCategory(
                                "Soft Skills",
                                [
                                  "Problem-solving",
                                  "Creativity",
                                  "Communication",
                                  "Critical Thinking",
                                  "Analytical Reasoning",
                                  "Teamwork",
                                  "Perseverance",
                                  "Leadership",
                                ],
                                Icons.people, // A people icon
                              ),

                              const SizedBox(height: 30),

                              sectionTitle("EDUCATION"),
                              buildEducation(
                                "EXCEL COLLEGE OF ENGINEERING AND TECHNOLOGY",
                                "Master of Computer Application | Tamilnadu - Komarapalayam",
                              ),
                              buildEducation(
                                "VIB Matric Hr. Sec School",
                                "HSC - 2019 | Tamilnadu - Tiruchengode | Percentage - 70%",
                              ),
                              buildEducation(
                                "VIB Matric Hr. Sec School",
                                "SSLC - 2017 | Tamilnadu - Tiruchengode | Percentage - 93%",
                              ),
                              const SizedBox(height: 30),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  Widget buildEducation(String title, String subtitle) {
    return Card(
      elevation: 2, // Added subtle shadow
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: Icon(Icons.school, color: Colors.indigo[400], size: 30),
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(color: textColor.withOpacity(0.8)),
          ),
        ),
      ),
    );
  }

  Widget buildSkillCategory(
    String title,
    List<String> skills,
    IconData icon, // New parameter for a Material Icon
  ) {
    return Card(
      elevation: 6,
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
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [Colors.indigo.shade200, Colors.indigo.shade500],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.indigo.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Icon(icon, color: Colors.white, size: 24),
                ),
                const SizedBox(width: 15),
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
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
}
