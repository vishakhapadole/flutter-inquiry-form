# Flutter Reusable Button Widget

## Overview
This project implements a reusable custom button component in Flutter.

## Features
- Loading state support
- Custom styles (color, size, text)
- Clean architecture
- Follows SOLID principles

## Project Structure
lib/
 ├── widgets/
 │    └── reusable_button.dart
 ├── screens/
 │    └── home_screen.dart
 └── main.dart

## Usage Example
ReusableButton(
  text: "Submit",
  isLoading: false,
  onPressed: () {
    print("Button Pressed");
  },
)

## Tech Stack
- Flutter
- Dart

## Author
Vishakha Padole
