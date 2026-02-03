# QuestLearn - Quick Start Guide

## 🚀 Get Started in 3 Minutes

### Prerequisites
- Flutter SDK 3.0.0 or higher
- Dart SDK (bundled with Flutter)
- iOS Simulator, Android Emulator, or physical device

### Installation

#### 1. Clone the Repository
```bash
git clone <repository-url>
cd questlearn
```

#### 2. Install Dependencies
```bash
flutter pub get
```

#### 3. Run the App
```bash
flutter run
```

That's it! 🎉

---

## 📱 First Run Guide

### What You'll See

1. **Onboarding Screen**
   - Enter any email (e.g., `student@example.com`)
   - Enter any password (min 6 characters)
   - Select **Engineering** or **Medicine**
   - Tap **Get Started**

2. **Dashboard**
   - **Engineering**: See Chemistry, Physics, Calculus
   - **Medicine**: See Anatomy, Histology, Physiology
   - All cards show progress bars
   - Tap **Calculus** (Engineering only) to start a quest

3. **Quest Screen**
   - Watch the smooth Hero animation
   - Read the mission: "Restore the Power"
   - View the circuit diagram
   - Enter your answer
   - Tap **Deploy Solution**

4. **Navigation**
   - Tap **Home** to return to dashboard
   - Tap **Profile** to view stats
   - Tap **Leaderboard** to see rankings

---

## 🎯 Quick Demo Path (for Pitch)

```
1. Launch app
   ↓
2. Enter email/password
   ↓
3. Select "Engineering"
   ↓
4. Tap "Get Started"
   ↓
5. View dashboard with progress
   ↓
6. Tap "Calculus" card
   ↓
7. Watch Hero animation ✨
   ↓
8. View quest problem
   ↓
9. Enter answer
   ↓
10. Tap "Deploy Solution"
   ↓
11. See success dialog
   ↓
12. Navigate to Profile
   ↓
13. Navigate to Leaderboard
```

**Total Demo Time**: ~90 seconds

---

## 🛠️ Troubleshooting

### Error: "flutter: command not found"
```bash
# Add Flutter to PATH
export PATH="$PATH:`pwd`/flutter/bin"

# Or download Flutter
https://docs.flutter.dev/get-started/install
```

### Error: "No devices found"
```bash
# List available devices
flutter devices

# Open iOS Simulator
open -a Simulator

# Or start Android Emulator from Android Studio
```

### Error: "Waiting for another flutter command"
```bash
# Kill existing Flutter processes
killall -9 dart
```

### Dependencies not resolving
```bash
flutter clean
flutter pub get
```

---

## 📦 Project Structure

```
questlearn/
├── lib/
│   ├── main.dart              # App entry
│   ├── screens/               # 6 screens
│   ├── widgets/               # 3 widgets
│   ├── providers/             # State
│   ├── router/                # Routes
│   └── utils/                 # Colors
├── assets/                    # Images/Icons
├── test/                      # Tests
└── Documentation/             # 10 docs
```

---

## 🎨 Key Features to Showcase

### 1. Hero Animation
**Location**: Engineering Dashboard → Calculus Quest  
**How**: Tap the Calculus card  
**Effect**: Smooth expansion animation

### 2. Progress Tracking
**Location**: Dashboard cards  
**What**: Animated progress bars fill on load  
**Colors**: Blue (Engineering), Green (Medicine)

### 3. Gamification
**Location**: Profile & Leaderboard  
**Elements**: Points, streaks, rankings, achievements

### 4. Clean Design
**Throughout**: Light mode, Outfit font, 12px radius  
**Colors**: White backgrounds, light gray cards, blue accents

---

## 📚 Documentation

| File | Purpose |
|------|---------|
| **README.md** | Project overview |
| **QUICKSTART.md** | This file |
| **FEATURES.md** | Feature details |
| **DEVELOPMENT.md** | Dev guide |
| **ARCHITECTURE.md** | Technical specs |
| **API_SPEC.md** | Future API |
| **CHECKLIST.md** | Implementation status |

---

## 🎯 Testing Scenarios

### Scenario 1: Engineering Student Flow
```
1. Select "Engineering"
2. View dashboard (blue theme)
3. See Chemistry 30%, Physics 50%, Calculus 70%
4. Tap Calculus
5. Complete quest
```

### Scenario 2: Medicine Student Flow
```
1. Select "Medicine"
2. View dashboard (green theme)
3. See Anatomy 40%, Histology 60%, Physiology 45%
4. View profile stats
5. Check leaderboard
```

### Scenario 3: Navigation Test
```
1. From any screen
2. Tap Home → Dashboard
3. Tap Profile → Profile screen
4. Tap Leaderboard → Rankings
5. All transitions smooth
```

---

## 🚨 Known MVP Limitations

✅ **By Design** (Not Issues)
- No real authentication (UI only)
- Hardcoded user data
- Single quest available
- Profile/Leaderboard are demos
- No backend connection

These are **intentional** for the MVP pitch and will be implemented in Phase 2 with Firebase.

---

## 🎬 For Investors/Judges

### Elevator Pitch (30 seconds)
"QuestLearn transforms education into an engaging game. Students select their major—Engineering or Medicine—and complete interactive quests to learn. Progress tracking, leaderboards, and smooth animations make learning addictive. Built with Flutter for iOS and Android, ready to scale with Firebase in Phase 2."

### Key Talking Points
1. **Problem**: Traditional education is boring
2. **Solution**: Gamified, subject-specific learning
3. **Market**: Engineering + Medicine students = millions
4. **Tech**: Modern Flutter architecture, scalable
5. **Traction**: MVP complete, pitch-ready

### Demo Flow (60 seconds)
1. **Open app** - "Clean, professional design"
2. **Select major** - "Personalized learning paths"
3. **View dashboard** - "Visual progress tracking"
4. **Start quest** - "Smooth animations, engaging UI"
5. **Complete challenge** - "Real problem-solving"
6. **Show leaderboard** - "Competitive element drives engagement"

---

## 🔗 Quick Links

- **Run App**: `flutter run`
- **Tests**: `flutter test`
- **Format**: `flutter format .`
- **Analyze**: `flutter analyze`
- **Build**: `flutter build apk` (Android)

---

## 💡 Pro Tips

### Hot Reload
- Press `r` in terminal for hot reload
- Press `R` for hot restart
- Changes apply instantly

### DevTools
```bash
flutter pub global activate devtools
flutter pub global run devtools
```

### VS Code Shortcuts
- `Ctrl+.` - Quick fixes
- `Alt+Shift+F` - Format document
- `F5` - Start debugging

---

## ✅ Success Checklist

Before your pitch/demo:
- [ ] App runs without errors
- [ ] Animations are smooth
- [ ] All navigation works
- [ ] Hero animation impresses
- [ ] Device is charged
- [ ] Backup device ready
- [ ] Practice demo path

---

## 📧 Support

**Issues?** Check:
1. Flutter version (`flutter --version`)
2. Doctor (`flutter doctor`)
3. Dependencies (`flutter pub get`)
4. Clean build (`flutter clean`)

**Still stuck?** Check documentation files or create an issue.

---

## 🎉 You're Ready!

Your QuestLearn app is ready to impress. Run `flutter run` and start your demo!

**Good luck with your Hult Prize pitch!** 🚀

---

**Version**: 1.0.0 MVP  
**Last Updated**: February 3, 2024  
**Status**: Production Ready ✅
