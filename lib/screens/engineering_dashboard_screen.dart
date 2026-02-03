import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../utils/app_colors.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/subject_card.dart';

class EngineeringDashboardScreen extends StatelessWidget {
  const EngineeringDashboardScreen({super.key});

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
                      'Engineering Hub',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Continue your learning journey',
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
                          title: 'Chemistry',
                          icon: Icons.science_outlined,
                          progress: 0.3,
                          accentColor: AppColors.primaryBlue,
                          heroTag: 'chemistry',
                          onTap: () {
                            // Not clickable in MVP
                          },
                        ),
                        SubjectCard(
                          title: 'Physics',
                          icon: Icons.bolt_outlined,
                          progress: 0.5,
                          accentColor: AppColors.primaryBlue,
                          heroTag: 'physics',
                          onTap: () {
                            // Not clickable in MVP
                          },
                        ),
                        SubjectCard(
                          title: 'Calculus',
                          icon: Icons.calculate_outlined,
                          progress: 0.7,
                          accentColor: AppColors.primaryBlue,
                          heroTag: 'calculus',
                          isClickable: true,
                          onTap: () {
                            context.push('/quest/calculus');
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
