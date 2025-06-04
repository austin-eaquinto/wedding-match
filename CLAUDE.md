# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Flutter-based wedding planning mobile application called "Wedding Match" that helps couples find and connect with wedding vendors through a Tinder-like matching interface. The app aims to revolutionize wedding planning by providing an all-in-one digital solution that guides couples from engagement through their wedding day.

## Development Commands

### Flutter Commands
- **Get dependencies**: `flutter pub get`
- **Run the app**: `flutter run`
- **Run tests**: `flutter test`
- **Build for iOS**: `flutter build ios`
- **Build for Android**: `flutter build apk`

### iOS Specific
- **Build iOS app**: `xcodebuild -scheme Runner -destination 'platform=iOS Simulator,name=iPhone 16 Plus' build`
- **Open iOS project**: Open `ios/Runner.xcworkspace` in Xcode

## Code Architecture

### App Structure
- **main.dart**: Entry point with MaterialApp setup and navigation to ChatFeature
- **chatFeature.dart**: Contains the main chat interface components (ChatFeature and ChatScreen)
- Current app shows "Engaged Dating Vendors" as the main title with a "Go to chat" button

### Navigation Pattern
The app uses Flutter's Navigator with MaterialPageRoute for screen transitions. The main flow is:
1. Home screen with "Engaged Dating Vendors" title
2. Navigation button to ChatFeature
3. ChatFeature contains another navigation to ChatScreen

### Code Style Guidelines
Based on `analysis_options.yaml`:
- Use single quotes for strings
- Always specify types explicitly
- Avoid print statements (use proper logging)
- Avoid unnecessary `new` keywords
- Prefer const constructors where possible

## Technical Stack
- **Frontend**: Flutter (Dart)
- **Target Platforms**: iOS and Android
- **Backend**: Planned Supabase (PostgreSQL with real-time capabilities)
- **State Management**: Not yet implemented (PRD suggests Bloc/Cubit or Provider)
- **Authentication**: Planned social providers (Google, Apple)

## Product Vision
The final product will include:
- Vendor discovery with swipe-based matching
- User onboarding for couples and vendors
- Profile management and preferences
- Real-time messaging
- Budget and planning tools
- Admin dashboard for vendor management

## Current Development Status
This appears to be in early development with basic navigation structure in place. The current implementation is minimal with placeholder chat functionality. The comprehensive PRD.txt file outlines the full feature set and technical requirements for the complete application.

## File Organization
- `lib/`: Main application code
- `android/`: Android-specific platform code
- `ios/`: iOS-specific platform code  
- `pubspec.yaml`: Flutter project configuration and dependencies
- `prd.txt`: Comprehensive product requirements document