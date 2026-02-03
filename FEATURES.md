# QuestLearn Features Documentation

## MVP Features (v1.0.0)

### 1. Authentication & Onboarding

#### Sign-Up Interface
- **Email Input Field**
  - Material Design text field
  - Email format validation
  - Error messages for invalid input
  - Light gray background (#F1F4F8)
  
- **Password Input Field**
  - Obscured text input
  - Minimum 6 characters validation
  - Password visibility toggle (future enhancement)
  - Secure input handling

- **Major Selection**
  - Two interactive cards: Engineering and Medicine
  - Visual selection feedback
  - Border highlight on selection
  - Icon-based representation
  - Smooth tap animations

- **Get Started Button**
  - Primary blue background (#4B39EF)
  - 12px border radius
  - Tap animation with scale effect
  - Form validation before navigation
  - Routes to appropriate dashboard

#### Navigation Flow
```
Onboarding → Major Selection → Dashboard
```

### 2. Engineering Dashboard

#### Layout
- Clean header with "Engineering Hub" title
- Grid-based subject display (2 columns)
- Bottom navigation bar
- Responsive padding and spacing

#### Subject Cards
1. **Chemistry**
   - Science beaker icon
   - 30% progress
   - Blue accent color
   - Non-clickable (display only)

2. **Physics**
   - Lightning bolt icon
   - 50% progress
   - Blue accent color
   - Non-clickable (display only)

3. **Calculus** ⭐ (Featured)
   - Calculator icon
   - 70% progress
   - Blue accent color
   - **Clickable** - Opens Quest Screen
   - Hero animation enabled
   - "Start Quest" badge

#### Card Features
- Soft shadow elevation (8dp)
- 12px border radius
- Light gray background (#F1F4F8)
- Animated progress bars (800ms fill)
- Icon in colored circle
- Progress percentage display
- Tap feedback on Calculus card

### 3. Medicine Dashboard

#### Layout
- Clean header with "Medical Academy" title
- Grid-based subject display (2 columns)
- Green color theme for medical subjects
- Bottom navigation bar

#### Subject Cards
1. **Anatomy**
   - Human figure icon
   - 40% progress
   - Green accent color (#2EA44F)

2. **Histology**
   - Microscope-style icon
   - 60% progress
   - Green accent color

3. **Physiology**
   - Heart icon
   - 45% progress
   - Green accent color

#### Design Differences
- Green accent instead of blue
- Medical-themed icons
- Same card structure as Engineering
- Currently all display-only (no quests in MVP)

### 4. Quest Screen (Calculus)

#### Hero Animation
- Smooth transition from Calculus card
- Card expands into full circuit diagram
- 300-400ms duration
- Material widget for transparency
- Reverse animation on back navigation

#### Content Structure
1. **Header Bar**
   - Back button with label
   - Clean navigation

2. **Circuit Diagram**
   - Custom Canvas painting
   - Blue-themed visualization
   - Resistor symbols
   - Current flow arrows
   - Interactive placeholder for future

3. **Mission Card**
   - Flag icon
   - "Mission: Restore the Power" title
   - Blue background highlight
   - Engaging typography

4. **Challenge Section**
   - Problem statement
   - Integral equation display
   - Mathematical notation
   - Light gray background card
   - Clear typography

5. **Input Field**
   - Multi-line text input (3 lines)
   - "Enter your answer" placeholder
   - Edit icon prefix
   - Light gray background

6. **Deploy Solution Button**
   - Large, prominent button (60px height)
   - Rocket icon + text
   - Primary blue background
   - Tap animation with scale (1.02x)
   - Dynamic shadow depth
   - Success dialog on submission

#### Animations
- Fade-in content (600ms delay)
- Button scale on tap
- Shadow depth changes
- Hero transition

### 5. Profile Screen

#### User Information
- Circular avatar placeholder
- "Student Profile" title
- Major badge (Engineering/Medicine)
- Clean centered layout

#### Statistics Cards
1. **Courses Completed**
   - School icon
   - Value: 12
   - Blue accent

2. **Total Points**
   - Trophy icon
   - Value: 2,450
   - Blue accent

3. **Current Streak**
   - Trending up icon
   - Value: 7 days
   - Blue accent

4. **Achievements**
   - Stars icon
   - Value: 18
   - Blue accent

#### Card Design
- Light gray background
- Icon in colored container
- Title and value display
- Consistent spacing
- Soft shadows

#### Future Features Notice
- "Coming soon" banner
- Construction icon
- Sets expectations

### 6. Leaderboard Screen

#### Top 3 Podium
- Visual podium display
- Different heights for ranks
- Medal colors:
  - 🥇 Gold (#FFD700) - 1st place
  - 🥈 Silver (#C0C0C0) - 2nd place
  - 🥉 Bronze (#CD7F32) - 3rd place
- Student names and points
- Gradient background
- Engaging visual hierarchy

#### Leaderboard List
- Ranked entries (4th-8th)
- Rank number in circle
- Student name
- Points display
- Light gray cards
- Consistent spacing

#### Sample Data
1. John D. - 5,780 pts
2. Emma S. - 4,200 pts
3. Lisa M. - 3,890 pts
4. Alex Johnson - 3,250 pts
5. Maria Garcia - 3,100 pts
(+ more)

#### Future Features Notice
- "Real-time leaderboard coming soon"
- Sets expectations for backend integration

### 7. Bottom Navigation Bar

#### Tabs
1. **Home** 
   - Home icon (outlined/filled)
   - Routes to appropriate dashboard
   - Maintains major selection

2. **Profile**
   - Person icon (outlined/filled)
   - Routes to profile screen
   - Shows user statistics

3. **Leaderboard**
   - Trophy icon (outlined/filled)
   - Routes to leaderboard
   - Shows competition

#### Design
- Light gray background (#F1F4F8)
- Active state: Primary blue (#4B39EF)
- Inactive state: Gray text
- Icon + label layout
- Smooth transitions
- Tap animation (scale down)
- Background highlight on active

#### Behavior
- Persistent across screens
- State management via Provider
- Smooth navigation transitions
- Active tab indication
- Accessible labels

## Animation System

### 1. Hero Animations
**Calculus Card → Quest Screen**
- Tag: 'calculus'
- Duration: 300-400ms
- Smooth expansion
- Maintains visual continuity

### 2. Progress Animations
**Subject Card Progress Bars**
- Type: AnimationController
- Duration: 800ms
- Curve: Curves.easeOut
- Animates from 0 to target percentage
- Triggers on card mount

### 3. Button Animations
**Tap Feedback**
- Scale: 0.98-1.0 or 1.0-1.02
- Duration: 150ms
- Shadow depth changes
- GestureDetector based

### 4. Page Transitions
**Navigation**
- GoRouter default transitions
- Smooth fade/slide
- Material motion principles

### 5. Nav Bar Animations
**Tab Selection**
- Icon switch (outlined ↔ filled)
- Color transition (200ms)
- Background highlight
- Scale feedback

## Design System

### Color Palette
```dart
Primary Colors:
- White: #FFFFFF (Backgrounds)
- Light Gray: #F1F4F8 (Cards, inputs)
- Primary Blue: #4B39EF (Engineering, buttons)
- Secondary Green: #2EA44F (Medicine)

Text Colors:
- Text Primary: #101213
- Text Secondary: #57636C
```

### Typography
```dart
Font Family: Outfit (Google Fonts)

Headings:
- Display: 28px, Bold
- Headline: 24px, Bold
- Title: 20px, Bold

Body:
- Large: 16px, Regular
- Medium: 14px, Regular
- Small: 12px, Regular
```

### Spacing System
```dart
Extra Small: 4px
Small: 8px
Medium: 12px
Large: 16px
Extra Large: 20px
XXL: 24px
XXXL: 32px
Huge: 40px
```

### Component Standards
```dart
Border Radius: 12px (all components)
Card Elevation: 4-8dp
Button Height: 56-60px
Icon Size: 24-48px
Input Padding: 16px horizontal, 16px vertical
```

## State Management

### AppStateProvider
**Manages:**
- Selected major (Engineering/Medicine)
- Current navigation index
- Dashboard routing logic

**Methods:**
- `selectMajor(Major major)` - Set user's major
- `setNavIndex(int index)` - Update nav bar index
- `dashboardRoute` - Get appropriate dashboard route

**Usage:**
```dart
// Watch for changes
final appState = context.watch<AppStateProvider>();

// Modify state
context.read<AppStateProvider>().selectMajor(Major.engineering);
```

## User Flow

### Complete User Journey
1. **App Launch** → Onboarding Screen
2. **Enter Credentials** → Email + Password
3. **Select Major** → Engineering or Medicine
4. **Tap Get Started** → Navigate to Dashboard
5. **View Subjects** → See progress on cards
6. **Tap Calculus** → Hero animation to Quest
7. **View Problem** → Read mission and equation
8. **Enter Answer** → Type solution
9. **Deploy Solution** → See success message
10. **Return Home** → Back to dashboard
11. **Check Profile** → View statistics
12. **View Leaderboard** → See rankings

### Navigation Paths
```
Onboarding
├── Engineering Dashboard
│   ├── Quest (Calculus)
│   ├── Profile
│   └── Leaderboard
└── Medicine Dashboard
    ├── Profile
    └── Leaderboard
```

## Accessibility Features (MVP)

- Semantic widgets
- Readable font sizes
- High contrast colors
- Touch targets (48x48 minimum)
- Clear visual feedback
- Descriptive labels

## Performance Characteristics

- Smooth 60 FPS animations
- Efficient widget rebuilds
- Optimized image rendering
- Lazy loading where applicable
- Minimal memory footprint
- Fast navigation transitions

## Future Enhancements (Planned)

### Phase 2
- [ ] More quests for all subjects
- [ ] Firebase authentication
- [ ] Real-time progress sync
- [ ] Achievement badges
- [ ] Push notifications
- [ ] Daily challenges

### Phase 3
- [ ] Dark mode
- [ ] Friend system
- [ ] Quest collaboration
- [ ] Advanced analytics
- [ ] Offline mode
- [ ] Multi-language support

## Testing Coverage

### Unit Tests
- Provider state management
- Validation logic
- Utility functions

### Widget Tests
- Screen rendering
- Button interactions
- Navigation flows
- Animation triggers

### Integration Tests (Planned)
- Complete user journeys
- Cross-screen navigation
- State persistence
