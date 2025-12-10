import 'package:flutter/material.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          bool isWide = constraints.maxWidth >= 600;

          Widget image = Image.network(
            'https://picsum.photos/300/200',
            width: isWide ? 300 : double.infinity,
            height: 200,
            fit: BoxFit.cover,
          );

          Widget textContent = Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: isWide
                    ? CrossAxisAlignment.start
                    : CrossAxisAlignment.center,
                children: [
                  Text(
                    "Bienvenue dans Flutter",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Apprends à créer des interfaces responsive, réutilisables et modernes.",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("CTA cliqué !")),
                      );
                    },
                    child: const Text("Commencer"),
                  ),
                ],
              ),
            ),
          );

          return SingleChildScrollView(
            child: isWide
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [image, textContent],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [image, const SizedBox(height: 16), textContent],
                  ),
          );
        },
      ),
    );
  }
}
