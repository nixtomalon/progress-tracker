<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

<p align="center"><img src="https://imgur.com/qAbFBpJ.png"></p>


<p align="center">A versatile and easy-to-use Flutter package for implementing progress tracking and status visualization in your applications.</p>

<p align="center">
<a href="https://pub.dev/packages/progress_tracker" target="_blank"><img src="https://img.shields.io/pub/v/progress_tracker" alt="Pub Version" /></a>
<a href="https://github.com/nixtomalon/progress-tracker/actions?query=workflow%3Apublish" target="_blank"><img src="https://github.com/nixtomalon/progress-tracker/actions/workflows/publish.yml/badge.svg?event=push" alt="CI" /></a>
<a href="https://pub.dev/packages/progress_tracker/score" target="_blank"><img src="https://img.shields.io/badge/dynamic/json?color=teal&label=popularity&query=popularity&url=http://www.pubscore.gq/popularity?package=progress_tracker" alt="popularity" /></a>
<a href="https://github.com/nixtomalon/progress-tracker/stargazers" target="_blank"><img src="https://img.shields.io/github/stars/nixtomalon/progress-tracker" alt="GitHub stars" /></a>
<a href="https://github.com/tenhobi/effective_dart" target="_blank"><img src="https://img.shields.io/badge/style-effective_dart-54C5F8.svg" alt="style: effective dart" /></a>
<a href="https://github.com/nixtomalon/progress-tracker/blob/main/LICENSE" target="_blank"><img src="https://img.shields.io/github/license/nixtomalon/progress-tracker" alt="GitHub license" /></a>
<a href="https://github.com/nixtomalon/progress-tracker/commits/main" target="_blank"><img src="https://img.shields.io/github/last-commit/nixtomalon/progress-tracker" alt="GitHub last commit" /></a>
</p>

## 🚀 Features

**✔️ Custom Step Indicators** – Use numbers or icons. <br>
**✔️ Adaptive Layout** – Adjusts based on screen size. <br>
**✔️ Tracker Placement Option** – Choose whether the tracker appears first or the line appears first.


## 🎥 Showcase

| Feature 1 | Feature 2 | Feature 3 |
|-----------|-----------|-----------|
| <img src="https://github.com/nixtomalon/progress_tracker/raw/main/assets/pt-sample-3.gif" width="246"/> | <img src="https://github.com/nixtomalon/progress_tracker/raw/main/assets/pt-sample-2.gif" width="246"/> | <img src="https://github.com/nixtomalon/progress_tracker/raw/main/assets/pt-sample-1.gif" width="246"/> |



## 📦 Installatioin

```bash
$ flutter pub add progress_tracker
```

## 🛠️ Usage🤔

```dart
ProgressTracker(
  currentIndex: 2, // Active step
  statusList: [
    Status(name: "Processed", icon: Icons.check),
    Status(name: "Shipped", icon: Icons.local_shipping),
    Status(name: "Enroute", icon: Icons.directions_car),
    Status(name: "Arrived", icon: Icons.home),
  ],
);
```

## 🎨 Customization

## ✅ Customize Step Number & Colors
```dart
ProgressTracker(
  showStepNumber: false, // Hide step numbers
  activeColor: Colors.blue, // Customize active color
);
```
## ✅ Choose Tracker Placement (Tracker First or Line First)
```dart
ProgressTracker(
  trackerAtStart: true,  // Tracker → Line → Tracker
);

ProgressTracker(
  trackerAtStart: false, // Line → Tracker → Line
);
```

## Feedback
* Please raise an issue <a href = "https://github.com/nixtomalon/progress_tracker/issues">here</a>.

## Contact me 📨
<a href="https://github.com/nixtomalon"><img src= "https://img.icons8.com/ios-glyphs/344/github.png" width = "40px"/></a> <a href="https://www.linkedin.com/in/norman-tomalon/"><img src= "https://img.icons8.com/color/344/linkedin.png" width = "40px"/></a> <a href="mailto:nonixtomalon@gmail.com"><img src= "https://img.icons8.com/color/344/gmail-new.png" width = "40px"/></a>
