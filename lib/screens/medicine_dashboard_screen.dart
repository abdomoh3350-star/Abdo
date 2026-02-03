import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/subject_card.dart';

class MedicineDashboardScreen extends StatelessWidget {
  const MedicineDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      'Medical Academy',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Continue your medical studies',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 32),
                    GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 0.85,
                      children: [
                        SubjectCard(
                          title: 'Anatomy',
                          icon: Icons.accessibility_new_outlined,
                          progress: 0.4,
                          accentColor: AppColors.secondaryGreen,
                          heroTag: 'anatomy',
                          onTap: () {
                            // Not clickable in MVP
                          },
                        ),
                        SubjectCard(
                          title: 'Histology',
                          icon: Icons.blur_on_outlined,
                          progress: 0.6,
                          accentColor: AppColors.secondaryGreen,
                          heroTag: 'histology',
                          onTap: () {
                            // Not clickable in MVP
                          },
                        ),
                        SubjectCard(
                          title: 'Physiology',
                          icon: Icons.favorite_border_outlined,
                          progress: 0.45,
                          accentColor: AppColors.secondaryGreen,
                          heroTag: 'physiology',
                          onTap: () {
                            // Not clickable in MVP
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const BottomNavBar(currentIndex: 0),
          ],
        ),
      ),
    );
  }
}
