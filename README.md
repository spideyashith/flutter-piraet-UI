<div align="center">

# ☠️ Pirate Adventure Flutter App

### *Set sail on an animated Flutter journey across the seven seas!*

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-yellow?style=for-the-badge)
![Open Source](https://img.shields.io/badge/Open%20Source-%E2%9D%A4-red?style=for-the-badge)
![Contributions Welcome](https://img.shields.io/badge/Contributions-Welcome-brightgreen?style=for-the-badge)

<br/>

> **A creative Flutter animation demo app** — inspired by pirate adventure themes, featuring interactive UI animations, custom painters, particle effects, and game-style navigation. No backend required. Pure Flutter magic. 🗺️

<br/>

</div>


---

## ✨ Features

### 🌊 Start Screen
- Beautiful **ocean background** with a **twinkling star animation**
- **Glowing pirate logo** with pulsing glow effect
- **Floating pirate ship** that bobs on the waves
- **"Start Adventure"** button that triggers a ship-sailing transition animation to the map

### 🗺️ Pirate Map Screen
- **Old treasure map** background aesthetic
- **Dotted travel path** drawn with `CustomPainter`
- **Three clickable islands** — tap to navigate between them
- **Smooth ship movement** animation between island stops
- **Pulsing island markers** to highlight destinations
- **Treasure chest reveal** when the ship reaches the final island

### 💰 Treasure Event
- **Glowing treasure chest** reveal animation
- **Gold sparkle particle system** — simulates scattered gold effects
- Dramatic and rewarding visual payoff

### 🏝️ Mission Screen
- Individual **island mission pages**
- Displays the **island name** and context
- **Parallax ocean background** scroll effect for depth

---

## 🛠️ Tech Stack

| Technology | Purpose |
|---|---|
| **Flutter** | UI framework |
| **Dart** | Programming language |
| **AnimationController** | Driving all animations |
| **CustomPainter** | Drawing dotted paths & custom shapes |
| **Tween Animations** | Smooth value interpolation |
| **Stack Layout** | Layering UI elements |
| **GestureDetector** | Touch interactions on islands |
| **Particle Effects** | Gold sparkle simulation |

---

## 📁 Folder Structure

```
pirate-adventure-flutter/
│
├── lib/
│   └── main.dart               # App entry point & all screens
│
├── assets/
│   └── images/
│       ├── ocean_bg.jpg        # Ocean background
│       ├── map_bg.jpg          # Old treasure map background
│       ├── ship.png            # Pirate ship sprite
│       ├── pirate_logo.png     # Glowing pirate logo
│       ├── island1.png         # First island
│       ├── island2.png         # Second island
│       ├── island3.png         # Third island (final destination)
│       └── treasure.png        # Treasure chest
│
├── screenshots/                # App screenshots for README
├── pubspec.yaml                # Flutter dependencies & asset declarations
└── README.md
```

---

## 🚀 Installation & Setup

### Prerequisites
Make sure you have the following installed:
- ✅ [Flutter SDK](https://flutter.dev/docs/get-started/install) (latest stable)
- ✅ [Android Studio](https://developer.android.com/studio) or [VS Code](https://code.visualstudio.com/)
- ✅ Android device or emulator configured

### Steps

**1. Clone the repository**
```bash
git clone https://github.com/USERNAME/pirate-adventure-flutter.git
```

**2. Navigate into the project**
```bash
cd pirate-adventure-flutter
```

**3. Install dependencies**
```bash
flutter pub get
```

**4. Run the app**
```bash
flutter run
```

> 💡 **Tip:** Make sure your emulator is running or a physical device is connected before `flutter run`.

---

## ⚙️ How It Works

```
[ Start Screen ]
      │
      │  Tap "Start Adventure"
      │  → Ship sails across screen (AnimationController + Tween)
      ▼
[ Pirate Map Screen ]
      │
      │  CustomPainter draws dotted travel path
      │  Three islands rendered with GestureDetector
      │  Tap island → ship animates to destination
      │  Final island reached → Treasure chest appears
      ▼
[ Treasure Event ]
      │
      │  Chest glows on entry
      │  Particle system spawns gold sparkle effects
      ▼
[ Mission Screen ]
      │
      │  Island name & context displayed
      │  Parallax scroll effect on ocean background
      └─────────────────────────────────────────────
```

All animation is handled using Flutter's built-in `AnimationController`, `Tween`, and `CurvedAnimation` — no third-party animation libraries needed.

---

## 🔮 Future Improvements

Here are some ideas for expanding the project — contributions are very welcome! 👇

- [ ] 🎵 Add pirate-themed background music and sound effects
- [ ] 💾 Save progress using `shared_preferences` or `Hive`
- [ ] 🎮 Add mini-games on island mission screens
- [ ] 📱 iOS support and full platform testing
- [ ] 🌍 Multiple maps and level progression
- [ ] 🧭 Animated compass widget
- [ ] 🏴‍☠️ Character selection screen
- [ ] 🌐 Localization support (multiple languages)
- [ ] ♿ Accessibility improvements (screen reader support)

---

## 🤝 Contributing

This project is **100% open source** and contributions are warmly welcomed! Whether you're fixing a bug, improving animations, adding a new screen, or refactoring code — all help is appreciated. 🙌

### How to Contribute

1. **Fork** this repository
2. **Create** your feature branch
   ```bash
   git checkout -b feature/your-feature-name
   ```
3. **Commit** your changes
   ```bash
   git commit -m "Add: description of your changes"
   ```
4. **Push** to your branch
   ```bash
   git push origin feature/your-feature-name
   ```
5. **Open a Pull Request** and describe what you've added or changed

### Contribution Guidelines
- Keep code clean and well-commented
- Follow existing naming conventions
- Test on at least one Android device or emulator before submitting a PR
- Feel free to open an **Issue** first if you'd like to discuss a big change

> ⭐ If you find this project useful or fun, please consider **starring the repo** — it helps others discover it!

---

## 📄 License

This project is licensed under the **MIT License** — you are free to use, modify, and distribute it.

```
MIT License

Copyright (c) 2025 [Your Name]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction...
```

See the full [LICENSE](LICENSE) file for details.

---

## 👨‍💻 Author

<div align="center">

**Built with ❤️ and a love for Flutter animations**

| | |
|---|---|
| 👤 **Author** | [Ashith Fernandes] |
| 🐙 **GitHub** | [@spideyashith](https://github.com/spideyashith) |
| 📧 **Email** | ashithfernandes319@gmail.com |

*Feel free to reach out if you have questions, suggestions, or just want to talk Flutter!*

---

*"Not all treasure is silver and gold, mate." — Captain Jack Sparrow* ☠️

</div>
