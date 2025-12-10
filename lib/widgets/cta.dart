import 'package:flutter/material.dart';

class CtaPage extends StatefulWidget {
  const CtaPage({super.key});

  @override
  State<CtaPage> createState() => _CtaPageState();
}

class _CtaPageState extends State<CtaPage> {
  int count = 0;
  String text = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("CTA Demo")),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Compteur de clics
            Text(
              "Clicks : $count",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => setState(() => count++),
              child: const Text("Click me"),
            ),

            const SizedBox(height: 40),

            // Champ texte en direct
            TextField(
              decoration: const InputDecoration(
                labelText: "Tape quelque chose",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() => text = value);
              },
            ),

            const SizedBox(height: 20),
            Text(
              "Tu écris : $text",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}
