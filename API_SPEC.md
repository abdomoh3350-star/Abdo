# QuestLearn API Specification (Future Implementation)

## Overview
This document outlines the future API structure for QuestLearn when backend integration is implemented in Phase 2.

**Status**: Planned (Not yet implemented in MVP)  
**Backend**: Firebase (Recommended) or Custom REST API  
**Authentication**: Firebase Auth or JWT  

## Base URL
```
Development: https://api-dev.questlearn.app/v1
Production: https://api.questlearn.app/v1
```

## Authentication

### Sign Up
```http
POST /auth/signup
Content-Type: application/json

{
  "email": "student@example.com",
  "password": "securepassword",
  "major": "engineering" | "medicine"
}

Response 201:
{
  "userId": "uuid",
  "email": "student@example.com",
  "major": "engineering",
  "token": "jwt_token",
  "refreshToken": "refresh_token"
}

Response 400:
{
  "error": "Email already exists"
}
```

### Sign In
```http
POST /auth/signin
Content-Type: application/json

{
  "email": "student@example.com",
  "password": "securepassword"
}

Response 200:
{
  "userId": "uuid",
  "email": "student@example.com",
  "major": "engineering",
  "token": "jwt_token",
  "refreshToken": "refresh_token",
  "profile": {
    "name": "John Doe",
    "avatarUrl": "https://...",
    "totalPoints": 2450,
    "streak": 7
  }
}
```

## User Profile

### Get User Profile
```http
GET /users/{userId}
Authorization: Bearer {token}

Response 200:
{
  "userId": "uuid",
  "email": "student@example.com",
  "major": "engineering",
  "profile": {
    "name": "John Doe",
    "avatarUrl": "https://...",
    "createdAt": "2024-02-03T10:00:00Z",
    "lastActive": "2024-02-03T15:30:00Z"
  },
  "stats": {
    "totalPoints": 2450,
    "coursesCompleted": 12,
    "currentStreak": 7,
    "achievements": 18,
    "rank": 45
  }
}
```

### Update User Profile
```http
PATCH /users/{userId}
Authorization: Bearer {token}
Content-Type: application/json

{
  "name": "John Doe",
  "avatarUrl": "https://..."
}

Response 200:
{
  "userId": "uuid",
  "profile": { /* updated profile */ }
}
```

## Subjects & Progress

### Get All Subjects
```http
GET /subjects?major=engineering
Authorization: Bearer {token}

Response 200:
{
  "subjects": [
    {
      "id": "chemistry",
      "name": "Chemistry",
      "icon": "science_outlined",
      "description": "Explore chemical reactions and properties",
      "totalQuests": 20,
      "completedQuests": 6,
      "progress": 0.30,
      "points": 450
    },
    {
      "id": "physics",
      "name": "Physics",
      "icon": "bolt_outlined",
      "description": "Understand forces and motion",
      "totalQuests": 25,
      "completedQuests": 12,
      "progress": 0.50,
      "points": 780
    },
    {
      "id": "calculus",
      "name": "Calculus",
      "icon": "calculate_outlined",
      "description": "Master derivatives and integrals",
      "totalQuests": 30,
      "completedQuests": 21,
      "progress": 0.70,
      "points": 1220
    }
  ]
}
```

### Get Subject Details
```http
GET /subjects/{subjectId}
Authorization: Bearer {token}

Response 200:
{
  "id": "calculus",
  "name": "Calculus",
  "icon": "calculate_outlined",
  "description": "Master derivatives and integrals",
  "totalQuests": 30,
  "completedQuests": 21,
  "progress": 0.70,
  "points": 1220,
  "quests": [
    {
      "id": "calc-001",
      "title": "Mission: Restore the Power",
      "difficulty": "medium",
      "points": 50,
      "completed": true,
      "stars": 3
    },
    // ... more quests
  ]
}
```

### Update Subject Progress
```http
POST /subjects/{subjectId}/progress
Authorization: Bearer {token}
Content-Type: application/json

{
  "questId": "calc-001",
  "completed": true,
  "answer": "student_answer",
  "timeSpent": 120
}

Response 200:
{
  "questId": "calc-001",
  "correct": true,
  "pointsEarned": 50,
  "explanation": "Great work! The integral of 5sin(2πt) is...",
  "newProgress": 0.71,
  "totalPoints": 2500
}
```

## Quests

### Get Quest Details
```http
GET /quests/{questId}
Authorization: Bearer {token}

Response 200:
{
  "id": "calc-001",
  "subjectId": "calculus",
  "title": "Mission: Restore the Power",
  "description": "Calculate the integral to determine the current flow through the circuit.",
  "difficulty": "medium",
  "points": 50,
  "type": "calculation",
  "content": {
    "problem": "Calculate the integral to determine the current flow.",
    "equation": "∫ 5sin(2πt) dt = ?",
    "hints": [
      "Remember the integral of sin(x)",
      "Don't forget the coefficient"
    ],
    "imageUrl": "https://.../circuit-diagram.png"
  },
  "validation": {
    "type": "expression",
    "acceptedAnswers": [
      "-5/(2π)cos(2πt) + C",
      "-(5cos(2πt))/(2π) + C"
    ]
  },
  "timeLimit": 300,
  "attempts": 3
}
```

### Submit Quest Answer
```http
POST /quests/{questId}/submit
Authorization: Bearer {token}
Content-Type: application/json

{
  "answer": "-(5/(2π))cos(2πt) + C",
  "timeSpent": 120
}

Response 200:
{
  "correct": true,
  "pointsEarned": 50,
  "stars": 3,
  "explanation": "Excellent! The integral of 5sin(2πt) is indeed -(5/(2π))cos(2πt) + C",
  "nextQuestId": "calc-002",
  "achievements": [
    {
      "id": "first-calculus",
      "name": "Calculus Beginner",
      "icon": "badge_url"
    }
  ]
}

Response 200 (Incorrect):
{
  "correct": false,
  "attemptsRemaining": 2,
  "hint": "Check the coefficient and the derivative of cosine",
  "partialCredit": 10
}
```

## Leaderboard

### Get Global Leaderboard
```http
GET /leaderboard?limit=100&offset=0
Authorization: Bearer {token}

Response 200:
{
  "leaderboard": [
    {
      "rank": 1,
      "userId": "uuid",
      "name": "John D.",
      "avatarUrl": "https://...",
      "points": 5780,
      "major": "engineering",
      "streak": 30
    },
    {
      "rank": 2,
      "userId": "uuid",
      "name": "Emma S.",
      "avatarUrl": "https://...",
      "points": 4200,
      "major": "medicine",
      "streak": 15
    },
    // ... more entries
  ],
  "currentUser": {
    "rank": 45,
    "points": 2450
  },
  "total": 1250
}
```

### Get Subject Leaderboard
```http
GET /leaderboard/subject/{subjectId}?limit=50
Authorization: Bearer {token}

Response 200:
{
  "subject": "calculus",
  "leaderboard": [
    {
      "rank": 1,
      "userId": "uuid",
      "name": "Sarah K.",
      "points": 1450,
      "questsCompleted": 28
    },
    // ... more entries
  ]
}
```

## Achievements

### Get User Achievements
```http
GET /users/{userId}/achievements
Authorization: Bearer {token}

Response 200:
{
  "achievements": [
    {
      "id": "first-quest",
      "name": "First Steps",
      "description": "Complete your first quest",
      "icon": "trophy_url",
      "unlockedAt": "2024-02-01T10:00:00Z",
      "points": 10
    },
    {
      "id": "week-streak",
      "name": "Week Warrior",
      "description": "Maintain a 7-day streak",
      "icon": "fire_url",
      "unlockedAt": "2024-02-03T12:00:00Z",
      "points": 50
    }
  ],
  "totalAchievements": 18,
  "totalPoints": 450
}
```

### Get All Available Achievements
```http
GET /achievements
Authorization: Bearer {token}

Response 200:
{
  "achievements": [
    {
      "id": "first-quest",
      "name": "First Steps",
      "description": "Complete your first quest",
      "icon": "trophy_url",
      "points": 10,
      "unlocked": true
    },
    {
      "id": "master-calculus",
      "name": "Calculus Master",
      "description": "Complete all calculus quests",
      "icon": "master_url",
      "points": 200,
      "unlocked": false,
      "progress": 0.70
    }
  ]
}
```

## Notifications

### Get User Notifications
```http
GET /users/{userId}/notifications?unread=true
Authorization: Bearer {token}

Response 200:
{
  "notifications": [
    {
      "id": "notif-001",
      "type": "achievement",
      "title": "New Achievement Unlocked!",
      "message": "You've earned the 'Week Warrior' badge",
      "read": false,
      "createdAt": "2024-02-03T12:00:00Z",
      "data": {
        "achievementId": "week-streak"
      }
    },
    {
      "id": "notif-002",
      "type": "quest",
      "title": "New Quest Available",
      "message": "A new Calculus quest is ready for you",
      "read": false,
      "createdAt": "2024-02-03T09:00:00Z",
      "data": {
        "questId": "calc-015"
      }
    }
  ],
  "unreadCount": 5
}
```

## Analytics

### Get User Analytics
```http
GET /users/{userId}/analytics?period=week
Authorization: Bearer {token}

Response 200:
{
  "period": "week",
  "stats": {
    "questsCompleted": 12,
    "pointsEarned": 650,
    "timeSpent": 7200,
    "accuracy": 0.85,
    "streak": 7
  },
  "dailyActivity": [
    {
      "date": "2024-02-03",
      "quests": 2,
      "points": 100,
      "timeSpent": 1800
    }
  ],
  "topSubjects": [
    {
      "subject": "calculus",
      "points": 300,
      "quests": 5
    }
  ]
}
```

## Error Responses

### Standard Error Format
```json
{
  "error": {
    "code": "INVALID_INPUT",
    "message": "Email format is invalid",
    "details": {
      "field": "email",
      "reason": "Must be a valid email address"
    }
  }
}
```

### Error Codes
- `INVALID_INPUT` - 400 Bad Request
- `UNAUTHORIZED` - 401 Unauthorized
- `FORBIDDEN` - 403 Forbidden
- `NOT_FOUND` - 404 Not Found
- `CONFLICT` - 409 Conflict (e.g., email already exists)
- `RATE_LIMITED` - 429 Too Many Requests
- `INTERNAL_ERROR` - 500 Internal Server Error

## Rate Limiting
```
Standard: 100 requests per minute
Quest submissions: 10 per minute
Leaderboard: 20 requests per minute
```

## Webhooks (Future)
For real-time updates, consider WebSocket connections:
```
wss://api.questlearn.app/v1/ws?token={jwt_token}

Events:
- achievement.unlocked
- quest.available
- leaderboard.updated
- friend.activity
```

## Data Models

### User
```typescript
interface User {
  id: string;
  email: string;
  major: 'engineering' | 'medicine';
  profile: {
    name: string;
    avatarUrl?: string;
    createdAt: string;
    lastActive: string;
  };
  stats: {
    totalPoints: number;
    coursesCompleted: number;
    currentStreak: number;
    achievements: number;
    rank: number;
  };
}
```

### Subject
```typescript
interface Subject {
  id: string;
  name: string;
  icon: string;
  description: string;
  totalQuests: number;
  completedQuests: number;
  progress: number; // 0.0 to 1.0
  points: number;
}
```

### Quest
```typescript
interface Quest {
  id: string;
  subjectId: string;
  title: string;
  description: string;
  difficulty: 'easy' | 'medium' | 'hard';
  points: number;
  type: 'calculation' | 'multiple-choice' | 'essay';
  content: QuestContent;
  timeLimit?: number;
  attempts?: number;
}
```

## Implementation Notes

### Firebase Integration (Recommended)
```dart
// Use Firebase packages
dependencies:
  firebase_core: ^2.24.0
  firebase_auth: ^4.15.0
  cloud_firestore: ^4.13.0
  firebase_storage: ^11.5.0
```

### Local Data Caching
- Use sqflite or hive for offline support
- Cache subject progress
- Cache completed quests
- Sync when online

### Real-time Updates
- Use Firebase Realtime Database or Firestore streams
- Update leaderboard in real-time
- Push notifications for achievements
- Live progress tracking

## Security Considerations
- Always use HTTPS
- Implement JWT token refresh
- Validate all inputs server-side
- Rate limiting per user
- Encrypt sensitive data
- Implement proper CORS
- Audit logs for sensitive operations

## Testing Endpoints
Mock API available at: `https://mock-api.questlearn.app/v1`
