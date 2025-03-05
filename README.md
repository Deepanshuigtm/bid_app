# Bid.ai - Login System and Product Upload

![Bid.ai Logo](https://via.placeholder.com/150) <!-- Replace with actual logo URL if available -->

A Flutter-based mobile application featuring user authentication and product upload functionality, built with Firebase integration and a clean, intuitive UI following BID.ai's brand identity.

## Table of Contents
- [Overview](#overview)
- [Features](#features)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Core Specifications](#core-specifications)
  - [User Authentication](#1-user-authentication-login-system)
  - [Product Upload](#2-product-upload-section)
  - [UI & Design Guidelines](#3-ui--design-guidelines)
- [Technologies Used](#technologies-used)
- [Configuration](#configuration)
  - [Firebase Setup](#firebase-setup)
  - [Google Sign-In Setup](#google-sign-in-setup)
- [Screenshots](#screenshots)

## Overview
Bid.ai is a Flutter application designed to provide a seamless user experience for authentication and product management. It includes email/password login, Google Sign-In, and a product upload system with local image storage and Firestore integration.

## Features
- **User Authentication**: Secure login/signup with email/password and Google Sign-In.
- **Product Upload**: Add products with name, description, price, category, and image.
- **Local Storage**: Images are stored locally with paths saved in Firestore.
- **Responsive UI**: Clean, intuitive design adhering to BID.ai’s brand guidelines.

## Getting Started

### Prerequisites
- Flutter SDK (v3.x.x recommended)
- Dart (v3.x.x)
- Android Studio / VS Code
- Firebase account
- Google Cloud Console access (for Google Sign-In)

### Installation
1. **Clone the Repository**:
   ```bash
   [git clone https://github.com/Deepanshuigtm/bid_app]
   cd bid-ai
  #### Install Dependencies
```bash
flutter pub get
```
### Set Up Firebase

1. Add `google-services.json` (Android) to `android/app/`
2. Add `GoogleService-Info.plist` (iOS) to `ios/Runner/`
3. See [Firebase Setup](https://firebase.google.com/docs/flutter/setup) for details.

---

## ▶️ Run the App

```bash
flutter run
```

---

## 🔑 Core Specifications

### **1️⃣ User Authentication (Login System)**

#### ✅ Implementation
- Email & Password login/signup with validation.
- Google Sign-In integration.

#### 🔒 Backend
- Firebase Authentication for user management.

#### 🛡️ Security
- Passwords encrypted via Firebase.
- Secure OAuth flow for Google Sign-In.

#### ✅ Validation
- Ensures non-empty email and password fields.

---

### **2️⃣ Product Upload Section**

#### 📝 Fields
✅ **Product Name**: Text input.  
✅ **Description**: Multi-line text input.  
✅ **Price**: Numeric input with currency prefix.  
✅ **Image Upload**: Gallery/Camera selection, stored locally.  
✅ **Category**: Dropdown selection (**Electronics, Clothing, Furniture, Books, Other**).  

#### 📂 Storage
- Product data stored in **Firebase Firestore**.
- Images saved in local app directory (`product_images`), with paths stored in Firestore.

---

### **3️⃣ UI & Design Guidelines**

#### 🎨 Brand Identity
- Matches **BID.ai’s** branding based on the logo.

#### 🌈 Color Palette
🔵 **Primary Color**: `#0057FF` (Bright Blue)  
⚫ **Accent Color**: `#1A2B3C` (Deep Dark Blue)  
⚪ **Background**: `#FFFFFF` (White)  

#### ✨ Design
- **Clean, intuitive, and user-friendly interface**.
- Uses **Material Design** components (Flutter).
- **Smooth animations** and transitions for better UX.

---

## ⚙️ Technologies Used

### **📌 Framework and Language**
- **Flutter**: Frontend framework.
- **Dart**: Programming language.

### **🔥 Firebase**
- **Authentication**: Email/Password, Google Sign-In.
- **Firestore**: Product data storage.

### **📦 Packages**
- `firebase_auth`: Authentication.
- `cloud_firestore`: Database.
- `google_sign_in`: Google authentication.
- `image_picker`: Image selection.
- `path_provider`: Local storage access.
- `fluttertoast`: User feedback.

---

## 🔧 Configuration

### **Firebase Setup**

1. Create a Firebase project at [Firebase Console](https://console.firebase.google.com/).
2. Add Android and iOS apps:
   - **Android package**: `com.example.bid_app` (or your custom package).
   - **iOS bundle ID**: Match your Runner configuration.
3. Enable Authentication:
   - **Sign-in providers**: Email/Password, Google.
4. Enable Firestore:
   - Set up the database with default rules or use:

```yaml
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /{document=**} {
      allow read, write: if request.auth != null;
    }
  }
}
```

---

### **Google Sign-In Setup**

1. Enable **Google Sign-In** in Firebase Authentication.
2. Add **SHA-1 fingerprints** (debug and release) in Firebase Console.
3. Configure **OAuth 2.0 Client ID** in Google Cloud Console.
4. Update `AndroidManifest.xml` and `Info.plist` as per Google Sign-In docs.

---

## 📸 Screenshots

| Login Screen | Product Upload |
|-------------|---------
------|
| ![Sign up Screen](https://github.com/user-attachments/assets/13a2e5d5-987a-4352-82f9-07a37ab438a1) | ![Login]([assets/product_upload.png](https://github.com/user-attachments/assets/70a1e499-47d7-4ba1-a52d-9512767b898d) |

![Product Upload](https://github.com/user-attachments/assets/f4d6111c-c37b-4923-99aa-275e2b51b71d) | ![fill details](https://github.com/user-attachments/assets/4bd54092-1c57-4f8a-8675-cfa30c2cf6d0)



https://github.com/user-attachments/assets/e46a54f2-9b48-4b7f-8f60-2d6c47617685


<img width="1102" alt="Screenshot 2025-03-05 at 6 23 15 PM" src="https://github.com/user-attachments/assets/fd7b3f9b-3a44-47b9-ac05-c5dc185d60ab" />




