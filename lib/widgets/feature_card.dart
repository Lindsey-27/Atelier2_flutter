import 'package:flutter/material.dart';

class Feature {
  final String title;
  final IconData? materialIcon;
  final IconData? cupertinoIcon;

  Feature({required this.title, this.materialIcon, this.cupertinoIcon});
}

class FeatureSection extends StatelessWidget {
  final List<Feature> features;

  const FeatureSection({super.key, required this.features});

  int _getCrossAxisCount(double width) {
    if (width < 600) return 1;
    if (width < 900) return 2;
    return 3;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = _getCrossAxisCount(constraints.maxWidth);

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.5,
          ),
          itemCount: features.length,
          itemBuilder: (context, index) {
            final feature = features[index];

            Widget iconWidget;
            if (feature.materialIcon != null) {
              iconWidget = Icon(
                feature.materialIcon,
                size: 40,
                color: Theme.of(context).colorScheme.primary,
              );
            } else if (feature.cupertinoIcon != null) {
              iconWidget = Icon(
                feature.cupertinoIcon,
                size: 40,
                color: Theme.of(context).colorScheme.primary,
              );
            } else {
              iconWidget = const SizedBox.shrink();
            }

            return Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    iconWidget,
                    const SizedBox(height: 12),
                    Text(
                      feature.title,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
