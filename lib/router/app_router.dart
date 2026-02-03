import 'package:go_router/go_router.dart';
import '../screens/onboarding_screen.dart';
import '../screens/engineering_dashboard_screen.dart';
import '../screens/medicine_dashboard_screen.dart';
import '../screens/quest_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/leaderboard_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/onboarding',
  routes: [
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: '/engineering-dashboard',
      builder: (context, state) => const EngineeringDashboardScreen(),
    ),
    GoRoute(
      path: '/medicine-dashboard',
      builder: (context, state) => const MedicineDashboardScreen(),
    ),
    GoRoute(
      path: '/quest/calculus',
      builder: (context, state) => const QuestScreen(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: '/leaderboard',
      builder: (context, state) => const LeaderboardScreen(),
    ),
  ],
);
