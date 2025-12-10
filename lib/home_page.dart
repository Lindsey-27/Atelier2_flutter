import 'package:flutter/material.dart';
import '../widgets/hero_section.dart';
import '../widgets/feature_card.dart';
import '../widgets/cta.dart';
import '../widgets/cta_section.dart';
import '../widgets/footer.dart';

class HomePage extends StatefulWidget {
  final bool isDark;
  final VoidCallback onToggleTheme;

  const HomePage({
    super.key,
    required this.isDark,
    required this.onToggleTheme,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final features = [
    Feature(title: "Fast Development", materialIcon: Icons.flash_on),
    Feature(title: "Modern UI", materialIcon: Icons.palette),
    Feature(title: "Hot Reload", materialIcon: Icons.refresh),
    Feature(title: "Cross-platform", materialIcon: Icons.devices),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Atelier Flutter"),
        actions: [
          Switch(
            value: widget.isDark,
            onChanged: (_) => widget.onToggleTheme(),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const HeroSection(),
          const SizedBox(height: 30),
          FeatureSection(features: features),
          const SizedBox(height: 30),
          const CtaSection(), // <- nouvelle section CTA
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CtaPage()),
              );
            },
            child: const Text("Voir ma Demo CTA"),
          ),
          const SizedBox(height: 30),
          const Footer(), // <- footer simple
        ],
      ),
    );
  }
}
