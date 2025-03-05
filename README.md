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
- [Contributing](#contributing)
- [License](#license)

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
   git clone https://github.com/your-username/bid-ai.git
   cd bid-ai
