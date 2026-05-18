import 'dart:math';
import 'dart:ui';
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
      title: "AI Body Measurements using ResNet34",
      short: 'Computer vision app that predicts full body measurements from front and side images using deep learning.',
      long: '''Estimate human body measurements instantly using AI and computer vision. This project leverages deep learning models to analyze front and side images of a person and generate accurate body measurements without manual input.

Built using PyTorch and advanced image processing techniques, the system combines semantic segmentation and regression modeling to isolate the human body and predict key physical dimensions.

Key Features:

 - AI-Powered Measurement Prediction – Predicts 14 body measurements including chest, waist, height, and limb sizes.
 
 - Dual-Image Input (Front & Side) – Improves accuracy by analyzing the body from multiple perspectives.
 
 - Person Segmentation – Uses DeepLabV3 to isolate the human body from the background before processing.
 
 - Custom ResNet34 Regression Model – Fine-tuned deep learning model for precise measurement estimation.
 
 - Image Preprocessing Pipeline – Includes masking, grayscale conversion, and normalization for optimal model performance.
 
This project demonstrates strong skills in computer vision, deep learning, and full pipeline development — from preprocessing and model design to deployment with an interactive UI.
  ''',
      imageAsset: 'assets/ai_body.png',
      appUrl: 'https://huggingface.co/spaces/iof2eagle/body',
      videoUrl: 'https://drive.google.com/file/d/1gJk_OEWnEzNK00eBXiYHHxWh4JoSbGai/view?usp=sharing',
      lang: 'computer vision',
    ),

    Project(
      title: "Phishing Email Detection using BERT",
      short: 'AI-powered NLP model that detects phishing emails with 99% accuracy using fine-tuned BERT.',
      long: '''Detect phishing emails with high precision using state-of-the-art Natural Language Processing. This project leverages a fine-tuned BERT model to classify emails as legitimate or phishing, achieving outstanding performance on real-world datasets.

The system was carefully designed to preserve critical phishing indicators (such as URLs, symbols, and formatting) rather than removing them during preprocessing — improving model accuracy and realism.

Key Features:

 - High Accuracy Model – Achieves ~99% accuracy, precision, recall, and F1-score on test data.
 
 - BERT-Based Classification – Utilizes a pretrained transformer (bert-base-uncased) fine-tuned for binary classification.
 
 - Smart Preprocessing Strategy – Keeps important phishing signals like URLs, special characters, and formatting instead of removing them.
 
 - Full NLP Pipeline – Includes data cleaning, tokenization, dataset preparation, training, evaluation, and inference.
 
 - Data Visualization & Analysis – Explores dataset patterns using Seaborn, word clouds, and statistical plots.
 
 - Custom Training Pipeline – Built with Hugging Face Trainer API for efficient training and evaluation.
 
 - Real-Time Prediction Function – Classifies input text into SAFE 🟢, SUSPICIOUS 🟡, or PHISHING 🔴 with probability scores.
 
 - Model Persistence – Saves and reloads trained model and tokenizer for deployment.

This project demonstrates strong expertise in NLP, transformer models, and end-to-end machine learning workflows — from data exploration to production-ready inference.
  ''',
      imageAsset: 'assets/phishing_ai.png',
      appUrl: 'https://huggingface.co/spaces/iof2eagle/emails_phising',
      videoUrl: 'https://www.linkedin.com/posts/omar--elshenawy_ai-machinelearning-deeplearning-activity-7450638731327381505-wby5?utm_source=li_share&utm_content=feedcontent&utm_medium=g_dt_web&utm_campaign=copy',
      lang: 'NLP',
    ),

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

  // ─────────────────────────────────────────────────────────────
// DATA
// Put courses and certificates together
// ─────────────────────────────────────────────────────────────

  final List<AchievementItem> achievements = [

    AchievementItem(
      title: "computer vision crash course",
      organization: "orange digital center",
      date: "28 Hours",
      images: [
        "https://drive.google.com/file/d/1USchWPdI1472Qi5an8auYTdtgGAZQNe_/view?usp=sharing",
      ],
      verifyUrl: null,
    ),

    AchievementItem(
      title: "Machine Learning",
      organization: "National Telecommunication Institute",
      date: "72 Hours",
      images: [
        "https://drive.google.com/file/d/1mm-ectUNfzKeegTw8Iv3toClv9C-wJIP/view?usp=sharing",
      ],
      verifyUrl: null,
    ),

    AchievementItem(
      title: "AI Fundamentals",
      organization: "Cisco Networking Academy",
      date: "10 Hours",
      images: [
        "https://drive.google.com/file/d/1nhiLLcwAQL2nMptQptxIaaqWboI1mN8H/view?usp=sharing",
      ],
      verifyUrl:
      "https://www.credly.com/badges/38327e30-bcf1-4cdf-8603-477fa7d1e9a1/public_url",
    ),

    AchievementItem(
      title: "Flutter & Dart Full Specialization",
      organization: "Udemy",
      date: "38 Hours",
      images: [
        "https://drive.google.com/file/d/1eCGF2LF8TqrvC4a_Gat6SeLX2QHM7YVk/view?usp=sharing",
        "https://drive.google.com/file/d/14nL0STeJf3hs_C9hEDI2PACjeBWsRP91/view?usp=sharing",
        "https://drive.google.com/file/d/1bdQK8-qpwyeVBouqewd8w_G5cZgzCanK/view?usp=sharing",
        "https://drive.google.com/file/d/1QonuJk6Yw3bt3s0UpuVB_6_gJX65PHDZ/view?usp=sharing",
      ],
    ),

    AchievementItem(
      title: "Mobile Application Development",
      organization: "Microsoft × Sprints",
      date: "40 Hours",
      images: [
        "https://drive.google.com/file/d/1SeocbHIVtjy1FTKylQYINnrYz-r_zBKA/view?usp=sharing",
      ],
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

  String? convertDriveLinkToThumbnail(String shareLink) {
    // Regex to capture the file ID between /d/ and the next slash or question mark
    final RegExp regExp = RegExp(r'\/d\/([a-zA-Z0-9-_]+)');
    final Match? match = regExp.firstMatch(shareLink);

    if (match != null && match.groupCount >= 1) {
      final String fileId = match.group(1)!;
      // Returns the high-resolution thumbnail endpoint (1200px wide)
      return 'https://drive.google.com/thumbnail?id=$fileId&sz=w1200';
    }

    // Return null if the URL didn't match a standard Drive share format
    return null;
  }

  void _showAchievementViewer(
      BuildContext context,
      AchievementItem item,
      ) {
    final PageController pageController = PageController();
    int currentPage = 0;

    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'viewer',
      barrierColor: Colors.black.withOpacity(0.4),
      pageBuilder: (_, __, ___) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Scaffold(
              backgroundColor: Colors.transparent,
              body: Stack(
                children: [
                  // ───────── Blurred Background ─────────
                  BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 12,
                      sigmaY: 12,
                    ),
                    child: Container(
                      color: Colors.black.withOpacity(0.65),
                    ),
                  ),

                  SafeArea(
                    child: Column(
                      children: [
                        // ───────── Top Bar ─────────
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  item.title,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              IconButton(
                                onPressed: () => Navigator.pop(context),
                                icon: const Icon(
                                  Icons.close,
                                  color: Colors.white,
                                  size: 32,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // ───────── Main Image Viewer ─────────
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 8,
                            ),
                            child: Row(
                              children: [
                                // Back Button
                                if (item.images.length > 1)
                                  _buildNavButton(
                                    icon: Icons.chevron_left,
                                    enabled: currentPage > 0,
                                    onTap: () {
                                      if (currentPage > 0) {
                                        pageController.previousPage(
                                          duration: const Duration(
                                              milliseconds: 300),
                                          curve: Curves.easeInOut,
                                        );
                                      }
                                    },
                                  ),

                                const SizedBox(width: 16),

                                // Image
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(24),
                                    child: Container(
                                      color: Colors.white.withOpacity(0.05),
                                      child: PageView.builder(
                                        controller: pageController,
                                        itemCount: item.images.length,
                                        onPageChanged: (index) {
                                          setState(() {
                                            currentPage = index;
                                          });
                                        },
                                        itemBuilder: (context, index) {
                                          return InteractiveViewer(
                                            minScale: 0.8,
                                            maxScale: 5,
                                            child: Image.network(
                                              webHtmlElementStrategy: WebHtmlElementStrategy.fallback,
                                              convertDriveLinkToThumbnail(item.images[index])!,
                                              fit: BoxFit.contain,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),

                                const SizedBox(width: 16),

                                if (item.images.length > 1)
                                // Next Button
                                  _buildNavButton(
                                    icon: Icons.chevron_right,
                                    enabled: currentPage <
                                        item.images.length - 1,
                                    onTap: () {
                                      if (currentPage <
                                          item.images.length - 1) {
                                        pageController.nextPage(
                                          duration: const Duration(
                                              milliseconds: 300),
                                          curve: Curves.easeInOut,
                                        );
                                      }
                                    },
                                  ),

                              ],
                            ),
                          ),
                        ),

                        // ───────── Thumbnails (Amazon style) ─────────
                        SizedBox(
                          height: 90,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 8,
                            ),
                            itemCount: item.images.length,
                            itemBuilder: (context, index) {
                              final isSelected =
                                  index == currentPage;

                              return GestureDetector(
                                onTap: () {
                                  pageController.animateToPage(
                                    index,
                                    duration: const Duration(
                                        milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  );
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      right: 12),
                                  padding: const EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: isSelected
                                          ? Colors.blue
                                          : Colors.white24,
                                      width: isSelected ? 2 : 1,
                                    ),
                                    borderRadius:
                                    BorderRadius.circular(12),
                                  ),
                                  child: ClipRRect(
                                    borderRadius:
                                    BorderRadius.circular(10),
                                    child: Image.network(
                                      webHtmlElementStrategy: WebHtmlElementStrategy.fallback,
                                      convertDriveLinkToThumbnail(item.images[index])!,
                                      width: 70,
                                      height: 70,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),


                        // ───────── Image Counter ─────────
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(
                            '${currentPage + 1} / ${item.images.length}',
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                        ),


                        // ───────── Verify Button ─────────
                        if (item.verifyUrl != null)
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                24, 8, 24, 24),
                            child: SizedBox(
                              width: double.infinity,
                              child: FilledButton.icon(
                                onPressed: () =>
                                    _openUrl(item.verifyUrl!),
                                style: FilledButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.black,
                                  minimumSize:
                                  const Size.fromHeight(56),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(18),
                                  ),
                                ),
                                icon: const Icon(Icons.verified),
                                label: const Text(
                                  'Verify Certificate',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  /// Navigation button widget
  Widget _buildNavButton({
    required IconData icon,
    required bool enabled,
    required VoidCallback onTap,
  }) {
    return Opacity(
      opacity: enabled ? 1.0 : 0.3,
      child: Material(
        color: Colors.white.withOpacity(0.12),
        borderRadius: BorderRadius.circular(50),
        child: InkWell(
          onTap: enabled ? onTap : null,
          borderRadius: BorderRadius.circular(50),
          child: SizedBox(
            width: 56,
            height: 56,
            child: Icon(
              icon,
              color: Colors.white,
              size: 34,
            ),
          ),
        ),
      ),
    );
  }

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
                          onPressed: () => _openUrl('https://huggingface.co/iof2eagle'),
                          icon: const Icon(Icons.code),
                          label:  Text('Hugging face', style: TextStyle(fontSize: isTablet? 14 : 13)),
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

                    /// ───────── SKILLS  ─────────
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
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            height: 1.5,),
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
                                icon: const Icon(Icons.business_center_outlined),
                                label: const Text('LinkedIn'),
                              ),
                              FilledButton.icon(
                                onPressed: () => _openUrl(
                                  "https://wa.me/+201008653386?text=${Uri.encodeComponent(
                                    "Hello Omar, I'v an offer for you.",
                                  )}",
                                ),
                                icon: const Icon(Icons.message_outlined),
                                label: const Text('Message me'),
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),

                    const SizedBox(height: 40),

                    /// ───────── CERTIFICATIONS ─────────
                    // ─────────────────────────────────────────────────────────────


                    const SectionTitle(
                      id: 'achievements',
                      title: 'Courses & Certifications',
                    ),
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
                          itemCount: achievements.length,
                          itemBuilder: (context, index) {
                            final item = achievements[index];

                            return AchievementCard(
                              item: item,
                              onTap: () => _showAchievementViewer(context, item),
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
                                icon: const Icon(Icons.approval),
                                label: const Text("Try it"),
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
                              label: const Text("Demo"),
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

class AchievementItem {
  final String title;
  final String organization;
  final String date;
  final List<String> images; // Supports multiple images
  final String? verifyUrl;

  AchievementItem({
    required this.title,
    required this.organization,
    required this.date,
    required this.images,
    this.verifyUrl,
  });
}

class AchievementCard extends StatelessWidget {
  final AchievementItem item;
  final VoidCallback onTap;

  const AchievementCard({
    super.key,
    required this.item,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(28),
      child: Container(
        constraints: const BoxConstraints(
          minHeight: 240, // ensures all cards have enough height
        ),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.black54.withOpacity(0.10),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withOpacity(0.1)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min, // IMPORTANT
          children: [
            // Title
            Text(
              maxLines: 1,
              item.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                height: 1.2,
                color: Color(0xFFFFFFFF),
              ),
            ),

            const SizedBox(height: 18),

            // Date badge
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 6,
              ),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.4),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.green.withOpacity(0.5)),
              ),
              child: Text(
                item.date.toUpperCase(),
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Colors.greenAccent,
                ),
              ),
            ),

            const SizedBox(height: 22),

            // Organization
            Text(
              "by ${item.organization}",
              style: const TextStyle(
                fontSize: 16,
                color: Color(0xFF7AD17F),
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 28),


            // Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: onTap,
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.greenAccent,
                  side: const BorderSide(
                    color: Colors.greenAccent,
                    width: 2,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 18),
                ),
                child: Text(
                  "View Certificate",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
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


/*
flutter build web --base-href /omar-portfolio/

cp -r build/web/* . -Force

git add .
git commit -m "Deploy Flutter web to GitHub Pages"
git push origin main

 */
*/


