import 'dart:math';
import 'package:flutter/material.dart';
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
      short: 'All-in-one fitness companion with nutrition plans, exercise guides, trackers, and smart alternatives — your path to a healthier lifestyle.',
      long: '''Transform your health journey with our all-in-one fitness app, designed to make achieving your goals easier and more enjoyable. Whether you’re looking to lose weight, build muscle, or simply live healthier, our app offers everything you need in one place:

 - Personalized Nutrition Plans – Get tailored meal plans that fit your lifestyle and goals.
 - Calorie Calculator – Track your daily intake with precision to stay on target.
 - Food Alternatives – Discover healthier swaps for your favorite foods.
 - Exercise Plans & Alternatives – Access guided workout plans with 3D animations and substitute exercises for flexibility.
 - Water & Step Tracking – Stay hydrated and active with built-in trackers.

With a clean interface, smart features, and scientifically backed guidance, our app helps you stay motivated and on track — no matter where you are in your fitness journey.
      ''',
      imageAsset: 'assets/fit_logo.png',
      appUrl: 'https://github.com/yourusername/project',
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
      appUrl: 'https://github.com/yourusername/project',
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
      appUrl: 'https://github.com/yourusername/project',
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
      appUrl: 'https://github.com/yourusername/project',
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
      appUrl: 'https://github.com/yourusername/project',
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
      appUrl: 'https://github.com/yourusername/project',
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
      appUrl: 'https://github.com/yourusername/project',
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
      appUrl: 'https://github.com/yourusername/project',
      videoUrl: 'https://drive.google.com/drive/folders/1NZUsZ2XowAY3C3gPJ9kXue37OxgYbk8R',
      lang: 'Unity',
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
  Widget build(BuildContext context) {
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
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('omar.works()',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                                color: Colors.white.withOpacity(0.95))),
                        Row(
                          children: [
                            ElevatedButton.icon(
                              onPressed: () => _openUrl(
                                  'https://github.com/yourusername'),
                              icon: const Icon(Icons.code),
                              label: const Text('GitHub'),
                            )
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 28),
                    LayoutBuilder(builder: (context, constraints) {
                      final isNarrow = constraints.maxWidth < 800;
                      return isNarrow
                          ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _IntroCard(onHireTap: () => _openUrl("https://wa.me/+201008653386?text=${Uri.encodeComponent("Hello Omar, I'd like to hire you.")}")),
                          const SizedBox(height: 20),
                          _SkillsCard(),
                        ],
                      )
                          : Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(flex: 6, child: _IntroCard(onHireTap: () => _openUrl("https://wa.me/+201008653386?text=${Uri.encodeComponent("Hello Omar, I'd like to hire you.")}"))),
                          const SizedBox(width: 20),
                          Expanded(flex: 4, child: _SkillsCard()),
                        ],
                      );
                    }),
                    const SizedBox(height: 36),
                    SectionTitle(id: 'projects', title: 'Selected Projects'),
                    const SizedBox(height: 12),
                    AnimationLimiter(
                      child: LayoutBuilder(builder: (context, constraints) {
                        int crossAxisCount = 4;
                        if (constraints.maxWidth < 800) crossAxisCount = 2;
                        else if (constraints.maxWidth < 1200) crossAxisCount = 3;
                        return GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: crossAxisCount,
                              mainAxisExtent: 260,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16),
                          itemCount: projects.length,
                          itemBuilder: (context, index) {
                            final p = projects[index];
                            return AnimationConfiguration.staggeredGrid(
                              position: index,
                              duration: const Duration(milliseconds: 500),
                              columnCount: crossAxisCount,
                              child: ScaleAnimation(
                                child: FadeInAnimation(
                                  child: ProjectCard(
                                    project: p,
                                    onOpen: () => _showProjectDetails(context, p),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }),
                    ),

                    const SizedBox(height: 40),

                    SectionTitle(id: 'contact', title: 'Get in touch'),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.06),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('I’m available for freelance projects and Part-time roles.\nDrop me a message.'),
                          const SizedBox(height: 12),
                          Wrap(
                            spacing: 12,
                            children: [
                              FilledButton.icon(
                                onPressed: () => _openUrl('mailto:shenawyomar2@gmail.com'),
                                icon: const Icon(Icons.email_outlined),
                                label: const Text('Email'),
                              ),
                              FilledButton.icon(
                                onPressed: () => _openUrl('https://www.linkedin.com/in/omar-ahmed-20104a252/'),
                                icon: const Icon(Icons.business_center),
                                label: const Text('LinkedIn'),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),

                    const SizedBox(height: 60),

                    Center(
                      child: Text('© ${DateTime.now().year} Omar Ahmed — Built with Flutter',
                          style: const TextStyle(fontSize: 12, color: Colors.white70)),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _showProjectDetails(BuildContext context, Project p) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.7,
        minChildSize: 0.4,
        maxChildSize: 0.95,
        builder: (context, scrollController) {
          return Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: Container(
                        width: 48,
                        height: 6,
                        decoration: BoxDecoration(
                            color: Colors.black26,
                            borderRadius: BorderRadius.circular(12)),
                      )),
                  const SizedBox(height: 12),
                  Text(p.title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Image.asset(p.imageAsset, fit: BoxFit.contain, errorBuilder: (_, __, ___) => Container(color: Colors.grey[300])),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(p.long),
                  const SizedBox(height: 12),
                  Wrap(spacing: 8, runSpacing: 8, children: [
                    ElevatedButton.icon(onPressed: () => _openUrl(p.appUrl), icon: const Icon(Icons.code), label: const Text('link')),
                    OutlinedButton.icon(onPressed: () => _openUrl(p.videoUrl), icon: const Icon(Icons.open_in_new), label: const Text('video')),
                  ])
                ],
              ),
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
  final VoidCallback onHireTap;

  const _IntroCard({required this.onHireTap, super.key});

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
                  child: Image.asset('assets/avatar.jpg', width: 96, height: 96, fit: BoxFit.cover, errorBuilder: (_, __, ___) => Container(width: 96, height: 96, color: Colors.grey)),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Omar Ahmed El-shenawy', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                    const SizedBox(height: 6),
                    DefaultTextStyle(
                      style: const TextStyle(fontSize: 14, color: Colors.white70),
                      child: AnimatedTextKit(
                        isRepeatingAnimation: true,
                        repeatForever: true,
                        animatedTexts: [
                          TyperAnimatedText('Flutter Developer - Mobile & Desktop'),
                          TyperAnimatedText('Unity - 3D & AR'),
                          TyperAnimatedText('AI trainee'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: ElevatedButton(
                            onPressed: onHireTap,
                            child: const Text('Contact me'),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Flexible(
                          child: OutlinedButton(
                            onPressed: () => _openUrl("https://drive.google.com/file/d/1k6EaY0WuVJvmMXCeaJqRfWy7I9fWT7xV/view"),
                            child: const Text('Download CV', style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'I am building cross-platform applications while actively learning Artificial Intelligence to expand into intelligent systems development. I am seeking opportunities to apply and grow in software development and AI integration.',
            style: const TextStyle(color: Colors.white70),
          )
        ],
      ),
    );
  }
}

class _SkillsCard extends StatelessWidget {
  const _SkillsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final skills = ['Flutter', 'Dart', 'Responsive design', 'Animations', 'Firebase integration', 'Maps integration', 'AI integration'];
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.04),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Skills', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white)),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: skills
                .map((s) => Chip(
              label: Text(s),
              backgroundColor: Colors.green.shade600,
              labelStyle: const TextStyle(color: Colors.white),
            ))
                .toList(),
          ),
          const SizedBox(height: 12),
          const Text('Experience', style: TextStyle(color: Colors.white70)),
          const SizedBox(height: 6),
          LinearProgressIndicator(value: 0.8, backgroundColor: Colors.white10),
          const SizedBox(height: 8),
          const Text('2+ years building apps', style: TextStyle(color: Colors.white70, fontSize: 12)),
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
    return Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white));
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
  const ProjectCard({required this.project, required this.onOpen, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onOpen,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          color: Colors.white.withOpacity(0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(project.imageAsset, fit: BoxFit.contain, errorBuilder: (_, __, ___) => Container(color: Colors.grey[300])),
                    ),
                    Positioned(
                      right: 8,
                      top: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                        decoration: BoxDecoration(color: Colors.black45, borderRadius: BorderRadius.circular(8)),
                        child: Text(project.lang, style: const TextStyle(color: Colors.white, fontSize: 12)),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(project.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 6),
                    Text(project.short, style: const TextStyle(color: Colors.white70, fontSize: 12)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
