# QuestLearn Development Guide

## Prerequisites

### Required Software
- Flutter SDK (3.0.0 or higher)
- Dart SDK (comes with Flutter)
- Android Studio or VS Code
- Xcode (for iOS development, macOS only)
- Git

### Installation

#### Flutter Setup
```bash
# macOS/Linux
git clone https://github.com/flutter/flutter.git -b stable
export PATH="$PATH:`pwd`/flutter/bin"

# Verify installation
flutter doctor

# Windows: Download from https://flutter.dev
```

#### IDE Setup

**VS Code Extensions:**
- Flutter
- Dart
- Flutter Widget Snippets

**Android Studio Plugins:**
- Flutter
- Dart

## Getting Started

### 1. Clone and Setup
```bash
git clone <repository-url>
cd questlearn
flutter pub get
```

### 2. Run the App
```bash
# List available devices
flutter devices

# Run on specific device
flutter run -d <device-id>

# Run with hot reload (development)
flutter run

# Run in release mode
flutter run --release
```

### 3. Project Structure Navigation

```
lib/
├── main.dart                 # Start here - app entry point
├── providers/                # State management layer
├── router/                   # Navigation configuration
├── screens/                  # Full-screen UI components
├── widgets/                  # Reusable UI components
└── utils/                    # Constants and helpers
```

## Development Workflow

### Adding a New Screen

1. **Create the screen file**
```dart
// lib/screens/new_screen.dart
import 'package:flutter/material.dart';

class NewScreen extends StatelessWidget {
  const NewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('New Screen'),
        ),
      ),
    );
  }
}
```

2. **Add route in router**
```dart
// lib/router/app_router.dart
GoRoute(
  path: '/new-screen',
  builder: (context, state) => const NewScreen(),
),
```

3. **Navigate to screen**
```dart
context.go('/new-screen');  // Replace current screen
context.push('/new-screen'); // Push on stack
```

### Adding a New Widget

1. **Create widget file**
```dart
// lib/widgets/custom_card.dart
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const CustomCard({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(title),
      ),
    );
  }
}
```

2. **Import and use**
```dart
import '../widgets/custom_card.dart';

CustomCard(
  title: 'My Card',
  onTap: () => print('Tapped'),
)
```

### State Management with Provider

1. **Create a provider**
```dart
// lib/providers/my_provider.dart
import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}
```

2. **Register provider**
```dart
// lib/main.dart
MultiProvider(
  providers: [
    ChangeNotifierProvider(create: (_) => MyProvider()),
  ],
  child: const QuestLearnApp(),
)
```

3. **Use provider in widgets**
```dart
// Read and listen to changes
final myProvider = context.watch<MyProvider>();
Text('Count: ${myProvider.count}')

// Read without listening
final myProvider = context.read<MyProvider>();
myProvider.increment();
```

## Styling Guidelines

### Colors
Always use defined colors from `app_colors.dart`:
```dart
import '../utils/app_colors.dart';

Container(
  color: AppColors.primaryBlue,
)
```

### Typography
Use theme typography:
```dart
Text(
  'Title',
  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  ),
)
```

### Spacing
Use consistent spacing values:
```dart
const SizedBox(height: 8)   // Small
const SizedBox(height: 16)  // Medium
const SizedBox(height: 24)  // Large
const SizedBox(height: 32)  // Extra large
```

### Borders and Radius
Standard border radius: 12px
```dart
BorderRadius.circular(12)
```

## Animation Guidelines

### Button Tap Animation
```dart
bool _isPressed = false;

GestureDetector(
  onTapDown: (_) => setState(() => _isPressed = true),
  onTapUp: (_) => setState(() => _isPressed = false),
  onTapCancel: () => setState(() => _isPressed = false),
  onTap: () => doSomething(),
  child: AnimatedContainer(
    duration: const Duration(milliseconds: 150),
    transform: Matrix4.identity()..scale(_isPressed ? 0.98 : 1.0),
    child: YourWidget(),
  ),
)
```

### Progress Animation
```dart
late AnimationController _controller;
late Animation<double> _animation;

@override
void initState() {
  super.initState();
  _controller = AnimationController(
    duration: const Duration(milliseconds: 800),
    vsync: this,
  );
  _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
    CurvedAnimation(parent: _controller, curve: Curves.easeOut),
  );
  _controller.forward();
}

@override
void dispose() {
  _controller.dispose();
  super.dispose();
}
```

### Hero Animation
```dart
// Source screen
Hero(
  tag: 'unique-tag',
  child: Widget(),
)

// Destination screen
Hero(
  tag: 'unique-tag',
  child: Widget(),
)
```

## Testing

### Unit Tests
```bash
flutter test test/unit/
```

### Widget Tests
```bash
flutter test test/widget_test.dart
```

### Integration Tests
```bash
flutter test integration_test/
```

### Test Coverage
```bash
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
```

## Debugging

### Debug Mode
```bash
flutter run --debug
```

### Flutter DevTools
```bash
flutter pub global activate devtools
flutter pub global run devtools
```

### Common Issues

**Issue: Hot reload not working**
```bash
# Try hot restart
Press 'R' in terminal or Shift+R in IDE
```

**Issue: Build errors**
```bash
flutter clean
flutter pub get
flutter run
```

**Issue: Dependency conflicts**
```bash
flutter pub upgrade
```

## Code Quality

### Linting
```bash
flutter analyze
```

### Format Code
```bash
flutter format .
```

### Pre-commit Checks
```bash
flutter analyze && flutter test
```

## Performance Optimization

### Check Performance
```bash
flutter run --profile
```

### Performance Overlay
```dart
MaterialApp(
  showPerformanceOverlay: true,
)
```

### Tips
1. Use `const` constructors where possible
2. Avoid rebuilding large widget trees
3. Use `ListView.builder` for long lists
4. Dispose controllers and streams
5. Optimize images and assets

## Build for Production

### Android
```bash
# Debug APK
flutter build apk --debug

# Release APK
flutter build apk --release

# App Bundle (for Play Store)
flutter build appbundle --release
```

### iOS
```bash
# Development build
flutter build ios --debug

# Release build
flutter build ios --release
```

## Useful Commands

```bash
# Create new widget
flutter create --template=package my_widget

# Update dependencies
flutter pub upgrade

# Check outdated packages
flutter pub outdated

# Repair cache
flutter pub cache repair

# Doctor verbose
flutter doctor -v

# List devices
flutter devices

# Clean build
flutter clean
```

## Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [Dart Language Tour](https://dart.dev/guides/language/language-tour)
- [Provider Documentation](https://pub.dev/packages/provider)
- [GoRouter Documentation](https://pub.dev/packages/go_router)
- [Material Design 3](https://m3.material.io/)

## Contributing

1. Create a feature branch
2. Make your changes
3. Run tests and linting
4. Submit a pull request

## Support

For issues and questions, please create an issue in the repository.
