import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Omar Ahmed — Portfolio',
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: const PortfolioHomePage(),
    );
  }
}

class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({super.key});

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> with SingleTickerProviderStateMixin {
  late final AnimationController _bgController;

  final List<Project> projects = [
    Project(
      title: "FitAItion",
      short: 'All-in-one fitness companion with nutrition plans, exercise guides, trackers, and smart alternatives.',
      long: '''Transform your health journey with our all-in-one fitness app, designed to make achieving your goals easier and more enjoyable. Whether you’re looking to lose weight, build muscle, or simply live healthier, our app offers everything you need in one place:

 - Personalized Nutrition Plans – Get tailored meal plans that fit your lifestyle and goals.
 
 - Calorie Calculator – Track your daily intake with precision to stay on target.
 
 - Food Alternatives – Discover healthier swaps for your favorite foods.
 
 - Exercise Plans & Alternatives – Access guided workout plans with 3D animations and substitute exercises for flexibility.
 
 - Water & Step Tracking – Stay hydrated and active with built-in trackers.

With a clean interface, smart features, and scientifically backed guidance, our app helps you stay motivated and on track — no matter where you are in your fitness journey.
      ''',
      imageAsset: 'assets/fit_logo.jpg',
      appUrl: '',
      videoUrl: 'https://drive.google.com/drive/folders/1xUg4ndi1_FurktByKGVea311oymUN_zJ',
      lang: 'Flutter',
    ),

    Project(
      title: "Med Alert",
      short: 'Never miss a dose — smart medicine reminders with tracking to keep you on schedule.',
      long: '''Stay on top of your health with our reliable medicine reminder app. Designed for simplicity and accuracy, it ensures you never miss a dose again. Whether you’re managing daily prescriptions, vitamins, or supplements, our app keeps you organized and consistent.

Features:

Custom Reminders – Set personalized alarms for each medication.

Dose Tracking – Log when you’ve taken your medicine to avoid double dosing.

History Log – Review your medication intake for better health management.

User-Friendly Interface – Simple, clean design for all ages.

Notifications – Get clear, timely alerts even when your phone is locked.

Perfect for individuals, caregivers, and anyone managing multiple medications — because your health should never be left to chance.
      ''',
      imageAsset: 'assets/med_alert_logo.png',
      appUrl: '',
      videoUrl: "https://drive.google.com/drive/folders/1g2DRig__u3dg-67Y0ZuL0RAMDJSCIVx7",
      lang: 'Flutter',
    ),

    Project(
      title: "Mobica",
      short: 'Smart furniture Mobica (sales app) catalog and management — browse, and control everything.',
      long: '''Discover the ultimate furniture experience with our powerful furniture app and integrated admin control panel. Perfect for businesses, sellers, and customers alike, it combines a seamless shopping interface with easy product management tools.

For Customers:

Browse by Categories & Subcategories – Quickly find the right furniture for your home or office.

Detailed Product Pages – View images, descriptions, and prices before purchasing.

Firebase Integration with Admin Control Panel.

For Admins :

Add & Manage Products – Upload images, descriptions, prices, and details directly from the control panel.

Filter & Search Tools – Instantly find products by section or subsection.

Responsive Design – Manage your store on desktop, tablet, or mobile.

Firebase Integration – Secure storage for product data and images.

Whether you’re a furniture business owner or a customer looking for the perfect piece, our app delivers a smooth, modern, and efficient furniture shopping experience. ''',
      imageAsset: 'assets/mobica_logo.png',
      appUrl: '',
      videoUrl: 'https://drive.google.com/drive/folders/12tSuhTXJSfi1Ix3lMflEv5CCBhojll0h',
      lang: 'Flutter',
    ),

    Project(
      title: "YouTube playlist downloader",
      short: 'Download YouTube playlists as high-quality MP3 audio with a fast, simple desktop app.',
      long: '''Easily convert and save your favorite YouTube playlist as MP3 audio files with our lightweight desktop app. Designed for speed, simplicity, and quality, it makes downloading audio from YouTube effortless.

Features:

One-Click Conversion – Paste a YouTube playlist link and instantly get an MP3.

High-Quality Audio – Enjoy clear, crisp sound output.

Fast Downloads – Minimal waiting time, even for long playlists.

Simple Interface – Clean design for all user levels.

Offline Listening – Store your MP3 files locally and play anytime.

Perfect for music lovers, podcast listeners, and anyone who wants offline access to YouTube playlists.
      ''',
      imageAsset: 'assets/yt_logo.png',
      appUrl: '',
      videoUrl: 'https://drive.google.com/drive/folders/198pUfVD-m-r3foCy8iUFAnJ1YTGUDElm',
      lang: 'Flutter',
    ),

    Project(
      title: "qurany",
      short: 'The Holy Quran with all Qira’at, Riwayat, world-famous reciters, and trusted Tafsir — all in one app.',
      long: '''Experience the Holy Quran like never before with a complete app that combines the authenticity of the Mushaf with full access to every Qira’ah and Riwayah, recitations from the world’s most renowned Qaris, and trusted Tafsir for deeper understanding.

Features:
All Qira’at & Riwayat – Including Hafs, Warsh, Qalun, Al-Duri, and more.

Renowned Reciters – Listen to beautiful recitations from leading Qaris worldwide.

Trusted Tafsir – Multiple authentic interpretations to enrich your understanding.

Authentic Mushaf View – Pages exactly as in the printed Mushaf.

Advanced Search – Find Ayahs, words, or topics instantly.

Bookmarks & Notes – Save your reading points and add reflections.

Smooth, Fast Interface – Works perfectly on phones and tablets.

One app that replaces dozens — perfect for readers, students, and researchers in the sciences of the Quran.
      ''',
      imageAsset: 'assets/qurany_logo.png',
      appUrl: '',
      videoUrl: 'https://drive.google.com/drive/folders/1HGyZZwuZBy_dkg39nIKy1gKjA9U7DQek',
      lang: 'Flutter',
    ),

    Project(
      title: "sign language AI model",
      short: 'Real-time sign language letter detection — learn and practice the alphabet with AI.',
      long: '''Master the sign language alphabet with our real-time letter detection app powered by AI. Designed for learners, educators, and anyone interested in communication accessibility, the app recognizes individual hand signs for letters instantly through your device’s camera.

Features:

Real-Time Letter Recognition – Detects sign language letters instantly.

Camera-Based Detection – No special equipment needed, just your device.

Learning Mode – Practice each letter with visual guides.

History Tracking – See your progress over time.

Lightweight & Fast – Optimized for smooth performance on any device.

A simple, powerful tool to learn and practice sign language letters — anytime, anywhere.
      ''',
      imageAsset: 'assets/sign_logo.png',
      appUrl: '',
      videoUrl: 'https://drive.google.com/drive/folders/1OC97leluJB1ug2nO1HW1xh7DbSF2Gxv_',
      lang: 'computer vision',
    ),

    Project(
      title: "HRMS system",
      short: 'All-in-one HR management for Windows — employee records, attendance, payroll, and more.',
      long: '''Manage your workforce efficiently with our Flutter-powered HRMS desktop app for Windows. Designed for HR teams, managers, and business owners, it centralizes all employee data and HR processes in one easy-to-use platform.

Features:

Employee Records – Store and manage complete staff profiles.

Attendance Tracking – Log and monitor daily attendance.

Payroll Management – Automate salary calculations and payments.

Leave & Overtime – Request, approve, and track employee leave and overtime.

Performance Tracking – Keep records of evaluations and progress.

Multi-Role Access – Secure permissions for HR, managers, and admins.

Windows Optimized – Smooth performance and native desktop feel.

A complete human resource management solution — fast, secure, and built for modern Windows systems.
      ''',
      imageAsset: 'assets/hr_logo.png',
      appUrl: '',
      videoUrl: 'https://drive.google.com/drive/folders/1kC3LsL5gfEKzUnWENi2mcmQeHIMbEJd1',
      lang: 'Flutter',
    ),

    Project(
      title: "AR firniture app",
      short: 'Place and preview furniture in your space with AR — to try it in your place',
      long: '''Transform the way you shop for furniture with our Augmented Reality app. Using your device’s camera, you can place true-to-scale 3D furniture models directly into your room, move them around, and visualize exactly how they’ll fit before making a purchase.

Features:

Real-Time AR Placement – Place 3D furniture models in your actual space.

Move, Rotate, & Scale – Adjust the furniture to match your room’s layout.

Surface Detection – Automatically detects floors and surfaces for accurate placement.

Perfect for homeowners, interior designers, and furniture businesses — try before you buy with AR.
      ''',
      imageAsset: 'assets/ar_logo.png',
      appUrl: '',
      videoUrl: 'https://drive.google.com/drive/folders/1NZUsZ2XowAY3C3gPJ9kXue37OxgYbk8R',
      lang: 'Unity',
    ),
  ];

  final List<Certificate> certifications = [
    Certificate(
      title: "AI fundmentals",
      organization: "Cisco Netwoking academy",
      date: "Dec 2025",
      imageAsset: 'assets/cisco_ai.jpeg',
      verifyUrl: 'https://www.credly.com/badges/38327e30-bcf1-4cdf-8603-477fa7d1e9a1/public_url',
    ),
    Certificate(
      title: "machine learning",
      organization: "National Telecommunication Institute",
      date: "Aug 2025",
      imageAsset: 'assets/machine_nti.jfif',
      verifyUrl: null,
    ),
  ];

  final List<Course> courses = [
    Course(
      title: "Mobile application",
      platform: "Microsoft x Sprints",
      duration: "40+ Hours",
      imageAsset: 'assets/flutter_sprints.png',
    ),
    Course(
      title: "Flutter & Dart Full Specialization",
      platform: "Udemy",
      duration: "+38 Hours",
      imageAsset: 'assets/flutter_udemy.jpg',
    ),

  ];

  @override
  void initState() {
    super.initState();
    _bgController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    for (final p in projects) {
      precacheImage(AssetImage(p.imageAsset), context); // ✅ safe here
    }
  }

  @override
  void dispose() {
    _bgController.dispose();
    super.dispose();
  }

  void _openUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Could not open link')));
    }
  }

  @override
  @override
  Widget build(BuildContext context) {
    bool isTablet = MediaQuery.of(context).size.width > 600;
    return Scaffold(
      body: Stack(
        children: [
          AnimatedBuilder(
            animation: _bgController,
            builder: (context, child) {
              return CustomPaint(
                size: MediaQuery.of(context).size,
                painter: _GradientPainter(_bgController.value),
              );
            },
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// ───────── HEADER ─────────
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Omar El-shenawy',
                          style: TextStyle(
                            fontSize: isTablet ? 26 : 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () => _openUrl('https://github.com/omarlshenawy'),
                          icon: const Icon(Icons.code),
                          label:  Text('GitHub', style: TextStyle(fontSize: isTablet? 14 : 13)),
                        ),
                      ],
                    ),

                    const SizedBox(height: 28),

                    /// ───────── INTRO ─────────
                    _IntroCard(isTablet: isTablet,),

                    const SizedBox(height: 40),

                    /// ───────── PROJECTS ─────────
                    const SectionTitle(id: 'projects', title: 'Selected Projects'),
                    const SizedBox(height: 12),

                    AnimationLimiter(
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          // Responsive column count
                          int crossAxisCount = 1;
                          if (constraints.maxWidth > 1200) {
                            crossAxisCount = 4;
                          } else if (constraints.maxWidth > 800) {
                            crossAxisCount = 3;
                          } else if (constraints.maxWidth > 400) {
                            crossAxisCount = 2;
                          }

                          return AlignedGridView.count(
                            crossAxisCount: crossAxisCount,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: projects.length,
                            itemBuilder: (context, index) {
                              return AnimationConfiguration.staggeredGrid(
                                position: index,
                                columnCount: crossAxisCount,
                                duration: const Duration(milliseconds: 500),
                                child: ScaleAnimation(
                                  child: FadeInAnimation(
                                    child: SizedBox(
                                      // Use height: double.infinity logic inside AlignedGridView
                                      // or let the intrinsic rendering of AlignedGridView handle it.
                                      child: ProjectCard(
                                        project: projects[index],
                                        onOpen: () => _showProjectDetails(context, projects[index]),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 40),

                    /// ───────── SKILLS (NOW UNDER PROJECTS) ─────────
                    const SectionTitle(id: 'skills', title: 'Skills & Experience'),
                    const SizedBox(height: 12),
                    _SkillsCard(isTablet: isTablet),

                    const SizedBox(height: 40),

                    /// ───────── CONTACT ─────────
                    const SectionTitle(id: 'contact', title: 'Get in touch'),
                    const SizedBox(height: 12),

                    Container(
                      padding:  EdgeInsets.all(isTablet? 20 : 16),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.06),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'I’m available for freelance projects and Part-time roles.\nDrop me a message.',
                          ),
                          const SizedBox(height: 12),
                          Wrap(
                            spacing: isTablet? 12 : 6,
                            runSpacing: 10,
                            children: [
                              FilledButton.icon(
                                onPressed: () =>
                                    _openUrl('mailto:shenawyomar2@gmail.com'),
                                icon: const Icon(Icons.email_outlined),
                                label: const Text('Email'),
                              ),
                              FilledButton.icon(
                                onPressed: () => _openUrl(
                                  'https://www.linkedin.com/in/omar--elshenawy/',
                                ),
                                icon: const Icon(Icons.business_center),
                                label: const Text('LinkedIn'),
                              ),
                              FilledButton.icon(
                                onPressed: () => _openUrl(
                                  "https://wa.me/+201008653386?text=${Uri.encodeComponent(
                                    "Hello Omar, I'v an offer for you.",
                                  )}",
                                ),
                                icon: const Icon(Icons.phone),
                                label: const Text('+201008653386'),
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),

                    const SizedBox(height: 40),

                    /// ───────── CERTIFICATIONS ─────────
                    const SectionTitle(id: 'certs', title: 'Certifications'),
                    const SizedBox(height: 12),

                    LayoutBuilder(
                      builder: (context, constraints) {
                        int crossAxisCount = 1;
                        if (constraints.maxWidth > 1200) {
                          crossAxisCount = 3;
                        } else if (constraints.maxWidth > 580) {
                          crossAxisCount = 2;
                        }
                        return AlignedGridView.count(
                          crossAxisCount: crossAxisCount,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: certifications.length,
                          itemBuilder: (context, index) {
                            final cert = certifications[index];
                            return AchievementCard(
                              title: cert.title,
                              subtitle: cert.organization,
                              info: cert.date,
                              imageAsset: cert.imageAsset,
                              badgeText: "CERTIFIED",
                              onTap: cert.verifyUrl != null ? () => _openUrl(cert.verifyUrl!) : null,
                            );
                          },
                        );
                      },
                    ),

                    const SizedBox(height: 40),

                    /// ───────── COURSES ─────────
                    const SectionTitle(id: 'courses', title: 'Courses Completed'),
                    const SizedBox(height: 12),

                    LayoutBuilder(
                      builder: (context, constraints) {
                        int crossAxisCount = 1;
                        if (constraints.maxWidth > 1200) {
                          crossAxisCount = 3;
                        } else if (constraints.maxWidth > 650) {
                          crossAxisCount = 2;
                        }
                        return AlignedGridView.count(
                          crossAxisCount: crossAxisCount,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: courses.length,
                          itemBuilder: (context, index) {
                            final course = courses[index];
                            return AchievementCard(
                              title: course.title,
                              subtitle: course.platform,
                              info: course.duration,
                              imageAsset: course.imageAsset,
                              badgeText: "COURSE",
                            );
                          },
                        );
                      },
                    ),

                    const SizedBox(height: 60),

                    /// ───────── FOOTER ─────────
                    Center(
                      child: Text(
                        '© ${DateTime.now().year} Omar Ahmed — Built with Flutter',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white70,
                        ),
                      ),
                    ),

                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


  void _showProjectDetails(BuildContext context, Project p) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent, // Transparent to let our custom design show
      builder: (context) => DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.85, // Opens taller by default
        minChildSize: 0.5,
        maxChildSize: 0.95,
        builder: (context, scrollController) {
          return Container(
            decoration: BoxDecoration(
              // Dark background matching your theme logic (Dark Grey/Black mix)
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.grey.shade900,
                  Colors.black87,
                ],
              ),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
              border: Border.all(color: Colors.white.withOpacity(0.1), width: 1),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 20,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: Column(
              children: [
                // ───────── DRAG HANDLE ─────────
                const SizedBox(height: 16),
                Container(
                  width: 50,
                  height: 5,
                  decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(10)),
                ),
                const SizedBox(height: 20),

                // ───────── CONTENT ─────────
                Expanded(
                  child: ListView(
                    controller: scrollController,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
                    children: [
                      // 1. Image with Shadow
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 15,
                              offset: const Offset(0, 8),
                            )
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: AspectRatio(
                            aspectRatio: 16 / 9,
                            child: Container(
                              color: Colors.white.withOpacity(0.05),
                              child: Image.asset(
                                p.imageAsset,
                                fit: BoxFit.contain,
                                errorBuilder: (_, __, ___) =>
                                    Container(color: Colors.grey[800]),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),

                      // 2. Title & Language Badge
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              p.title,
                              style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                height: 1.1,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.green.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.green.withOpacity(0.5)),
                            ),
                            child: Text(
                              p.lang,
                              style: const TextStyle(
                                color: Colors.greenAccent,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // 3. Buttons Row (Styled like Home)
                      Row(
                        children: [
                          if (p.appUrl.isNotEmpty)
                            Expanded(
                              child: FilledButton.icon(
                                onPressed: () => _openUrl(p.appUrl),
                                style: FilledButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.black,
                                  padding: const EdgeInsets.symmetric(vertical: 14),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                ),
                                icon: const Icon(Icons.download_rounded),
                                label: const Text("Get App"),
                              ),
                            ),
                          if (p.appUrl.isNotEmpty) const SizedBox(width: 12),
                          Expanded(
                            child: OutlinedButton.icon(
                              onPressed: () => _openUrl(p.videoUrl),
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(color: Colors.white30),
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(vertical: 14),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              ),
                              icon: const Icon(Icons.play_circle_outline),
                              label: const Text("Demo Video"),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),
                      const Divider(color: Colors.white10),
                      const SizedBox(height: 16),

                      // 4. Description
                      const Text(
                        "About this project",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        p.long,
                        style: TextStyle(
                          fontSize: 15,
                          height: 1.6,
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                      const SizedBox(height: 40), // Bottom padding
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _GradientPainter extends CustomPainter {
  final double t;
  _GradientPainter(this.t);

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final paint = Paint();

    final colors = [
      Colors.teal.shade700,
      Colors.green.shade600,
      Colors.indigo.shade600,
    ];

    final shift = (sin(2 * pi * t) + 1) / 2;

    paint.shader = LinearGradient(
      begin: Alignment(-1 + shift * 2, -1),
      end: Alignment(1 - shift * 2, 1),
      colors: colors,
      stops: [0, 0.5, 1],
    ).createShader(rect);

    canvas.drawRect(rect, paint);

    final circlePaint = Paint()..color = Colors.white.withOpacity(0.02);
    for (int i = 0; i < 6; i++) {
      final radius = 40.0 + 80 * (i / 6);
      final dx = size.width * ((i * 0.17 + t) % 1);
      final dy = size.height * (0.2 + i * 0.12);
      canvas.drawCircle(Offset(dx, dy), radius, circlePaint);
    }
  }

  @override
  bool shouldRepaint(covariant _GradientPainter oldDelegate) => oldDelegate.t != t;
}

class _IntroCard extends StatelessWidget {

  final bool isTablet;

  const _IntroCard({required this.isTablet, super.key});

  @override
  Widget build(BuildContext context) {

    void _openUrl(String url) async {
      final uri = Uri.parse(url);
      if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Could not open link')));
      }
    }

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.06),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Hero(
                tag: 'avatar',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset('assets/avatar.jpeg', width: 120, height: 120, fit: BoxFit.cover, errorBuilder: (_, __, ___) => Container(width: 96, height: 96, color: Colors.grey)),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DefaultTextStyle(
                      style: TextStyle(fontSize: isTablet? 20 : 18, color: Colors.white70),
                      child: AnimatedTextKit(
                        isRepeatingAnimation: true,
                        repeatForever: true,
                        animatedTexts: [
                          TyperAnimatedText('AI Engineer'),
                          TyperAnimatedText('Flutter Developer'),
                          TyperAnimatedText('Unity - 3D & AR'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),
                    OutlinedButton(
                      onPressed: () => _openUrl("https://drive.google.com/file/d/1kVjjFv-sSbuiTFhJPOe232gK8fsCUJGZ/view?usp=sharing"),
                      child:  Text('Download CV', style: TextStyle(color: Colors.white,fontSize: isTablet? 17 : 15)),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.white, width: 1.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding:  EdgeInsets.symmetric(horizontal: isTablet? 20 : 16, vertical: isTablet? 14 : 12),
                      )
                    ),

                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 16),
          Center(
            child: Text(
                'I am Omar El-shenawy, AI engineer & Flutter developer start coding since school when my dad buy for me first laptop and i start my jorney.\n\nI specialize in building cross-platform applications that are integrated with Artificial Intelligence, delivering smart, efficient, and scalable systems. My work focuses on providing seamless user experiences, implementing AI-driven features, and ensuring high performance. I am constantly learning and exploring new technologies to enhance my skills and stay at the forefront of software development and AI integration.',
              style:  TextStyle(color: Colors.white70,fontSize: isTablet? 17 : 15),
            ),
          )
        ],
      ),
    );
  }
}

class _SkillsCard extends StatelessWidget {
  final bool isTablet;
  const _SkillsCard({required this.isTablet, super.key});

  @override
  Widget build(BuildContext context) {
    final skills = ['computer vision', 'NLP', 'Transfer learning', 'Deep learning','Flutter', 'Dart', 'Responsive design', 'Animations', 'Firebase integration', 'state management', 'Maps integration', 'AI integration', 'Unity AR' ];
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.04),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Skills', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white)),
          const SizedBox(height: 12),
          Wrap(
            spacing: isTablet? 8 : 7,
            runSpacing: isTablet? 8 : 8,
            children: skills
                .map((s) => Chip(
              label: Text(s),
              backgroundColor: Colors.green.shade600,
              labelStyle:  TextStyle(color: Colors.white, fontSize: isTablet? 16 : 14),
              padding: EdgeInsets.symmetric(horizontal: isTablet? 8 : 4,vertical: isTablet? 8 : 6),

            ))
                .toList(),
          ),
          const SizedBox(height: 12),
          const Text('Experience', style: TextStyle(color: Colors.white70,fontSize: 14)),
          const SizedBox(height: 6),
          LinearProgressIndicator(value: 0.8, backgroundColor: Colors.white10),
          const SizedBox(height: 8),
          const Text('2+ years building AI apps', style: TextStyle(color: Colors.white70, fontSize: 13)),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String id;
  final String title;
  const SectionTitle({required this.id, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white));
  }
}

class Project {
  final String title;
  final String short;
  final String long;
  final String imageAsset;
  final String appUrl;
  final String videoUrl;
  final String lang;

  Project({
    required this.title,
    required this.short,
    required this.long,
    required this.imageAsset,
    required this.appUrl,
    required this.videoUrl,
    required this.lang
  });
}

class ProjectCard extends StatelessWidget {
  final Project project;
  final VoidCallback onOpen;

  const ProjectCard({super.key, required this.project, required this.onOpen});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onOpen,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        constraints: const BoxConstraints(minHeight: 300),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withOpacity(0.1)),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // --- LOGO SECTION ---
                Container(
                  height: 160,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black12.withAlpha(10),
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                  ),
                  child: Image.asset(
                    project.imageAsset,
                    fit: BoxFit.contain,
                  ),
                ),

                // --- TEXT SECTION ---
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        project.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        project.short,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 13,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 40), // reserve space for badge overlay
                    ],
                  ),
                ),
              ],
            ),

            // --- Tech Badge overlay ---
            Positioned(
              bottom: 16, // fixed distance from bottom of the card
              left: 16,   // fixed distance from left
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: Colors.green.withOpacity(0.5)),
                ),
                child: Text(
                  project.lang.toUpperCase(),
                  style: const TextStyle(
                    color: Colors.greenAccent,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Certificate {
  final String title;
  final String organization;
  final String date;
  final String imageAsset;
  final String? verifyUrl;

  Certificate({
    required this.title,
    required this.organization,
    required this.date,
    required this.imageAsset,
    this.verifyUrl,
  });
}

class Course {
  final String title;
  final String platform;
  final String duration;
  final String imageAsset;

  Course({
    required this.title,
    required this.platform,
    required this.duration,
    required this.imageAsset,
  });
}

class AchievementCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String info;
  final String imageAsset;
  final String badgeText;
  final VoidCallback? onTap;

  const AchievementCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.info,
    required this.imageAsset,
    required this.badgeText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        // Remove 'Expanded' and use 'IntrinsicHeight' if necessary,
        // but usually just removing Expanded/Spacer from the Column works.
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withOpacity(0.1)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min, // Tell the column to be as small as possible
          children: [
            // Image Section
            Container(
              padding: const EdgeInsets.all(4),
              height: 280 ,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.asset(imageAsset, fit: BoxFit.fill, errorBuilder: (_, __, ___) => const Icon(Icons.image, color: Colors.white24)),
              ),
            ),
            // Text Section
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 4),
                  Text(subtitle, style: TextStyle(color: Colors.greenAccent.withOpacity(0.8), fontSize: 13)),
                  const SizedBox(height: 4),
                  Text(info, style: TextStyle(color: Colors.white70, fontSize: 12)),
                  const SizedBox(height: 12), // Use a fixed gap instead of Spacer()
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(badgeText, style: const TextStyle(color: Colors.white, fontSize: 10)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
flutter build web --base-href /omar-portfolio/

cp -r build/web/* . -Force

git add .
git commit -m "Deploy Flutter web to GitHub Pages"
git push origin main

 */
*/


