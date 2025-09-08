import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_portfolio/colors.dart';
import 'package:url_launcher/url_launcher.dart';

Widget buildHeader(BuildContext context) {
  return Container(
    color: Colors.grey.shade200,
    padding: const EdgeInsets.all(12),
    child: LayoutBuilder(
      builder: (context, constraints) {
        // Small screen (mobile)
        if (constraints.maxWidth < 600) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile picture
              TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0.95, end: 1.05),
                duration: const Duration(seconds: 2),
                builder: (context, scale, child) {
                  return Transform.scale(
                    scale: scale,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(300),
                      child: Image.asset(
                        'assets/my_pic_portfolio.jpeg',
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
                curve: Curves.easeInOut,
              ),
              const SizedBox(height: 20),

              // Details
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Gowtham Mani",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Flutter Developer | iOS & Android",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.indigo[600],
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Contact
                  Column(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.email,
                            color: Colors.indigo,
                            size: 20,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            "mgowtham795@gmail.com",
                            style: Theme.of(
                              context,
                            ).textTheme.titleMedium?.copyWith(color: textColor),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.phone,
                            color: Colors.indigo,
                            size: 20,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            "9360747090",
                            style: Theme.of(
                              context,
                            ).textTheme.titleMedium?.copyWith(color: textColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Experience: 2.8 Years",
                    style: Theme.of(
                      context,
                    ).textTheme.titleMedium?.copyWith(color: textColor),
                  ),
                  const Divider(height: 20, thickness: 2, color: Colors.indigo),

                  /// Links
                  sectionTitle("LINKS"),
                  buildLink("GitHub", "https://github.com/Gowtham-Mani407"),
                  buildLink(
                    "LinkedIn",
                    "https://www.linkedin.com/in/gowthammani-07a4a022a/",
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ],
          );
        }
        // Large screen (web/tablet)
        else {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile picture
              TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0.95, end: 1.05),
                duration: const Duration(seconds: 2),
                builder: (context, scale, child) {
                  return Transform.scale(
                    scale: scale,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(300),
                      child: Image.asset(
                        'assets/my_pic_portfolio.jpeg',
                        width: 300,
                        height: 300,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
                curve: Curves.easeInOut,
              ),
              const SizedBox(width: 40),

              // Details
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Gowtham Mani",
                          style: Theme.of(context).textTheme.displaySmall
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                letterSpacing: 1.2,
                              ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Flutter Developer | iOS & Android",
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(
                                color: Colors.indigo[600],
                                fontStyle: FontStyle.italic,
                              ),
                        ),
                        const SizedBox(height: 15),

                        Row(
                          children: [
                            const Icon(
                              Icons.email,
                              color: Colors.indigo,
                              size: 20,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              "mgowtham795@gmail.com",
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(color: textColor),
                            ),
                            const SizedBox(width: 20),
                            const Icon(
                              Icons.phone,
                              color: Colors.indigo,
                              size: 20,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              "9360747090",
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(color: textColor),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Experience: 2.8 Years",
                          style: Theme.of(
                            context,
                          ).textTheme.titleMedium?.copyWith(color: textColor),
                        ),
                        const Divider(
                          height: 10,
                          thickness: 2,
                          color: Colors.indigo,
                        ),

                        sectionTitle("LINKS"),
                        buildLink(
                          "GitHub",
                          "https://github.com/Gowtham-Mani407",
                        ),
                        buildLink(
                          "LinkedIn",
                          "https://www.linkedin.com/in/gowthammani-07a4a022a/",
                        ),
                      ],
                    ),
                    Opacity(
                      opacity: 0.2,
                      child: Lottie.asset(
                        'assets/background2.json',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }
      },
    ),
  );
}

// 🔹 Link builder (fixed Expanded -> Flexible.loose)
Widget buildLink(String title, String url) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      mainAxisSize: MainAxisSize.min, // prevent infinite expansion
      children: [
        Text(
          "$title: ",
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        Flexible(
          fit: FlexFit.loose, // ✅ instead of Expanded
          child: InkWell(
            onTap: () => _launchURL(url),
            child: Text(
              url,
              style: const TextStyle(
                color: Colors.blue,
                fontSize: 17,
                // decoration: TextDecoration.underline,
              ),
              overflow: TextOverflow.ellipsis, // Handle long URLs safely
            ),
          ),
        ),
        const Icon(Icons.link, color: Colors.blue, size: 20),
      ],
    ),
  );
}

Future<void> _launchURL(String url) async {
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    throw 'Could not launch $url';
  }
}

  Widget sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: Colors.indigo[700],
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }