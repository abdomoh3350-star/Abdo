# Contributing to QuestLearn

Thank you for your interest in contributing to QuestLearn! This document provides guidelines and instructions for contributing.

## Code of Conduct

- Be respectful and inclusive
- Welcome newcomers and help them learn
- Focus on constructive feedback
- Collaborate with empathy

## Getting Started

### 1. Fork the Repository
```bash
git clone https://github.com/your-username/questlearn.git
cd questlearn
```

### 2. Set Up Development Environment
```bash
# Install Flutter dependencies
flutter pub get

# Verify setup
flutter doctor

# Run the app
flutter run
```

### 3. Create a Branch
```bash
git checkout -b feature/your-feature-name
# or
git checkout -b fix/bug-description
```

## Development Workflow

### Branch Naming Convention
- `feature/` - New features (e.g., `feature/dark-mode`)
- `fix/` - Bug fixes (e.g., `fix/login-validation`)
- `refactor/` - Code refactoring (e.g., `refactor/state-management`)
- `docs/` - Documentation updates (e.g., `docs/api-spec`)
- `test/` - Adding tests (e.g., `test/profile-screen`)

### Commit Message Format
Follow the conventional commits specification:

```
<type>(<scope>): <subject>

<body>

<footer>
```

**Types:**
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code style changes (formatting, no logic change)
- `refactor`: Code refactoring
- `test`: Adding or updating tests
- `chore`: Maintenance tasks

**Examples:**
```bash
feat(quest): add hint system to quest screen
fix(auth): resolve email validation bug
docs(readme): update installation instructions
refactor(widgets): extract common card component
test(profile): add profile screen widget tests
```

## Code Standards

### Dart Style Guide
Follow the [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style):

```dart
// ✅ Good
class SubjectCard extends StatelessWidget {
  final String title;
  final double progress;
  
  const SubjectCard({
    super.key,
    required this.title,
    required this.progress,
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      // Implementation
    );
  }
}

// ❌ Bad
class SubjectCard extends StatelessWidget{
  String title;
  double progress;
  SubjectCard(this.title,this.progress);
  Widget build(context){
    return Container();
  }
}
```

### Formatting
```bash
# Format all files
flutter format .

# Format specific file
flutter format lib/screens/quest_screen.dart
```

### Linting
```bash
# Run linter
flutter analyze

# Fix auto-fixable issues
dart fix --apply
```

### Code Organization

#### File Structure
```
lib/
├── screens/          # Full-page screens
├── widgets/          # Reusable widgets
├── providers/        # State management
├── models/           # Data models
├── services/         # API services, utilities
├── utils/            # Constants, helpers
└── router/           # Navigation
```

#### Import Organization
```dart
// 1. Dart imports
import 'dart:async';
import 'dart:math';

// 2. Flutter imports
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// 3. Package imports
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

// 4. Relative imports
import '../providers/app_state_provider.dart';
import '../widgets/subject_card.dart';
```

### Widget Guidelines

#### Use Const Constructors
```dart
// ✅ Good
const Text('Hello')
const SizedBox(height: 16)
const EdgeInsets.all(20)

// ❌ Bad
Text('Hello')
SizedBox(height: 16)
EdgeInsets.all(20)
```

#### Extract Complex Widgets
```dart
// ✅ Good
class MyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildHeader(),
          _buildContent(),
        ],
      ),
    );
  }
  
  Widget _buildHeader() {
    return Container(/* ... */);
  }
  
  Widget _buildContent() {
    return Column(/* ... */);
  }
}

// Or create separate widget files
class HeaderWidget extends StatelessWidget { /* ... */ }
```

#### Dispose Resources
```dart
class MyWidget extends StatefulWidget {
  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  late AnimationController _controller;
  
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(/* ... */);
  }
  
  @override
  void dispose() {
    _controller.dispose(); // ✅ Always dispose
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
```

### State Management

#### Provider Pattern
```dart
// 1. Create provider
class MyProvider extends ChangeNotifier {
  int _count = 0;
  
  int get count => _count;
  
  void increment() {
    _count++;
    notifyListeners();
  }
}

// 2. Register provider
MultiProvider(
  providers: [
    ChangeNotifierProvider(create: (_) => MyProvider()),
  ],
  child: MyApp(),
)

// 3. Use provider
// Read and rebuild on changes
final provider = context.watch<MyProvider>();

// Read without rebuilding
final provider = context.read<MyProvider>();

// Select specific property
final count = context.select<MyProvider, int>((p) => p.count);
```

## Testing

### Writing Tests

#### Unit Tests
```dart
// test/unit/validation_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:questlearn/utils/validators.dart';

void main() {
  group('Email Validation', () {
    test('should return true for valid email', () {
      expect(isValidEmail('test@example.com'), true);
    });
    
    test('should return false for invalid email', () {
      expect(isValidEmail('invalid-email'), false);
    });
  });
}
```

#### Widget Tests
```dart
// test/widgets/subject_card_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:questlearn/widgets/subject_card.dart';

void main() {
  testWidgets('SubjectCard displays title', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SubjectCard(
            title: 'Calculus',
            icon: Icons.calculate,
            progress: 0.7,
            accentColor: Colors.blue,
            heroTag: 'test',
            onTap: () {},
          ),
        ),
      ),
    );
    
    expect(find.text('Calculus'), findsOneWidget);
    expect(find.text('70%'), findsOneWidget);
  });
}
```

#### Integration Tests
```dart
// integration_test/app_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:questlearn/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Complete user flow', (tester) async {
    app.main();
    await tester.pumpAndSettle();
    
    // Fill in email
    await tester.enterText(
      find.byType(TextFormField).first,
      'test@example.com',
    );
    
    // More test steps...
  });
}
```

### Running Tests
```bash
# Run all tests
flutter test

# Run specific test file
flutter test test/widgets/subject_card_test.dart

# Run with coverage
flutter test --coverage

# Run integration tests
flutter test integration_test/
```

## Pull Request Process

### 1. Before Submitting
- [ ] Code follows style guidelines
- [ ] All tests pass
- [ ] New tests added for new features
- [ ] Documentation updated
- [ ] No linting errors
- [ ] Commit messages follow convention

### 2. Checklist
```bash
# Run these before submitting
flutter analyze
flutter format .
flutter test
```

### 3. PR Template
When creating a PR, include:

```markdown
## Description
Brief description of changes

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Breaking change
- [ ] Documentation update

## Testing
Describe how you tested the changes

## Screenshots (if UI changes)
Add screenshots here

## Checklist
- [ ] Code follows style guidelines
- [ ] Tests added/updated
- [ ] Documentation updated
- [ ] No new warnings
```

### 4. Review Process
- PRs require at least one review
- Address all review comments
- Keep PRs focused and small
- Be responsive to feedback

## Feature Requests

### Proposing New Features
1. Check existing issues first
2. Create a new issue with:
   - Clear description
   - Use case/problem it solves
   - Proposed solution
   - Alternative solutions considered
   - Additional context

### Issue Template
```markdown
### Feature Description
Clear description of the feature

### Problem It Solves
What problem does this solve?

### Proposed Solution
How should it work?

### Alternatives Considered
Other approaches you've thought about

### Additional Context
Screenshots, mockups, etc.
```

## Bug Reports

### Reporting Bugs
1. Check if bug already reported
2. Create issue with:
   - Clear title
   - Steps to reproduce
   - Expected behavior
   - Actual behavior
   - Screenshots if applicable
   - Device/OS information
   - Flutter version

### Bug Report Template
```markdown
### Bug Description
Clear description of the bug

### Steps to Reproduce
1. Go to '...'
2. Click on '...'
3. See error

### Expected Behavior
What should happen

### Actual Behavior
What actually happens

### Screenshots
Add screenshots here

### Environment
- Device: [e.g., iPhone 12, Pixel 5]
- OS: [e.g., iOS 15, Android 12]
- Flutter version: [e.g., 3.0.0]
- App version: [e.g., 1.0.0]
```

## Documentation

### Updating Documentation
- Keep README.md current
- Update ARCHITECTURE.md for structural changes
- Update API_SPEC.md for API changes
- Add inline comments for complex code
- Update CHANGELOG.md

### Documentation Style
- Use clear, concise language
- Include code examples
- Add diagrams where helpful
- Keep formatting consistent

## Community

### Getting Help
- GitHub Issues for bugs/features
- Discussions for questions
- Discord/Slack for real-time chat (if available)

### Recognition
Contributors will be recognized in:
- CONTRIBUTORS.md file
- Release notes
- Project README

## License

By contributing, you agree that your contributions will be licensed under the MIT License.

## Questions?

Feel free to reach out if you have any questions. We're here to help!

Thank you for contributing to QuestLearn! 🚀
