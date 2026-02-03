# QuestLearn Architecture

## Overview
QuestLearn is a Flutter-based mobile application with a clean, modular architecture following Flutter best practices.

## Tech Stack
- **Framework**: Flutter 3.0+
- **Language**: Dart
- **State Management**: Provider
- **Routing**: GoRouter
- **Fonts**: Google Fonts (Outfit)
- **Design System**: Material Design 3

## Directory Structure

```
lib/
├── main.dart                      # Application entry point
├── providers/                     # State management
│   └── app_state_provider.dart    # Global app state (major selection, navigation)
├── router/                        # Navigation configuration
│   └── app_router.dart            # GoRouter configuration with all routes
├── screens/                       # Full-page screens
│   ├── onboarding_screen.dart     # Authentication & major selection
│   ├── engineering_dashboard_screen.dart
│   ├── medicine_dashboard_screen.dart
│   ├── quest_screen.dart          # Interactive quest with Hero animation
│   ├── profile_screen.dart        # User profile
│   └── leaderboard_screen.dart    # Competition rankings
├── widgets/                       # Reusable components
│   ├── bottom_nav_bar.dart        # Persistent navigation bar
│   ├── major_selection_card.dart  # Interactive major selection cards
│   └── subject_card.dart          # Subject cards with progress tracking
└── utils/                         # Utilities and constants
    └── app_colors.dart            # App-wide color definitions
```

## State Management

### AppStateProvider
- **Purpose**: Manages global application state
- **Responsibilities**:
  - Selected major (Engineering/Medicine)
  - Current navigation index
  - Dashboard routing logic
- **Implementation**: ChangeNotifier with Provider

## Routing

### Route Structure
```
/onboarding                 → OnboardingScreen
/engineering-dashboard      → EngineeringDashboardScreen
/medicine-dashboard         → MedicineDashboardScreen
/quest/calculus            → QuestScreen
/profile                   → ProfileScreen
/leaderboard               → LeaderboardScreen
```

### Navigation Flow
1. User starts at `/onboarding`
2. Selects major (Engineering or Medicine)
3. Navigates to appropriate dashboard
4. Can access Profile and Leaderboard via bottom nav
5. Can start quests from dashboard cards

## Design System

### Color Scheme
```dart
White: #FFFFFF         // Primary background
Light Gray: #F1F4F8    // Cards, secondary elements
Primary Blue: #4B39EF  // Buttons, Engineering accent
Secondary Green: #2EA44F // Medicine accent
```

### Typography
- **Font Family**: Outfit (via Google Fonts)
- **Headings**: Bold, 24-28px
- **Body Text**: Regular, 14-16px
- **Captions**: Light, 12px

### Component Standards
- **Border Radius**: 12px for all cards and buttons
- **Elevation**: 4-8dp for cards with soft shadows
- **Padding**: 16-24px standard spacing
- **Card Aspect Ratio**: 0.85 for subject cards

## Key Features

### 1. Hero Animations
- **Implementation**: Flutter's Hero widget
- **Usage**: Calculus card → Quest screen
- **Duration**: 300-400ms
- **Tag**: 'calculus' (unique identifier)

### 2. Progress Animations
- **Type**: AnimationController with CurvedAnimation
- **Curve**: Curves.easeOut
- **Duration**: 800ms
- **Trigger**: On card mount

### 3. Interactive Feedback
- **Scale Animations**: Buttons scale to 0.98-1.02 on tap
- **Shadow Depth**: Increases on button press
- **Color Transitions**: AnimatedContainer (200ms)

## Widget Patterns

### Stateful vs Stateless
- **Stateless**: Used for static display components
- **Stateful**: Used for interactive components with animations

### Animation Best Practices
1. Use SingleTickerProviderStateMixin for single animations
2. Dispose controllers in dispose() method
3. Use AnimatedContainer for simple property animations
4. Use AnimationController for complex animations

### State Management Pattern
```dart
// Reading state
final appState = context.watch<AppStateProvider>();

// Modifying state
final appState = context.read<AppStateProvider>();
appState.selectMajor(Major.engineering);
```

## Performance Considerations

1. **Lazy Loading**: GridView with shrinkWrap for efficient rendering
2. **Const Constructors**: Used throughout for widget reuse
3. **Animation Controllers**: Properly disposed to prevent memory leaks
4. **Hero Animations**: Optimized with Material/transparent for smooth transitions

## Future Enhancements

### Phase 2 (Backend Integration)
- Firebase Authentication
- Firestore for user data
- Real-time progress syncing
- Cloud Functions for leaderboard

### Phase 3 (Advanced Features)
- Push notifications
- Social features
- Achievement system
- Dark mode support
- Offline mode with local storage

## Testing Strategy

### Unit Tests
- Provider state changes
- Business logic
- Utility functions

### Widget Tests
- Component rendering
- User interactions
- Navigation flows

### Integration Tests
- End-to-end user journeys
- Hero animation transitions
- State persistence

## Build & Deployment

### Development
```bash
flutter run
```

### Production
```bash
# Android
flutter build apk --release

# iOS
flutter build ios --release
```

### CI/CD Recommendations
- GitHub Actions for automated testing
- Fastlane for iOS/Android deployment
- Firebase App Distribution for beta testing

## Conventions

### File Naming
- **Screens**: `*_screen.dart`
- **Widgets**: Descriptive names (e.g., `subject_card.dart`)
- **Providers**: `*_provider.dart`

### Code Style
- Follow `analysis_options.yaml` rules
- Use `flutter_lints` package
- Prefer const constructors
- Single quotes for strings

### Git Workflow
- Feature branches for new features
- Descriptive commit messages
- PR reviews before merging
