# 📱 Lec 6 – Flutter Firebase Class Exercises

This project is a complete Flutter app based on the class exercises from Android Lecture 6. It demonstrates key UI components, navigation patterns, and integration with **Firebase Authentication (Phone Login)**.

---

## 🔐 Test Phone Login

> **Phone number to use for testing:**
+15555215555

> **OTP (verification code):**
123456

These are dummy test credentials set in Firebase Authentication (Phone) test mode. No real SMS is sent.

---

## 🧩 Project Overview

### ✅ Exercise 1: Phone Number Login
- Two screens:
  1. `phone_input_screen.dart`: User enters a phone number.
  2. `otp_screen.dart`: User enters a 6-digit verification code.

### ✅ Exercise 2: Download Button
- Dummy download screen with a visual button.
- No download logic implemented yet.
- UI Example used:  
  https://docs.flutter.dev/assets/images/docs/cookbook/effects/DownloadButton.webp

### ✅ Exercise 3: Dashboard with Menu
- A screen named `DashboardScreen`.
- Right-side button shows a popup menu.
- Includes a back button to navigate back.

### ✅ Exercise 4: Bottom Navigation Bar
- Adds `BottomNavigationBar` to the Dashboard.
- Tabs:
  - 🏠 Home
  - ⚙️ Settings
  - 👤 Profile
- Each tab shows its own screen content.

### ✅ Exercise 5: Profile Screen
- Displays:
  - User’s photo
  - Contact details (email, phone)
  - Social links (LinkedIn, GitHub, etc.)

### ✅ Exercise 6: Settings & Items
- **Settings Screen** includes:
  - 🔘 Dark / Light theme toggle
  - ⚙️ Additional settings section
  - 📁 “My Files” section
  - 3 dummy toggle switches (e.g., Notifications, Sync, Backup)
- Navigation flows from Dashboard → Settings.
- **Item List Screen** shows dummy items (like a shopping list or catalog).

---

## 🔄 Navigation Flow

PhoneInputScreen  
    ↓  
OtpScreen  
    ↓  
DashboardScreen  
    ├── BottomNavigationBar → HomeScreen  
    ├── BottomNavigationBar → SettingsScreen  
    ├── BottomNavigationBar → ProfileScreen  

---

## 🚀 How to Run the App

1. Install Flutter and Dart SDK
2. Clone the repo
3. Run pub get:
   flutter pub get
4. Add Firebase configuration files:
   - google-services.json for Android
5. Run the app:
   flutter run

---

## 🧪 Firebase Setup for Test Login

To enable test phone login:

1. Go to Firebase Console → Authentication → Sign-in method → Phone
2. Enable Phone Provider
3. Under **Phone numbers for testing**, add:
   - Phone number: `+15555215555`
   - Verification code: `123456`

---

## 🧾 License

This project is for educational purposes under ORT Braude Lecture 6 exercises.
