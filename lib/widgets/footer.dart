import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      color: colorScheme.surface,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: Column(
        children: [
          Text(
            "Suivez-nous sur les réseaux",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.facebook),
              SizedBox(width: 16),
              Icon(Icons.alternate_email),
              SizedBox(width: 16),
              Icon(Icons.work),
              SizedBox(width: 16),
              Icon(CupertinoIcons.mail),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            "© 2025 Mon Atelier Flutter",
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
