# QuestLearn - Gamified Educational Mobile App

A modern, gamified educational mobile application built with Flutter for Engineering and Medicine students.

## Features

- **Dual Major System**: Separate dashboards for Engineering and Medicine students
- **Gamified Learning**: Progress tracking with interactive subject cards
- **Hero Animations**: Smooth transitions between screens for enhanced UX
- **Quest System**: Interactive problem-solving missions
- **Profile & Leaderboard**: Track progress and compete with peers
- **Light Mode Design**: Clean, minimalist UI with professional color scheme

## Tech Stack

- **Framework**: Flutter (Dart)
- **State Management**: Provider
- **Routing**: GoRouter
- **Fonts**: Google Fonts (Outfit)
- **Design**: Material Design 3

## Color Scheme

- **White**: #FFFFFF (Background)
- **Light Gray**: #F1F4F8 (Cards, Secondary elements)
- **Primary Blue**: #4B39EF (Buttons, Primary actions)
- **Secondary Green**: #2EA44F (Medical subjects)

## Getting Started

### Prerequisites

- Flutter SDK (>=3.0.0)
- Dart SDK
- iOS Simulator or Android Emulator

### Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd questlearn
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

## Project Structure

```
lib/
├── main.dart                 # App entry point
├── providers/                # State management
│   └── app_state_provider.dart
├── router/                   # Navigation configuration
│   └── app_router.dart
├── screens/                  # UI screens
│   ├── onboarding_screen.dart
│   ├── engineering_dashboard_screen.dart
│   ├── medicine_dashboard_screen.dart
│   ├── quest_screen.dart
│   ├── profile_screen.dart
│   └── leaderboard_screen.dart
├── widgets/                  # Reusable components
│   ├── bottom_nav_bar.dart
│   ├── major_selection_card.dart
│   └── subject_card.dart
└── utils/                    # Utilities
    └── app_colors.dart
```

## Screens

1. **Onboarding Screen** (`/onboarding`)
   - Email/password authentication
   - Major selection (Engineering/Medicine)

2. **Engineering Dashboard** (`/engineering-dashboard`)
   - Chemistry, Physics, and Calculus subjects
   - Progress tracking for each subject

3. **Medicine Dashboard** (`/medicine-dashboard`)
   - Anatomy, Histology, and Physiology subjects
   - Green-themed design for medical subjects

4. **Quest Screen** (`/quest/calculus`)
   - Interactive problem-solving
   - Hero animation from dashboard card
   - Circuit diagram visualization

5. **Profile Screen** (`/profile`)
   - User statistics
   - Course completion tracking

6. **Leaderboard Screen** (`/leaderboard`)
   - Top performers display
   - Competition rankings

## Animations

- **Hero Animations**: Smooth transitions from subject cards to quest screen
- **Button Interactions**: Scale and shadow effects on tap
- **Progress Bars**: Animated fill transitions
- **Page Transitions**: Fade and slide effects

## Development

### Running Tests
```bash
flutter test
```

### Building for Production
```bash
# Android
flutter build apk

# iOS
flutter build ios
```

## Future Enhancements

- Firebase integration for backend
- Real-time database for user progress
- Push notifications for quest reminders
- Social features and friend system
- More subjects and quests
- Achievement system
- Dark mode support

## License

This project is part of a Hult Prize pitch.

## Contributors

Built with ❤️ for education
